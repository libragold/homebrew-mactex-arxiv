# homebrew-mactex-arxiv

A Homebrew tap providing a **pinned `mactex-no-gui` formula** that matches the
TeX Live / MacTeX version currently used by [arXiv.org]().

> **Current arXiv TeX Live version:** **2023**

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
```

Install the pinned MacTeX (no-GUI) distribution:

```bash
brew install --cask libragold/mactex-arxiv/mactex-no-gui-arxiv
```

## Staying in sync with arXiv

- The formula follows the TeX Live version listed on [arXiv’s TeX Live FAQ](https://info.arxiv.org/help/faq/texlive.html).
- When arXiv upgrades, this tap will be updated. Run `brew upgrade` to pick up the new version.

## Contributing

Pull requests to bump the formula when arXiv changes its TeX Live version,
or to fix build issues on new macOS releases, are welcome.