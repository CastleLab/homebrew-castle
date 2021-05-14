# homebrew-castle

The [Homebrew](https://brew.sh/) tap useful for SE research in [CASTLE Research Group](http://sccpu2.cse.ust.hk/castle/index.html).

## Installation

```bash
brew tap CastleLab/toolbox
```

## Contribution

Add new Homebrew formula under folder [`./taps`](./taps) with appropriate categorization.

Optionally, there is a git pre-commit hook [`pre-commit`](./pre-commit) to link formulas defined in `taps` to `Formula` folder. 
Enable the pre-commit hook by: 
```bash
chmod +x `pwd`/pre-commit
ln -s `pwd`/pre-commit `pwd`/.git/hooks/pre-commit
```