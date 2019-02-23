#### Utility functions

#' Correct Markov chain sample count for autocorrelation.
#'
#' The output of a Markov chain sampling process is autocorrelated; therefore,
#' the effective number of samples is less than the actual number of samples
#' collected.  This function computes the corrected value.
#'
#' This function is currently just a thin wrapper around
#' \code{\link[coda]{effectiveSize}}.  As noted below, the method used in this
#' calculation is not ideal, so eventually we will replace this with something
#' more sophisticated.
#'
#'
#' @section Note:
#'
#' The effective sample size is computed as \deqn{N_e =
#' \frac{N}{1+2\sum_{k=1}^\infty} \rho(k),} where \eqn{\rho(k)} is the
#' autocorrelation at lag \eqn{k}.  We calculate this independently for each
#' sampled variable and return the result as a vector.  Generally, if these
#' values differ greatly, you will want the smallest value reported.
#'
#' Andrew Gelman makes the following observation about this calculation:
#'
#' \dQuote{[This definition] for effective sample size doesn’t quite work
#' in practice because (a) you can’t sum to infinity, and (b) it will be too
#' optimistic for chains that haven’t mixed. We have an effective sample size
#' estimate that addresses both these concerns. It’s in formulas (11.7) and
#' (11.8) in Section 11.5 of BDA3.
#'
#' If you don’t have a copy of BDA, it’s also in the Stan manual, on pages
#' 353-354 of the manual for Stan version 2.14.0.}
#' (\url{https://www.johndcook.com/blog/2017/06/27/effective-sample-size-for-mcmc/#comment-933045})
#'
#' We have gone with the simpler definition for now, since this package is
#' mostly intended for light-duty work, but we should consider putting in the
#' more sophisticated version at some point.
#'
#' @param samps Matrix of samples, with samples in rows and variables in columns
#' @return Vector of N_e values, one for each variable
#' @export
neff <- function(samps)
{
    coda::effectiveSize(samps)
}