% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dcem_star_train.R
\name{dcem_star_train}
\alias{dcem_star_train}
\title{dcem_star_train: Part of DCEM package.}
\usage{
dcem_star_train(data, threshold, iteration_count,  num_clusters, seeding)
}
\arguments{
\item{data}{(dataframe): The dataframe containing the data. See \code{\link{trim_data}} for
cleaning the data.}

\item{threshold}{(decimal): A  value to check for convergence (if the means are within this
value then the algorithm stops and exit). \strong{Default: 0.00001}.}

\item{iteration_count}{(numeric): The number of iterations for which the algorithm should run, if the
convergence is not achieved within the specified count then the algorithm stops and exit.
\strong{Default: 200}.}

\item{num_clusters}{(numeric): The number of clusters. Default: \strong{2}}

\item{seeding}{(string): The initialization scheme ('rand', 'improved'). Default: \strong{rand}}
}
\value{
A list of objects. This list contains parameters associated with the Gaussian(s)
        (posterior probabilities, mean, standard-deviation and priors). The
        parameters can be accessed as follows where sample_out is the list containing
        the output:

\enumerate{
        \item (1) Posterior Probabilities: \strong{sample_out$prob}
        A matrix of posterior-probabilities

        \item (2) Mean(s): \strong{sample_out$mean}

        For multivariate data: It is a matrix of means for the Gaussian(s). Each row in
        the  matrix corresponds to a mean for the Gaussian.

        For univariate data: It is a vector of means. Each element of the vector
        corresponds to one Gaussian.

        \item (3) Co-variance matrices: \strong{sample_out$cov}

        For multivariate data: List of co-variance matrices for the Gaussian(s).

        Standard-deviation: \strong{sample_out$sd}

        For univariate data: Vector of standard deviation for the Gaussian(s))

        \item (4) Priors: \strong{sample_out$prior}
        A vector of priors for the Gaussian(s).
        }
}
\description{
Implements the improved EM* algorithm. EM\* achieves faster convergence by avoiding
revisitng the data during the iterations. For details on EM* see the 'References' section
below. It calls the relevant clustering routine internally \code{\link{dcem_star_cluster_uv}}
(univariate data) and \code{\link{dcem_star_cluster_mv}} (multivariate data).
}
\examples{
# Simulating a mixture of univariate samples from three distributions
# with mean as 20, 70 and 100 and standard deviation as 10, 100 and 40 respectively.
sample_uv_data = as.data.frame(c(rnorm(100, 20, 10), rnorm(70, 70, 100), rnorm(50, 100, 40)))

# Randomly shuffle the samples.
sample_uv_data = as.data.frame(sample_uv_data[sample(nrow(sample_uv_data)),])

# Calling the dcem_star_train() function on the simulated data with threshold of
# 0.000001, iteration count of 1000 and random seeding respectively.
sample_uv_out = dcem_star_train(sample_uv_data, num_clusters = 3, iteration_count = 100,
threshold = 0.001)

# Simulating a mixture of multivariate samples from 2 gaussian distributions.
sample_mv_data = as.data.frame(rbind(MASS::mvrnorm(n=100, rep(2,5), Sigma = diag(5)),
MASS::mvrnorm(n=50, rep(14,5), Sigma = diag(5))))

# Calling the dcem_star_train() function on the simulated data with threshold of
# 0.00001, iteration count of 100 and random seeding method respectively.
sample_mv_out = dcem_star_train(sample_mv_data, threshold = 0.001, iteration_count = 100)

sample_mv_out$mean
#[1,]  2.053163  2.023351  2.017288  1.999596  1.983142
#[2,] 13.948244 14.010651 13.897140 14.285898 13.752592

}
\references{
Using data to build a better EM: EM* for big data.

Hasan Kurban, Mark Jenne, Mehmet M. Dalkilic
(2016) <https://doi.org/10.1007/s41060-017-0062-1>.
}
\author{
Parichit Sharma \email{parishar@iu.edu}, Hasan Kurban, Mark Jenne, Mehmet Dalkilic

This work is partially supported by NCI Grant 1R01CA213466-01.
}