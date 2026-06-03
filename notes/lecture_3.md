# Lecture 3 - KKT

- sketch level-sets

$h(x)=0$ tangential to level-sets

$\nabla h x^\star$ colinear to$\nabla f x^\star$

$\nabla f x^\star + \nu^\star \nabla h x^\star = 0$
stationary at $x^\star$

## Corresponding Lagrangian

- Dual Function

$d(\lambda,\nu) = \inf \mathcal{L}(x,\lambda,\nu)$

- Weak duality
  $d \leq f^\star$

Can we find $\lambda,\nu$ such that equality holds?

Constraint qualification

- **Slater's Condition**
  $g<0, h=0$

- **Strong duality**
  If Slater's Condition hold then exists
  $\lambda \geq 0$ s.t. $d = f^\star$
  - **Proof**
    - Set 1, Set 2: separated by hyperplane
    - Slater implies $\alpha > 0$
  - divide by alpha, get lambda,nu star

## KKT

OP convex, Slater satisfied
x minimizer
$\lambda,\nu$ maximizer

- 4 Conditions
  - stationary Lagrangian
  - primal feasibility
  - dual feasibility
  - complementary slackness

Lecture shows proof in 1 direction:

Given $x^\star, (\lambda^\star,\nu^\star)$
show $\mathcal{L} = f^\star$

<!-- TODO: compare! -->

Script shows other direction.

- **Remark** Without Slater
  - KKT1-4 imply
    $x^\star, (\lambda^\star,\nu^\star)$
    optimizer of primal/dual
  - **but** there might be optimizer that don't satisfy KKT1-4

- **Interpretations**
  - Mechanics:
    Force balance where lines $g_i$ cross
  - Economics:
    Sensitivity of Elastizität

## Subdifferential

**Example** $l_1$-norm, not differential at 0

**Idea**

$$
f(x)\geq f(\bar{x})+\nabla f(\bar{x})\T(x-\bar{x})
\forall x,\bar{x}\in \mathbb{R}^{n}
$$

Reorder to Subdifferential $\partial f$

For convex $f$

$$
x^\star\in\arg \min_x f(x)
\Leftrightarrow
0 \in \partial f(x^\star)
$$

Important Properties

- f differential: subdiff f = diff f
- additivity
- scales for non-negative factor
