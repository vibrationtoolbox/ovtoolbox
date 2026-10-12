# Copilot instructions: Engineering Vibration Toolbox for Octave

This repo is an Octave package (`vtoolbox`), not an application. There is no build system, test suite, or linter.

## Layout and packaging

- Package metadata lives at the repo root: `DESCRIPTION` (name, version, date), `INDEX` (function list for `pkg`/`doc`), `PKG_ADD`, `COPYING`.
- All code and data live in `inst/`. Octave's `pkg install` copies `inst/` flat onto the load path, so every file in `inst/` is a top-level function or data file.

## Install and verify

`pkg install` needs a tarball containing a single top-level directory. To test local changes:

```sh
mkdir /tmp/t && cp -R . /tmp/t/vtoolbox && rm -rf /tmp/t/vtoolbox/.git
tar czf /tmp/t/v.tar.gz -C /tmp/t vtoolbox
octave-cli --norc --eval "pkg uninstall vtoolbox; pkg install /tmp/t/v.tar.gz; pkg load vtoolbox; help vtoolbox"
```

Run a single function by calling it, e.g. `vtb1_1(1,.1,1,1,0,10)`. Most functions plot, so a graphics toolkit is needed. `doc_cache_create: unusable help text` warnings during install are known and harmless.

`inst/vtbud.m` is the end-user installer/updater. It installs the `vtoolbox.tar.gz` asset of the latest GitHub release (not `master`), so changes reach users only after a release is published.

## Releasing

Every commit that is pushed must also be released: bump the version, push, and publish a GitHub release (do not push without releasing).

1. Bump `Version`/`Date` in `DESCRIPTION` and add a `ChangeLog.rst` row; commit and push.
2. Push a tag `vX.Y.Z`; `.github/workflows/release.yml` builds the tarball (single top-level dir), checks it installs, and publishes the release with the constant asset name `vtoolbox.tar.gz`, which `vtbud` and the Readme URL depend on:

```sh
git tag vX.Y.Z && git push origin vX.Y.Z
```

The tag must be `v` plus the `DESCRIPTION` version (the workflow fails otherwise); `vtbud` compares them. Do not also run `gh release create`.

## Architecture and naming

- `vtb#_#.m` is chapter `#`, section `#` (e.g. `vtb1_1`: free response of a single degree of freedom system). `vtb#.m` is the chapter's table of contents (its help block lists the chapter's functions). `vtb.m` is the top-level menu.
- Other files: `vtb#_#ex`, `vtb8_e1`, `p8_*`, `e8_*` are examples/problems. `.con`, `.eqn`, `.out`, `.txt`, `.mat` files in `inst/` are data read by the codes (e.g. `truss1.*`, `vtb7_3_*.mat`); do not rename them.
- `help vtoolbox` is served by `inst/vtoolbox.m`. Octave only shows help for a real function or file of that name, so a package-name help topic must exist as a function.
- Functions often accept several argument forms and dispatch on `nargin` (e.g. `vtb1_1` takes `m,c,k,x0,v0,tf` or `zeta,w,x0,v0,tf`). Preserve every documented form when editing, and keep the help comment block in sync.
- Help text is the leading comment block of each `.m` file; its first line (`%vtb1_1 Short description.`) feeds `lookfor`.

## Conventions when adding or changing a function

1. Add or update the `.m` file in `inst/` with its help block.
2. Add it to the chapter's `vtb#.m` listing and to `INDEX`.
3. Add a row at the top of the table in `ChangeLog.rst` (date `MM/DD/YY`, file, description).
4. Bump `Version` and `Date` in `DESCRIPTION` for user-visible changes.
5. Update `Readme.rst` if install or usage steps change.

## Known state

- `vtb8_1` (graphical preprocessor) writes the `.con` file read by `vtb8_2`; it needs a mouse (`ginput`). Verify changes by stubbing `ginput`/`uiputfile` on the path and piping input to `octave-cli`.
- `PKG_ADD` is intentionally silent (its load message is commented out); do not re-enable it.
- Do not commit editor backup files (`*~`); `inst/vtbud.m~` is a stray one.
