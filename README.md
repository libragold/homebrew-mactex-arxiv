# homebrew-mactex-arxiv

A Homebrew tap providing a **pinned `mactex-no-gui` formula** that matches the
TeX Live / MacTeX version currently used by [arXiv.org](https://arxiv.org).
This makes it easy to reproduce the PDF output that arXiv generates from
your LaTeX sources.

---

## Why this tap?

arXiv usually lags a year or so behind the latest TeX Live release.
Installing the exact version they run allows you to:

* reproduce arXiv’s PDF output bit-for-bit,
* catch compatibility issues before submission,
* avoid surprises from features or packages that arXiv’s servers don’t yet support.

---

## Installation

First, add the tap:

```bash
brew tap libragold/mactex-arxiv