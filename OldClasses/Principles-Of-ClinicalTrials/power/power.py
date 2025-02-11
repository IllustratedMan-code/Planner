from scipy.stats import norm, t
import math

# continuous sample size calculation


class stat:
    def __init__(self, delta, sigma, alpha, beta):
        self.power = 1 - beta
        self.alpha = alpha
        self.delta = delta
        self.sigma = sigma
        self.variance = self.sigma**2
        self.significance = 1 - (alpha / 2)

    def zvalue(self, probability):
        return norm.ppf(probability)

    def tvalue(self, probability, df):
        return t.ppf(probability, df)

    def n_from_z(self):
        return (
            ((self.zvalue(self.significance) + self.zvalue(self.power)) ** 2)
            * self.variance
            / (self.delta**2)
        )

    def n_from_t(self):
        return (
            (
                (
                    self.tvalue(self.significance, self.n_from_z() - 1)
                    + self.tvalue(self.power, self.n_from_z() - 1)
                )
                ** 2
            )
            * self.variance
            / (self.delta**2)
        )

    @property
    def sample_size(self):
        return {"z-test": self.n_from_z(), "t-test": self.n_from_t()}


alpha = 0.005
beta = 0.005  # power of 99.5%
sigma = 22
delta = 20

print(stat(delta, sigma, alpha, beta).sample_size)
