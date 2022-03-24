# Changelog

<!--next-version-placeholder-->

## v0.6.1 (2022-03-24)

### Fix
* Incompatible geoviews package for latest holoviews release ([`5baa575`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/5baa575acfcff1ec6c861adfc700f7aaf8a46865))

### Documentation
* Add warning to update pinnings regularly ([`5b40fbc`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/5b40fbcea47ecfbe90027844899e086400ab31a7))

## v0.6.0 (2021-07-12)
### Feature
* Add flopy to default packages ([`e92819b`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/e92819b0688f079ca80830e4df9fcad014b3cb33))
* Add pyvizcomm for Holoviews/Jupyter Lab 3.0 compatibility ([`7a7eacf`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/7a7eacf634c3f8a8f0fc7c14925e6df39ae04c85))
* Add datashader to worker_env ([`ee8a49a`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/ee8a49ac6edbecc66ba9636903a6bd840a05e29e))
* Add package adjust_text ([`00bbfe8`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/00bbfe8461c871c1278f1458f24678d5e7be76a0))
* Remove firefox, geckodriver and selenium dependencies, as they are not reliable enough ([`fd18aae`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/fd18aae5c8a20502ff60b4e32988acf543c3fc7f))
* Add pyepsg package to worker_env ([`2e2ea2f`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/2e2ea2fa8458e4a5b93b632f5ab3c6e7f1021382))
* Update Dockerfile to JupyterLab 3.0 compatibility ([`65615aa`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/65615aab3fe6407360f41669c89aec99c3b48e0b))

### Fix
* Move config to ServerApp transition ([`fbd83fe`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/fbd83fe3c389740f5b5dda69e6c22807676b3012))
* Remove nodejs not needed anymore for Jupyter Lab 3.0 ([`a6008a3`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/a6008a33b0c8d3a3a55be6691485f7727ce06984))
* /home/alex reference to notebooks in compose; update readme ([`97f3525`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/97f35259a2039613379158bb259ee0cf83b9614e))
* Do not use nbextensions install in jupyterlab 3.0 ([`0edd466`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/0edd4661d0e6476377b1ce8e607f8a9ff0dfbfde))
* Use commented default values in .env.example ([`8ea4401`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/8ea44015777c574dba95f7eafff15b9ae4b681f7))
* Ipywidgets not yet released ([`96ac9ba`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/96ac9ba21b3677ee7b3abdbb5997c65c6352cf22))
* Environment_default.yml ipywidgets pinning ([`89c2f1e`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/89c2f1edf6973ed0a2918d1b453746bb20877c2f))

### Documentation
* Add list of packages and links to documentations to readme ([`2229554`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/2229554742d0508dc1815ccea44cecb5676016e2))
* Update Readme.md with branch shuffle ([`b261af9`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/b261af9a3542b927b1fbd247f50a9a1343145a69))
* Fix link to lbsn-ctl ([`0494fad`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/0494fad2093f9be24c1a671ea05bc38b53a82f4b))
* Add master-stable branch note ([`5add915`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/5add9153c04474bfd324855208f7689dcf48fb6b))
* Add linebreaks to Readme ([`34756cd`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/34756cd1a5351aa86f1844003a5e939a3f9dbeca))

## v0.5.0 (2021-07-12)
### Feature
* Add pyepsg package to worker_env ([`2f9bba1`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/2f9bba1cd40eb51fba14a94c6720953c73589f8b))

### Fix
* Remove nodejs not needed anymore for Jupyter Lab 3.0 ([`a0e91a6`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/a0e91a67281277ac79cf4fd2b22d254cb3977f5a))
* Do not use nbextensions install in jupyterlab 3.0 ([`995c9fa`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/995c9fa1618bb81aac9ccefcb1505431c23e9a34))
* Ipywidgets not yet released ([`bc2bf95`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/bc2bf95f2291efd94c7da0ce5605e530ad35e305))

### Documentation
* Remove Jupyter lab version in Readme ([`56cbf04`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/56cbf0446f0974f993ecdd7c1f72b35cda3fa428))

## v0.4.0 (2021-03-29)

### Feature
* Update Dockerfile to JupyterLab 3.0 compatibility ([`65615aa`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/65615aab3fe6407360f41669c89aec99c3b48e0b))

### Fix
* Environment_default.yml ipywidgets pinning ([`89c2f1e`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/89c2f1edf6973ed0a2918d1b453746bb20877c2f))

### Documentation
* Fix link to lbsn-ctl ([`0494fad`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/0494fad2093f9be24c1a671ea05bc38b53a82f4b))
* Add master-stable branch note ([`5add915`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/5add9153c04474bfd324855208f7689dcf48fb6b))
* Add linebreaks to Readme ([`34756cd`](https://gitlab.com/lbsn/tools/jupyterlab/-/commit/34756cd1a5351aa86f1844003a5e939a3f9dbeca))

## v0.3.0 (2021-03-29)

- Update to Jupyter Lab 3.0

