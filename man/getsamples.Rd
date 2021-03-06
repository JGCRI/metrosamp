% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{getsamples}
\alias{getsamples}
\title{Extract matrix of samples from a \code{metrosamp} object}
\usage{
getsamples(mcruns, thinto = NULL, includelp = FALSE)
}
\arguments{
\item{mcruns}{A \code{metrosamp} object or a list of \code{metrosamp} objects.}

\item{thinto}{Total number of samples to thin the sample array to.  Many analysis
operations scale as \eqn{O(N)} or \eqn{O(N \ln N)}, so thinning can speed these
up pretty substantially, especially for runs with poor sampling efficiency.}

\item{includelp}{If true, return the log-posterior values in a list with the sample
matrix.}
}
\value{
If \code{includelp} is \code{FALSE}, a matrix of samples, otherwise, a list
with the sample matrix and the vector of log-posterior values.
}
\description{
Given a metrosamp object, or a list of \code{metrosamp} objects, extract the
matrix of parameter samples.  Optionally, also extract the log-posterior
values.
}
\details{
If the input is a list of \code{metrosamp} objects, then their samples are
merged into a single grand matrix of results.  Doing this discards the
information about which samples came from which Markov chains.
}
