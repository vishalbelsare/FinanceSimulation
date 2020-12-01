
from functools import partial

import numpy as np
from scipy.optimize import LinearConstraint, minimize

from .metrics import sharpe_ratio


def optimized_portfolio_on_sharperatio(r, cov, rf, minweight=0.):
    func = partial(sharpe_ratio, r=r, cov=cov, rf=rf)
    nbstocks = len(r)
    initialguess = np.repeat(1 / nbstocks, nbstocks)
    constraints = [
        LinearConstraint(np.eye(nbstocks), minweight, 1.),
        LinearConstraint(np.array([np.repeat(1, nbstocks)]), 1, 1)
    ]
    return minimize(
        lambda weights: -func(weights),
        initialguess,
        constraints=constraints
    )



