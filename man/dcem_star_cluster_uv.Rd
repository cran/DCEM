% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dcem_star_cluster_uv.R
\name{dcem_star_cluster_uv}
\alias{dcem_star_cluster_uv}
\title{dcem_star_cluster_uv (univariate data): Part of DCEM package.}
\usage{
dcem_star_cluster_uv(data, meu, sigma, prior, num_clusters, num_data,
iteration_count)
}
\arguments{
\item{data}{(matrix): The dataset provided by the user.}

\item{meu}{(vector): The vector containing the initial meu.}

\item{sigma}{(vector): The vector containing the initial standard deviation.}

\item{prior}{(vector): The vector containing the initial priors.}

\item{num_clusters}{(numeric): The number of clusters specified by the user. Default is 2.}

\item{num_data}{(numeric): number of rows in the dataset (After processing the missing values).}

\item{iteration_count}{(numeric): The number of iterations for which the algorithm should run.
If the convergence is not achieved then the algorithm stops. Default is 100.}
}
\value{
A list of objects. This list contains parameters associated with the
        Gaussian(s) (posterior probabilities, meu, standard-deviation and priors)

\enumerate{
        \item (1) Posterior Probabilities: \strong{prob}
        A matrix of posterior-probabilities

        \item (2) Meu: \strong{meu}: It is a vector of meu. Each element of
        the vector corresponds to one meu.

        \item (3) Sigma: Standard-deviation(s): \strong{sigma}

        For univariate data: Vector of standard deviation.

        \item (4) Priors: \strong{prior}: A vector of priors.

        \item (5) Membership: \strong{membership}: A vector of cluster membership for data.
        }
}
\description{
Implements the EM* algorithm for the univariate data. This function is called by the
dcem_star_train routine.
}
\references{
Parichit Sharma, Hasan Kurban, Mehmet Dalkilic DCEM: An R package for clustering big data via
data-centric modification of Expectation Maximization, SoftwareX, 17, 100944 URL
https://doi.org/10.1016/j.softx.2021.100944
}
