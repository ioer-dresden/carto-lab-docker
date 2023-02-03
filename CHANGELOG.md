# Changelog

<!--next-version-placeholder-->

## v0.10.0 (2022-12-21)
### Feature
* Bump nbconvert from 6.5.* to 7.2.* ([`ee20a57`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ee20a5744569ec5163ed46192ebc0a827b6a2988))

### Documentation
* Add explicit docker network create ([`023e4c7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/023e4c7497c0cb5ad5d7b71ec193b06a4cfebaed))
* Suggest to pull registry image, to prevent build of image by default ([`0879b51`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0879b513b7aa555f1a31637e7bd2bd51fd26ec2f))
* Clarify steps to setup svg_export ([`cbb888e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cbb888e26a69ee4d39cf31ca4f22a69215588f5d))
* Update readme header ([`5e26d21`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5e26d21dee3b875d48fb6b779ac078382b948003))

## v0.9.0 (2022-08-30)
### Feature
* Add .version to Dockerfile, to be able to get the Container version at runtime ([`31ed7cb`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/31ed7cbe4337020fd7eebd540dd00d88a182ca79))

### Fix
* Ipywidgets compatibility ([`bb1c0be`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/bb1c0beaa8718ffaba49e282da81df979d291ca7))
* CI extract version from file ([`9d10722`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9d10722215ae99394294ded3005c0dafa2cb8eb7))
* Use master-latest for versioned releases ([`6d390ef`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6d390ef36ac9316b3a423a2ba5c3c6c49c30b259))

### Documentation
* Add instructions to install selenium and webdriver ([`cb4038a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cb4038a19bdd849a9abdd9bae4d7ae566fc4ddf0))
* Add COMPOSE_FILE to .env examples ([`5cf73a2`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5cf73a2654a869dce9d394a1f1951cd057ce64e9))
* Update header ([`c57caa3`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/c57caa3c0a7b2e43fc24b593ec852b909e790eb8))

## v0.8.1 (2022-08-25)

### CI
* Automatic versioning of registry images

## v0.7.0 (2022-07-22)
### Feature
* Add Mapnik docker and tag ([`3ce9d06`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3ce9d064a4829ef2870fb6ee9c6009d8d6c1d49e))

### Fix
* Nbconvert pinned to old version ([`fb611fc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/fb611fc04ef08db9e222597ca92e27e9d6623d54))
* Incompatible geoviews package for latest holoviews release ([`5baa575`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5baa575acfcff1ec6c861adfc700f7aaf8a46865))

### Documentation
* Update readme to include collaborative editing feature ([`7b40eb9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7b40eb97dd38b83b95566476d6cf924711fe3f38))
* Add note to use registry images in readme ([`05528e4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/05528e481c4dce7ed41346e45c02d2354efe50d9))
* Add warning to update pinnings regularly ([`5b40fbc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5b40fbcea47ecfbe90027844899e086400ab31a7))

## v0.6.1 (2022-03-24)

### Fix
* Incompatible geoviews package for latest holoviews release ([`5baa575`](5baa575acfcff1ec6c861adfc700f7aaf8a46865))

### Documentation
* Add warning to update pinnings regularly ([`5b40fbc`](5b40fbcea47ecfbe90027844899e086400ab31a7))

## v0.6.0 (2021-07-12)
### Feature
* Add flopy to default packages ([`e92819b`](e92819b0688f079ca80830e4df9fcad014b3cb33))
* Add pyvizcomm for Holoviews/Jupyter Lab 3.0 compatibility ([`7a7eacf`](7a7eacf634c3f8a8f0fc7c14925e6df39ae04c85))
* Add datashader to worker_env ([`ee8a49a`](ee8a49ac6edbecc66ba9636903a6bd840a05e29e))
* Add package adjust_text ([`00bbfe8`](00bbfe8461c871c1278f1458f24678d5e7be76a0))
* Remove firefox, geckodriver and selenium dependencies, as they are not reliable enough ([`fd18aae`](fd18aae5c8a20502ff60b4e32988acf543c3fc7f))
* Add pyepsg package to worker_env ([`2e2ea2f`](2e2ea2fa8458e4a5b93b632f5ab3c6e7f1021382))
* Update Dockerfile to JupyterLab 3.0 compatibility ([`65615aa`](65615aab3fe6407360f41669c89aec99c3b48e0b))

### Fix
* Move config to ServerApp transition ([`fbd83fe`](fbd83fe3c389740f5b5dda69e6c22807676b3012))
* Remove nodejs not needed anymore for Jupyter Lab 3.0 ([`a6008a3`](a6008a33b0c8d3a3a55be6691485f7727ce06984))
* /home/alex reference to notebooks in compose; update readme ([`97f3525`](97f35259a2039613379158bb259ee0cf83b9614e))
* Do not use nbextensions install in jupyterlab 3.0 ([`0edd466`](0edd4661d0e6476377b1ce8e607f8a9ff0dfbfde))
* Use commented default values in .env.example ([`8ea4401`](8ea44015777c574dba95f7eafff15b9ae4b681f7))
* Ipywidgets not yet released ([`96ac9ba`](96ac9ba21b3677ee7b3abdbb5997c65c6352cf22))
* Environment_default.yml ipywidgets pinning ([`89c2f1e`](89c2f1edf6973ed0a2918d1b453746bb20877c2f))

### Documentation
* Add list of packages and links to documentations to readme ([`2229554`](2229554742d0508dc1815ccea44cecb5676016e2))
* Update Readme.md with branch shuffle ([`b261af9`](b261af9a3542b927b1fbd247f50a9a1343145a69))
* Fix link to lbsn-ctl ([`0494fad`](0494fad2093f9be24c1a671ea05bc38b53a82f4b))
* Add master-stable branch note ([`5add915`](5add9153c04474bfd324855208f7689dcf48fb6b))
* Add linebreaks to Readme ([`34756cd`](34756cd1a5351aa86f1844003a5e939a3f9dbeca))

## v0.5.0 (2021-07-12)
### Feature
* Add pyepsg package to worker_env ([`2f9bba1`](2f9bba1cd40eb51fba14a94c6720953c73589f8b))

### Fix
* Remove nodejs not needed anymore for Jupyter Lab 3.0 ([`a0e91a6`](a0e91a67281277ac79cf4fd2b22d254cb3977f5a))
* Do not use nbextensions install in jupyterlab 3.0 ([`995c9fa`](995c9fa1618bb81aac9ccefcb1505431c23e9a34))
* Ipywidgets not yet released ([`bc2bf95`](bc2bf95f2291efd94c7da0ce5605e530ad35e305))

### Documentation
* Remove Jupyter lab version in Readme ([`56cbf04`](56cbf0446f0974f993ecdd7c1f72b35cda3fa428))

## v0.4.0 (2021-03-29)

### Feature
* Update Dockerfile to JupyterLab 3.0 compatibility ([`65615aa`](65615aab3fe6407360f41669c89aec99c3b48e0b))

### Fix
* Environment_default.yml ipywidgets pinning ([`89c2f1e`](89c2f1edf6973ed0a2918d1b453746bb20877c2f))

### Documentation
* Fix link to lbsn-ctl ([`0494fad`](0494fad2093f9be24c1a671ea05bc38b53a82f4b))
* Add master-stable branch note ([`5add915`](5add9153c04474bfd324855208f7689dcf48fb6b))
* Add linebreaks to Readme ([`34756cd`](34756cd1a5351aa86f1844003a5e939a3f9dbeca))

## v0.3.0 (2021-03-29)

- Update to Jupyter Lab 3.0

