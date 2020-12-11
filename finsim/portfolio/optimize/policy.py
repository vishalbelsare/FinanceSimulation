
from itertools import product
from abc import ABC, abstractmethod

import numpy as np
import pandas as pd

from .numerics import optimized_portfolio_on_sharperatio


class OptimizedWeightingPolicy(ABC):
    def __init__(self, rf, r=None, cov=None, symbols=None, minweight=0.):
        self.rf = rf
        self.optimized = False
        self.minweight = minweight

        self.optimized = False
        if r is not None and cov is not None:
            self.optimize(r, cov, symbols=symbols)

    @abstractmethod
    def optimize(self, r, cov, symbols=None):
        assert len(r) == cov.shape[0]
        assert cov.shape[0] == cov.shape[1]
        if symbols is not None:
            assert len(r) == len(symbols)

        self.r = r
        self.cov = cov
        self.symbols = symbols if symbols is not None else list(range(len(r)))

    @property
    def portfolio_symbols(self):
        return self.symbols

    @property
    @abstractmethod
    def weights(self):
        pass

    @property
    @abstractmethod
    def portfolio_yield(self):
        pass

    @property
    @abstractmethod
    def volatility(self):
        pass

    @property
    def correlation_matrix(self):
        corr = np.zeros(self.cov.shape)
        for i, j in product(range(self.cov.shape[0]), range(self.cov.shape[1])):
            corr[i, j] = self.cov[i, j] / np.sqrt(self.cov[i, i] * self.cov[j, j])
        return corr

    @property
    def named_correlation_matrix(self):
        corrdf = pd.DataFrame(self.correlation_matrix,
                              columns=self.symbols,
                              index=self.symbols)
        return corrdf

    @property
    def portfolio_summary(self):
        summary = {
            'components': [
                {
                    'symbol': sym,
                    'yield': self.r[i],
                    'weight': self.weights[i],
                    'volatility': np.sqrt(self.cov[i, i])
                }
                for i, sym in enumerate(self.symbols)
            ],
            'yield': self.optimized_portfolio_yield,
            'volatility': self.optimized_volatility,
            'correlation': self.correlation_matrix
        }
        return summary


class OptimizedWeightingPolicyUsingMPTSharpeRatio(OptimizedWeightingPolicy):
    def optimize(self, r, cov, symbols=None):
        super(OptimizedWeightingPolicyUsingMPTSharpeRatio, self).optimize(r, cov, symbols=symbols)
        self.optimized_sol = optimized_portfolio_on_sharperatio(r, cov, self.rf, minweight=self.minweight)
        self.optimized = True

        self.optimized_weights = self.optimized_sol.x
        self.optimized_sharpe_ratio = -self.optimized_sol.fun
        self.optimized_portfolio_yield = np.sum(self.optimized_weights * self.r)
        sqweights = np.matmul(
            np.expand_dims(self.optimized_weights, axis=1),
            np.expand_dims(self.optimized_weights, axis=0)
        )
        self.optimized_volatility = np.sqrt(np.sum(sqweights * self.cov))


    @property
    def weights(self):
        return self.optimized_weights

    @property
    def portfolio_yield(self):
        return self.optimized_portfolio_yield

    @property
    def volatility(self):
        return self.optimized_volatility

    @property
    def sharpe_ratio(self):
        return self.optimized_sharpe_ratio

    @property
    def portfolio_summary(self):
        summary = super(OptimizedWeightingPolicyUsingMPTSharpeRatio, self).portfolio_summary
        summary['sharpe_ratio'] = self.optimized_sharpe_ratio
        return summary


class OptimizedWeightingPolicyUsingMPTCostFunction(OptimizedWeightingPolicy):
    pass
