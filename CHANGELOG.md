# CHANGELOG


## v0.27.2 (2025-05-05)

### Bug Fixes

- Pin geopandas to 1.0.0 (minimal)
  ([`6191bff`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6191bff70ed8c44e99df610f92eac4a17e57ffe1))

- avoids 0.14.4 install


## v0.27.1 (2025-04-16)

### Bug Fixes

- Collaborative flag evaluated vice versa in Dockefile
  ([`1414253`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/1414253c83e360836bd8363b8cca404b897a361a))

also see https://github.com/jupyterlab/jupyter-collaboration/issues/473

- Remove pip dependency conflict for numpy
  ([`96e3240`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/96e324033c5c7ef13b07fdd86030759fc2ede251))

python-hll2 is outdated; it is suggested that those who rely on this package install it temporarily

### Refactoring

- Pin JupyterLab version to latest
  ([`874612a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/874612aeabd0a7699f7f49fcf280ae6630d7d279))

- Show versions for worker_env
  ([`64635d3`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/64635d3243e4cf5c676e460234139976cc1829ee))


## v0.27.0 (2025-04-08)

### Bug Fixes

- Terminado_settings and allow_hidden should always apply; large refactor of CMD-Part in Dockerfile
  (follow conventions)
  ([`5c9db23`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5c9db23f5f2e586cfc6bcaf197b5fec8caf02a64))

- Typo (test ci/version)
  ([`b6c640d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b6c640d25ca669f84acdd5d6a08db86f37bb6d0d))

- Version variable not populated in CI
  ([`f449160`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f4491605753a5f70eaecd162de05d3e99df257d1))

### Documentation

- Fix legend
  ([`468bdd2`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/468bdd2713d5be1ee2f53df9fe39f6ffcd0f0b38))

- Set matrix page to full width
  ([`0a7e92b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0a7e92b0cabc1427868fc9f76bd36c9a305ddc32))

- Update note
  ([`582c9fc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/582c9fc126868b8527db323291c379419a02bd48))

### Features

- Update to JupyterLab 4.4.0
  ([`700b0f7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/700b0f7ab981ab1ad5038bd5a21f1c8c8a7c6816))


## v0.26.0 (2025-03-06)


## v0.25.0 (2025-02-06)

### Bug Fixes

- Announcement appearing again, despite config
  ([`1d50ae0`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/1d50ae0a6361febade872ea7eea503e98ccdbf84))

See: https://github.com/jupyterlab/jupyterlab/issues/14065#issuecomment-2132474538

- Cartolab_version not available on runtime
  ([`ef05e1f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ef05e1fb93a212b445421b2ad58b925e005bd7c8))

- Dask not compatible with latest Bokeh
  ([`177dc0a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/177dc0a4aa4a33c29cae10e8dfe1db486aa38c51))

- Dask not compatible with latest Bokeh
  ([`fc18033`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/fc180333b7a90c254395653fcfbc42ad6798a9bb))

- Disable jupyter real time collaboration (RTC) extension by default
  ([`ff4cbdb`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ff4cbdb3bd128c4aa80ffec5363ea32494d4c62d))

### Code Style

- New logo
  ([`e519bd5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/e519bd5586bc6fbca6d7e7b84ec5841d001a113a))

### Continuous Integration

- Enable mermaid plugin
  ([`66064f6`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/66064f663d108df4d73f8caddfd1742000b05b6b))

- Reduce build complexity by relying on TAG instead of extra APP_VERSION
  ([`2da30e2`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2da30e274553827491231d4f3f3f457f6a832ea3))

- Use explicit mkdocs registry version tag; add mermaid
  ([`9db3c60`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9db3c604006ef7c48730420543fa4a1e7fe7897c))

### Documentation

- Add compatibility matrix
  ([`20e3aa7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/20e3aa70e224fb1f9b9ac52d224528d678fde0cc))

- Add compatibility matrix for version 0.19.0
  ([`3263d6f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3263d6ffde1387844be0376a5c8eb523060642d7))

- Add missing parameters, update note for jupytext
  ([`96799a7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/96799a7b6fc7af7d8c6ad2418af75514e6d07e0f))

- Clarify difference between COLLABORATIVE and DISABLE_JUPYTER-COLLABORATION flags
  ([`a711178`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a711178559eb0675d638b5ea8258cb32e20a3892))

- Collaboration mode working tested as of 0.24.1
  ([`b12c541`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b12c54141b511c1720e2eaa0b3a5cc5298eae605))

- Improve description of collaboration mode and jupytext incompatibility
  ([`f5f9ea9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f5f9ea9327322f09d2f1b16eae09f8845de394d1))

- Update Matrix for v0.25.0
  ([`2f97f88`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2f97f8842fa883c1e97e9ae7e45c60796e140881))

- Update versions for 0.13.0
  ([`42592db`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/42592dbcdf74e24700c0a888c4a6948c8726bb46))

### Features

- Add 7zip for packaging
  ([`8b06d4b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/8b06d4b3eebd7e3c44ad2ceae95dfe0bce6a70ac))

- Add carto-lab docker version to browser tab
  ([`f263464`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f26346411ac8520faae4d2d52147c0d6294b182b))

- Add Cookiecutter env for reproduction package workflow
  ([`0d7a8fd`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0d7a8fde012bddcd6cce3ec728829e6f9072ce8d))

- Allow RTC, collaboration and git-extension to be enabled alongside each other
  ([`c15e96c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/c15e96c2e2e888617be551af8711f0da3f9e11f9))

- Allow RTC, collaboration and git-extension to be enabled alongside each other
  ([`821a45f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/821a45fa22b3c0957590816e2dfe0c0219fea10d))

- Pin jupyterlab 4.4.0a3 and latest (beta) RTC package
  ([`ddf229c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ddf229cfcdca188e003a6723b59a35d69f46230b))

- Pin jupyterlab 4.4.0a3 and latest (beta) RTC package
  ([`91283ae`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/91283ae2119f0bb66179ec678d96a0e44341c67a))

- Start terminal sessions in bash by default
  ([`16b6780`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/16b6780e6927ced8a95eacd2679dab29c4a9df4c))

### Performance Improvements

- Reduce build size of Mapntik image
  ([`dbe557a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/dbe557add6b3c49839b1b9a3db1afafa06ce1e3f))

### Refactoring

- Change deprecated c.ServerApp.token to c.IdentityProvider.token
  ([`1fc3004`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/1fc300404e3d5f00d4cf0dd905e2fc2d1546ae0a))

- Remove Mapnik fonts bind in r-compose
  ([`7afd62c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7afd62cc678ae7e7fdfb6ed320272f810cfb7051))

- Use version from TAG in build process
  ([`37769ae`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/37769ae3e93366f25a351c0278c434986dbe38d2))


## v0.24.1 (2024-11-13)

### Bug Fixes

- Passwordidentityprovider in favor of deprecated ServerApp
  ([`1649afe`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/1649afe8a509abad75ca4d213eb6dc860ad77202))


## v0.24.0 (2024-11-13)

### Bug Fixes

- Collaboration mode turned off by default
  ([`5f5b3eb`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5f5b3eb16d88bb8cc440d233985b8511e452d748))

- Collaboration mode upstream bug
  ([`bc6107d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/bc6107deb5f5a778fffe2656dd848308dea4003d))

- Collaboration mode upstream bug
  ([`7a31b01`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7a31b014965f66a55f1fa93ea5ea8fcd96528078))

- Collaboration mode upstream bug
  ([`561fd98`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/561fd987585462d8b037253e3e3f683214f8de77))

- Collaboration mode upstream bug #2
  ([`32fe030`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/32fe03029fbecf08b97dfa697dd02203d3c47969))

- Grass compose tag
  ([`a8f4153`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a8f4153b2c61b351ef721f4b3b501ee51619f9fe))

- Grass image tag
  ([`15186a6`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/15186a66d1c96f01b3a3ddadce8ffd573bac74e9))

### Documentation

- Add grass gis example
  ([`bc48a80`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/bc48a8084ec0954618d4376657694aab98ab6d10))

- Add grass gis jupyter example notebook
  ([`6f3a8f4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6f3a8f494742ad19fbc876cf49573a5f1bfdcb31))

- Add steps to override welcome page
  ([`71728e3`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/71728e3b66d7a266b02d58446d487f41986c831b))

- Fix typos
  ([`cd79995`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cd79995f5b9979f98370b71773edd9463d114b29))

- Improve description of collaboration mode
  ([`5f24797`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5f24797ffb8ed3bceb2d3e6edc05e750e2b145a9))

- Minor rephrasing
  ([`cf1fd24`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cf1fd241a3b7502099f9dede5cc6fef93b423da7))

- Rename use cases to 'tasks'
  ([`4577b64`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4577b64a4643a8e17e00ed06800f1e664d31c69f))

- Update grass image tag
  ([`0b5b79e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0b5b79e81016ff0c50af08dcab42cf2ba794aa35))

### Features

- Add grass gis docker-compose.yml
  ([`0f255bf`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0f255bff01dc0a9ce2d1fe25b0bb22724edc3aa9))


## v0.22.1 (2024-09-03)

### Bug Fixes

- Disable opening browser warning
  ([`b3d6c7a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b3d6c7a69996c444ce94619e37b4e0ad14119290))

### Documentation

- Add GL_TOKEN to release cycle
  ([`3a9896e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3a9896e45bde89695d1fb28fe59a50da85709b73))

- Add screenshot of link sharing in collaboration mode
  ([`7a8f959`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7a8f95983bc5b791507afe9aae32f6a5699c21c3))

- Document the collaboration feature
  ([`2e0be22`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2e0be227635d93b6de62003c8ddacbbacb7e177c))

- Update env variables
  ([`6f467c5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6f467c5fdd86715f4737bb8806c05b6e137fb186))


## v0.22.0 (2024-09-02)


## v0.21.0 (2024-09-02)


## v0.20.0 (2024-09-02)

### Bug Fixes

- Collaboration not working as expected
  ([`2fdf540`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2fdf54083f286416a9d697b2a4adc68b5cabb779))

- Deprecated notebook_dir
  ([`e9c216f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/e9c216f2980c3bab466c48beec45a5c3c8da795e))

Fixes #5

- Jupyter collaboration update version to fix incomatible jupyter server
  ([`8883bf4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/8883bf438eb31f6772bc56192e4ebae59e957cbb))

### Continuous Integration

- Fix images not building
  ([`706572d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/706572db18520f0510f872d4bcc5835a4adea780))

### Documentation

- Add instructions for different versions
  ([`b743c44`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b743c4496904d7caa28a0b7691bd51a8601afca9))

- Add r packages list and reference
  ([`2bf0d76`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2bf0d76df95682a7b54c90e87438cb6845e42152))

- Change collaboration default to false
  ([`1a597e6`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/1a597e600c6649b94656a32c2cb581646d7b5dfe))

- Fix bullet list formatting
  ([`06629a6`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/06629a6643cc0ab89b7686c31df92c18bdc0e467))

- Fix rstudio yml reference
  ([`abdfcdd`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/abdfcdd8dd350dd12d473b1921da68dabce494ab))

- Fix typo
  ([`f1499a4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f1499a4e1b3168c9c269d7c5eb12ea855ce8e4b5))

- Rename rstudio to r
  ([`30cf4bf`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/30cf4bfbcdcf88f9e00044281784f1e246b2ca0e))

- Update TOC§
  ([`9ea9daf`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9ea9dafb5e0a5331ab95156ee385ff1d50cd38a2))

### Features

- Add r mapping packages
  ([`c7b6af9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/c7b6af9627d622ed9a0b95c0e3b459b1cb8ebcd5))

- Add several environment variables to disable extensions; optionally allow generating a TOKEN in
  addition to a password
  ([`a3c838a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a3c838a35656e7156450a060f7f1f938cb2f8e3a))


## v0.18.0 (2024-08-05)

### Code Style

- Fix transparency in logo
  ([`633929c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/633929cf608773f8bf21ac8210498bcc687863c4))

- Slighly improve logo
  ([`83115f5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/83115f56bda6eb7ec19742c9d2a3ee439b4be067))

### Continuous Integration

- Add rstudio build
  ([`1e3fe39`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/1e3fe39215696ef8df7b21ed866478c3dfd59be5))

- Build docker images when manual pipeline trigged
  ([`faf43c9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/faf43c992a1c906fc28cc21625ecbdb3ca066620))

- Fix order of build priorities
  ([`e946bd3`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/e946bd3a58d004251ef8333ed39bea53ce5da6d1))

- Remove manual trigger, as it does not work as intended
  ([`7804a88`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7804a88980923013444bcb1f416299942f531276))

### Documentation

- Add packages graphic
  ([`0bd44c8`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0bd44c8eb37ae762faaf944b6885a23e20a675f5))

- Add rstudio version description
  ([`5fbe070`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5fbe0701634323218c759b5f4e2535cd90ed5642))

- Add security note
  ([`b843fb7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b843fb7dab169d00fb81fd2fcb8b0fa62a5bf8ae))

- Minor updates to the docs
  ([`8e51793`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/8e517934d17fb7f8c0c8cafcbe7a98667f673ae2))

### Features

- Add RStudio Dockerfile extended image, push to extra registry tag
  ([`9f4ad88`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9f4ad8841f857beb4b8c21e0f9631e49ad4af75b))


## v0.17.0 (2024-07-26)

### Bug Fixes

- Jupytext and collaboration feature cannot be activated together
  ([`2acc71e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2acc71eceb18478acb301c9d151b17d234260a64))

Deactivate collaboration for the meantime

- Proj error
  ([`13d5438`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/13d54380bb7ed0e44368e96a92f4fbd752484419))

fixes #3

### Chores

- Add mkdocs config
  ([`f28b32c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f28b32c2a9d8a6734d96f4f433e1b8e179c21cc9))

- Fix missing backslash in Dockerfile
  ([`3efc5a7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3efc5a79422cbbfc9f8e302616d642b5a40daf52))

- Update .gitignore
  ([`441d416`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/441d416a93c6292a9beda8e27a17563905bd61db))

### Code Style

- Change blue colors in badges and docs
  ([`bce28f5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/bce28f59f1194429eb6f8cd37e7caea84f885e88))

### Continuous Integration

- Add gitlab-ci workflow to build and deploy the docs
  ([`39cca9b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/39cca9b682ffc54056b85d3c7f1ec0e87722e423))

- Add markdown include to mkdocs.yml
  ([`6672d79`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6672d791d3a1576eded09ddcc6ed65f856d7642d))

- Do not build images if no changes happened
  ([`04265ac`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/04265aca99a6ae9188336e3e5681f64a0b424c25))

- Exclude container build for gitlab-ci and mkdocs.yml changes
  ([`7ad29a4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7ad29a49b89d81bdfe6a307cdd3e0af2c4d9b57f))

- Fix changes yml tag not working as expected
  ([`ad917e0`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ad917e01a23e62679b56b7d878e7cbc666f34243))

- Fix changes yml tag not working as expected
  ([`95784c1`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/95784c1185d89c2c33f3c3b5bfa1822a61d76dfe))

- Fix changes yml tag not working as expected
  ([`4c8b2c5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4c8b2c52d580b433013ef49fa8b3763f18ed447b))

- Fix gitlab-ci
  ([`b4ae095`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b4ae095b2be62f56a5a6f6ef605981b8a7c2cc86))

- Fix gitlab-ci
  ([`3e00c7f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3e00c7fbad8e8f7890614441aeb89e2595b7e8c6))

- Fix gitlab-ci
  ([`2c819f4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2c819f447266e18a2420bdd87b1de630865d5aff))

- Fix gitlab-ci
  ([`3eea538`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3eea538df03cb0161191df2a47d524ff2efc3ece))

- Fix mkdocs build
  ([`defe308`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/defe308fab7f614a0edfcb57a8b1d75a6a4c06ed))

- Fix typo
  ([`35caf5b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/35caf5be3650ba74b97e0d5ee645f7e82d2c113a))

- Try to get the if and changes following AND expression
  ([`b04109a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b04109a94ba6122af0e1b9ac46ee48e648f4ec3f))

- Try to get the if and changes following AND expression
  ([`2c55511`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2c55511feeeae6fa33999bbed327c841a05195b9))

- Typo in version.svg
  ([`f4d4b7b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f4d4b7bd2153f8e8f1e673df5f475205a36d8089))

### Documentation

- Add note to use cases
  ([`d970407`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/d970407560b1664ce3a2ed2cbb5d24ca1e2327e6))

- Cleanup and reorganize docs
  ([`a12fb8f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a12fb8f456c6a1ebe2c0ba340ff4f6efc7335464))

- Cleanup Readme.md
  ([`4e05daa`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4e05daaad9bf32f930b6c8c4403989f0ab0ecb65))

- Minor rephrasing
  ([`2992c1e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2992c1eca34b55837a3b0c477b0fbf3ebcfa1dd7))

- Prepare initial mkdocs
  ([`6fc86d3`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6fc86d33c64e0fccc999fc16d60094b5d13f5685))

- Use https git clone, for broader applicability
  ([`e0cf5ce`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/e0cf5ce2cb2bd56dfc4041dc3984931f3e3a711b))

### Features

- Add JUPYTER_AUTOSHUTDOWN_TIMEOUT to environment variables, so that users can disable auto-shutdown
  ([`d149be2`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/d149be2a8c26f8a65e64eb3f0573a92affa83a67))


## v0.16.3 (2024-07-19)

### Bug Fixes

- Mapnik Dockerfile build
  ([`5ec99c5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5ec99c5942c763dd560586b5130508db6a33dba3))

The reason for this file is pip-system install, which should indeed be avoided. However, mapnik-cli
  has no dependencies and is quite lightweight. We skip this check now in the Dockerfile.


## v0.16.2 (2024-07-18)

### Bug Fixes

- Manual bump
  ([`30ce94c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/30ce94c9e059e38cff9c4f68c0a790741ba0e19b))


## v0.16.1 (2024-07-18)

### Bug Fixes

- Manual bump
  ([`0e83810`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0e8381073f984ca9217dbc843bd12c93f48343b4))


## v0.16.0 (2024-07-18)

### Bug Fixes

- Nbconvert module not found (notebook.base)
  ([`ed16cbc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ed16cbccfe6142a37c3cbfd506a90a335f084fe7))

Pin notebook<7.0.0, until
  https://github.com/Jupyter-contrib/jupyter_nbextensions_configurator/issues/165 is addressed

### Chores

- No remote image when building
  ([`f8e648f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f8e648f99859a73c487fe3985742b895131a82cb))

- Remove deprecated version tag in compose
  ([`63b80f0`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/63b80f00b1271f82528e0e1e804d133ce123ad92))

- Remove deprecated version tag in compose
  ([`4a30bad`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4a30bad15f8a03eb85ff1f383c549feeddb234fb))

### Documentation

- Add note to test local build
  ([`15f87b1`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/15f87b152a8383b02000708df0f9eb846a552e29))

- Update docker compose commands
  ([`b0da8af`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b0da8af41440b15a75bedecac1f2375fd8590544))

### Features

- Update python package list
  ([`6345628`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6345628bfc296456db20b40795eab4a49f4ff0dc))


## v0.15.7 (2023-09-15)

### Bug Fixes

- Correct new path to passwd
  ([`cf725ff`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cf725ff9572d880541038a5ee1e04084bd8979db))


## v0.15.6 (2023-09-15)

### Bug Fixes

- Password authentication not working
  ([`4b9f8fa`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4b9f8fae7db3fff1bfbff0a3c242b32c8b794c48))


## v0.15.5 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`dc1b47e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/dc1b47eb4a9d9d84cb85b747bef98cecd92ef8c2))


## v0.15.4 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`46076b5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/46076b52f83e95ce3e6d9d5d6bb38bec04bc5633))


## v0.15.3 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`bfe814f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/bfe814f0decbeb56bb358792c64b8b5cac79047f))


## v0.15.2 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`5fb60b1`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5fb60b1b2949b1f6384d113f0890887ec9e18bdd))


## v0.15.1 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`830c80e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/830c80e09ae6181833ef2ea7b537a1a8a794b4b0))


## v0.15.0 (2023-09-15)

### Chores

- Bump jupytrer env python to 3.9 (minimal)
  ([`3a4b68f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3a4b68f5a9b6c312d802b7ce39c0ac95b8519937))

- Explicitly add GL_TOKEN
  ([`997b6dd`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/997b6dd78662f1323cf3e79754b004a45f7a249c))

- Migrate from setup.cfg to pyproject.toml (semantic-release)
  ([`6e9d4c9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6e9d4c9c6c75e1c23fd93f6252a6ed12afb0a2fe))

- Remove pinning of nbconvert in jupyter env
  ([`fbae7f8`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/fbae7f86a1f7b97c5b7748f61ba0458b37e12f21))

### Documentation

- Add semantic-release description for developers
  ([`16f715a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/16f715aa067ab75ede1885db575126ad36968208))

- Update package list
  ([`3863ed5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3863ed5b4d540d11201f365bea652d8ae1cd42d8))

### Features

- Add rasterio to default env
  ([`f0b2bee`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/f0b2bee621d25a683c5e2f3f1b232706dce7671d))

- Bump jupyter lab minimal version to 4; remove classic notebook extensions
  ([`69a6535`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/69a653547237d3d4a7fc0408a4065e02ff7df3ca))


## v0.14.0 (2023-07-14)

### Documentation

- Clarify python executable to be used for installing ipykernel spec
  ([`8e52943`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/8e529435c753a95b8e86f2d0de77eea0b3636b5b))

### Features

- Update Jupyter Lab to 4.0
  ([`5af1cc1`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5af1cc1a5bf426513921598b6c62f82f166b5b9a))


## v0.13.0 (2023-03-27)

### Bug Fixes

- Disable Jupyter news
  ([`8811623`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/88116236186b4680247c7aba607e10eb6d6b5d32))

### Documentation

- Clarify pinning of tag via .env
  ([`0f4f16e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0f4f16eaf938c577ce75d8fae3172bb84f383e12))

### Features

- Add default persistent environment path and update docs
  ([`9b85dd5`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9b85dd5d45a39be9717c4108725df5739c88972b))


## v0.12.3 (2023-02-21)

### Bug Fixes

- Incompatibility between numpy>1.2 and Shapely<1.8
  ([`6dcade0`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6dcade084283712bc5631fec46dc9360e1bffd4a))

### Chores

- Add READONLY_USER_PASSWORD as environemnt variable to default compose file
  ([`3ba67bc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3ba67bccd068e9606e548acae327cfcec0f4b662))

### Documentation

- Update reference to docker-compose build with explicit compose file
  ([`80d4cd9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/80d4cd953255690d63880f17258db7413e40773c))


## v0.12.2 (2023-02-03)

### Bug Fixes

- Ci-commit-tag empty for push-commits
  ([`ae3786d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ae3786dfc2736a3ca154635f0ab86e921d501d70))


## v0.12.1 (2023-02-03)

### Bug Fixes

- Ci-commit-tag empty for push-commits
  ([`659d74d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/659d74de7d95537347ba9b55572eb613a160f029))


## v0.12.0 (2023-02-03)

### Continuous Integration

- Latest and stable version tags not built
  ([`99e1bde`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/99e1bde3bc9d2b5ccfd8d6f721662c26643efc82))


## v0.11.0 (2023-02-03)

### Bug Fixes

- Yaml syntax
  ([`da3a8e8`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/da3a8e81ec510808b355bddc146c4482042100d4))

- Yaml syntax
  ([`daed0fe`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/daed0febac9329202fd21c10cc11b2e110a29c8f))

### Continuous Integration

- Add explicit stages to .gitlab-ci.yml
  ([`2c1f0f8`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2c1f0f88e5a4f36780b1679427981e77a569680c))

- Fix rules and only not allowed to be used together
  ([`2fa64d6`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2fa64d62fee41abcc21f58621392c595cb41656f))

- Fix Semantic-Release custom hvcs domain
  ([`a1e23f4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a1e23f48249fcf4507dfd2c747ea70e13d71d78f))

- Only build and push stable and latest version tags if CI_COMMIT_TAG is not empty
  ([`933944d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/933944de78cd4b7366f823b8ca3ccda07279a194))

### Features

- Add TAG environemnt-variable to pin specific versions in docker-compose.yml
  ([`e8144b8`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/e8144b87a6601e8a550c81b67a79f36fe05ea23c))


## v0.10.0 (2022-12-21)

### Chores

- Use the latest registry image in default docker-compose.yml
  ([`120c53a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/120c53ad12c4917ecc517fbaf17e0a3e8f082d8b))

### Documentation

- Add explicit docker network create
  ([`023e4c7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/023e4c7497c0cb5ad5d7b71ec193b06a4cfebaed))

- Clarify steps to setup svg_export
  ([`cbb888e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cbb888e26a69ee4d39cf31ca4f22a69215588f5d))

- Suggest to pull registry image, to prevent build of image by default
  ([`0879b51`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0879b513b7aa555f1a31637e7bd2bd51fd26ec2f))

- Update readme header
  ([`5e26d21`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5e26d21dee3b875d48fb6b779ac078382b948003))

### Features

- Bump nbconvert from 6.5.* to 7.2.*
  ([`ee20a57`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ee20a5744569ec5163ed46192ebc0a827b6a2988))


## v0.9.0 (2022-08-30)

### Bug Fixes

- Ci extract version from file
  ([`9d10722`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9d10722215ae99394294ded3005c0dafa2cb8eb7))

- Ipywidgets compatibility
  ([`bb1c0be`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/bb1c0beaa8718ffaba49e282da81df979d291ca7))

- Use master-latest for versioned releases
  ([`6d390ef`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6d390ef36ac9316b3a423a2ba5c3c6c49c30b259))

### Code Style

- Readme formatting
  ([`4dcfee0`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4dcfee02c94e554164b196d1e7edd15e831a0a1d))

### Continuous Integration

- Build and push versions and latest tags
  ([`2a40eea`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2a40eeaa24726fcb0e10c0380c2a72213c5376ec))

### Documentation

- Add COMPOSE_FILE to .env examples
  ([`5cf73a2`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5cf73a2654a869dce9d394a1f1951cd057ce64e9))

- Add instructions to install selenium and webdriver
  ([`cb4038a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cb4038a19bdd849a9abdd9bae4d7ae566fc4ddf0))

- Update header
  ([`c57caa3`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/c57caa3c0a7b2e43fc24b593ec852b909e790eb8))

### Features

- Add .version to Dockerfile, to be able to get the Container version at runtime
  ([`31ed7cb`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/31ed7cbe4337020fd7eebd540dd00d88a182ca79))

### Testing

- Add test for ipywidgets (tab)
  ([`5895168`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/58951686a970d531b6f0665f7806197135333f93))


## v0.8.0 (2022-08-25)


## v0.8.1 (2022-08-25)

### Bug Fixes

- Formatting§
  ([`56db080`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/56db0806aadc89ff28dea849cb5aa34121403011))

- Typo
  ([`5138e09`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5138e09c179cea1cc627d47af6bcc0c48d1550c7))

### Continuous Integration

- Add docker release versions
  ([`4887b5d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4887b5d8d19d964353cc6edfcfbdcdc718faabf1))

### Documentation

- Add badges
  ([`1f4d139`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/1f4d1398471aa387c40139438a11bb38e50b3cef))

### Features

- Add mapnik-cli package to jupyterlab:mapnik
  ([`c76b423`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/c76b423751d15dce8e226560800c9e177fc61a8d))

- Add matplotlib-scalebar package to default
  ([`b3159fc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b3159fc7ce041f413bfb578cfe659dadfb56b291))

- Add PySal ESDA to default worker_env
  ([`0a21727`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0a21727c4f0b8f634f31cb6eca5b366d49d742b4))


## v0.7.0 (2022-07-22)

### Bug Fixes

- Nbconvert pinned to old version
  ([`fb611fc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/fb611fc04ef08db9e222597ca92e27e9d6623d54))

Pin nbconvert to the latest stable version, excluding release candidates

### Continuous Integration

- Build Mapnik tag only on latest
  ([`7667e2f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7667e2f35f2c7a39255343c98b5f4121e55d7e52))

### Documentation

- Add note to use registry images in readme
  ([`05528e4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/05528e481c4dce7ed41346e45c02d2354efe50d9))

- Update readme to include collaborative editing feature
  ([`7b40eb9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7b40eb97dd38b83b95566476d6cf924711fe3f38))

### Features

- Add Mapnik docker and tag
  ([`3ce9d06`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3ce9d064a4829ef2870fb6ee9c6009d8d6c1d49e))


## v0.6.1 (2022-03-24)

### Bug Fixes

- Incompatible geoviews package for latest holoviews release
  ([`5baa575`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5baa575acfcff1ec6c861adfc700f7aaf8a46865))

### Chores

- Add ipyleaflet package to default env
  ([`7e08c82`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7e08c8202da83d4af9226d72f95f5158c7349141))

- Pin shapely to 1.7.1 (and add hvplot), default env
  ([`2d7683b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2d7683b4f45a305f6c742b815fd9add1e3950bda))

Explanation: Shapely 1.8.0+ throws a lot of deprecation warnings in Geoviews, Holoviews, Cartopy,
  Geopandas etc. Until these other packages keep up with Shapely, pin to older version

### Documentation

- Add warning to update pinnings regularly
  ([`5b40fbc`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5b40fbcea47ecfbe90027844899e086400ab31a7))


## v0.6.0 (2021-07-12)

### Bug Fixes

- /home/alex reference to notebooks in compose; update readme
  ([`97f3525`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/97f35259a2039613379158bb259ee0cf83b9614e))

- Do not use nbextensions install in jupyterlab 3.0
  ([`0edd466`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0edd4661d0e6476377b1ce8e607f8a9ff0dfbfde))

- Ipywidgets not yet released
  ([`96ac9ba`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/96ac9ba21b3677ee7b3abdbb5997c65c6352cf22))

- Move config to ServerApp transition
  ([`fbd83fe`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/fbd83fe3c389740f5b5dda69e6c22807676b3012))

- Remove nodejs not needed anymore for Jupyter Lab 3.0
  ([`a6008a3`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a6008a33b0c8d3a3a55be6691485f7727ce06984))

- Use commented default values in .env.example
  ([`8ea4401`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/8ea44015777c574dba95f7eafff15b9ae4b681f7))

### Chores

- Build registry images according to branch
  ([`a8f1399`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a8f139915d4daec46cfc84bc5b62e43823693e29))

- Shuffle master-latest and stable branch, set stable to master
  ([`d875227`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/d875227947800b5226b169f476dbf2ec7961d295))

- Update changelog
  ([`3ade60a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3ade60a7f560963463232e24226886b30654878b))

### Documentation

- Add list of packages and links to documentations to readme
  ([`2229554`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2229554742d0508dc1815ccea44cecb5676016e2))

- Update Readme.md with branch shuffle
  ([`b261af9`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/b261af9a3542b927b1fbd247f50a9a1343145a69))

### Features

- Add datashader to worker_env
  ([`ee8a49a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ee8a49ac6edbecc66ba9636903a6bd840a05e29e))

- Add flopy to default packages
  ([`e92819b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/e92819b0688f079ca80830e4df9fcad014b3cb33))

- Add package adjust_text
  ([`00bbfe8`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/00bbfe8461c871c1278f1458f24678d5e7be76a0))

- Add pyepsg package to worker_env
  ([`2e2ea2f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2e2ea2fa8458e4a5b93b632f5ab3c6e7f1021382))

- Add pyvizcomm for Holoviews/Jupyter Lab 3.0 compatibility
  ([`7a7eacf`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/7a7eacf634c3f8a8f0fc7c14925e6df39ae04c85))

- Remove firefox, geckodriver and selenium dependencies, as they are not reliable enough
  ([`fd18aae`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/fd18aae5c8a20502ff60b4e32988acf543c3fc7f))


## v0.4.0 (2021-03-29)

### Bug Fixes

- Environment_default.yml ipywidgets pinning
  ([`89c2f1e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/89c2f1edf6973ed0a2918d1b453746bb20877c2f))

### Chores

- Add version, release
  ([`8351a84`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/8351a846dc4c1bf46fe678c7edef96a9a0e89464))

- Build registry images according to branch
  ([`76da4ca`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/76da4ca100b8e767c9cab19e47296e1419001450))

### Documentation

- Add master-stable branch note
  ([`5add915`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5add9153c04474bfd324855208f7689dcf48fb6b))

- Fix link to lbsn-ctl
  ([`0494fad`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/0494fad2093f9be24c1a671ea05bc38b53a82f4b))


## v0.3.0 (2021-03-29)


## v0.2.0 (2021-03-29)

### Chores

- Remove Chrome and Firefox from Dockerfile
  ([`84a10c7`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/84a10c75a825a0bd5970a010d8e98c5dda084fbe))

### Documentation

- Add linebreaks to Readme
  ([`34756cd`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/34756cd1a5351aa86f1844003a5e939a3f9dbeca))

### Features

- Update Dockerfile to JupyterLab 3.0 compatibility
  ([`65615aa`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/65615aab3fe6407360f41669c89aec99c3b48e0b))


## v0.1.0 (2021-03-29)


## v0.5.0 (2021-07-12)

### Bug Fixes

- /home/alex reference to notebooks in compose; update readme
  ([`cc0c7bb`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/cc0c7bb49c5abc81b3266f064244f9efb940ed4a))

- Do not use nbextensions install in jupyterlab 3.0
  ([`995c9fa`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/995c9fa1618bb81aac9ccefcb1505431c23e9a34))

- Environment_default.yml ipywidgets pinning
  ([`5714080`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5714080568a42a0b41ee3b6f8ff226042f253515))

- Image startup error
  ([`47acf77`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/47acf77ee1f89ee497ddfb2df89d35f8d7a57691))

- Ipywidgets not yet released
  ([`bc2bf95`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/bc2bf95f2291efd94c7da0ce5605e530ad35e305))

- Pin jupyterlab to 2.* version on stable
  ([`806526c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/806526ceccd8f5d0b4a26580b2f1d47f2285cf79))

- Remove nodejs not needed anymore for Jupyter Lab 3.0
  ([`a0e91a6`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a0e91a67281277ac79cf4fd2b22d254cb3977f5a))

- Unrecognized arguments: jupyterlab-jupytext
  ([`750950f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/750950f2e24b1156daf849d73e3b1fde2f0e6e9d))

The Jupytext extension for JupyterLab is bundled with Jupytext.[1]

[1]: https://jupytext.readthedocs.io/en/latest/install.html#jupytext-commands-in-jupyterlab

- Use commented default values in .env.example
  ([`8878883`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/8878883e1adcacb9b2a37e0f32143c17c49ff6e4))

### Chores

- Add version, release
  ([`a7d5b4c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/a7d5b4c7b1722d7573d89449611426a2bf32b0d3))

- Build registry images according to branch
  ([`fcd141a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/fcd141ad05cb544cdbfbe80bdea562b7b9157db6))

(cherry picked from commit a8f139915d4daec46cfc84bc5b62e43823693e29)

- Remove Chrome and Firefox from Dockerfile
  ([`59f63cd`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/59f63cd26fad0efc584d16b6c458c68ac2034bdc))

(cherry picked from commit 84a10c75a825a0bd5970a010d8e98c5dda084fbe)

- Shuffle master-latest and stable branch, set stable to master
  ([`571d1e4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/571d1e4f8319b9acab1ced399996176a41b15ea3))

- Update changelog
  ([`520e949`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/520e94980f50663a7d2e1fe0dd8a59af9f18c189))

### Continuous Integration

- Specify both image and build context
  ([`3c31e5a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/3c31e5afdc2e36ea632effb6feb9cee73b9f8a45))

### Documentation

- Add instructions to grep token
  ([`79673bd`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/79673bda684cc1aa30439e6d71e619421e4e9a71))

- Add linebreaks to Readme
  ([`50cc043`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/50cc0434d99931e43efae95f97c7da463686df75))

- Better notes on what is being done
  ([`5f9dc8c`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/5f9dc8ce3aa96e2e172edde10cafb26c832fd6d6))

- Fix link to lbsn-ctl
  ([`9118c1a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9118c1a45d8e817554996cce9769b470cc4b0e28))

- Remove Jupyter lab version in Readme
  ([`56cbf04`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/56cbf0446f0974f993ecdd7c1f72b35cda3fa428))

- Update Readme.md
  ([`89fc22e`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/89fc22e02a0162b6bfb9ecf7e65caef6d169aaa7))

- Update Readme.md with branch shuffle
  ([`34a8b9b`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/34a8b9b2465d3f8325a6467973a08517234e39fa))

### Features

- Add jupyter auto-toc and spellcheck extensions to image
  ([`2a6131d`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2a6131d88213adc75cd0048fa0394fcce43714e2))

- Add jupyter widgets to Dockerfile
  ([`e82373a`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/e82373a2d15a3c2a525b98c9698eb666dcea51f2))

- Add jupytext for notebook git integration
  ([`c4ba2f2`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/c4ba2f25a888531ce45075e783955e420db42dce))

- Add option to set a (static) password instead of always using a volatile token
  ([`10310a4`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/10310a468bdc11c9985403d23971695b28cd3574))

- Add papermill for ci integration
  ([`ffb67bb`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/ffb67bbd47d0f9a21b86ce7e104f906cde959c49))

https://github.com/CFMTech/jupytext_papermill_post

- Add pyepsg package to worker_env
  ([`2f9bba1`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/2f9bba1cd40eb51fba14a94c6720953c73589f8b))

- Improve semantics of environment variable for jupyter notebooks directory
  ([`110079f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/110079fb5675a1c3a0cbe25b6499957c30ea88b7))

- Make web url really optional
  ([`9a02e6f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/9a02e6f9888828ecaaf5801906ad61b459ff350d))

- Show hidden files (e.g. .gitignore) by default
  ([`6f86265`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/6f86265db9ba322ad11fb8b40b0393c2dd56ee9b))

- Update Dockerfile to JupyterLab 3.0 compatibility
  ([`205ab6f`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/205ab6fc9a5f4338f8bcae4d330a0df1f08e3099))

### Refactoring

- Cleanup bash command use
  ([`08cf004`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/08cf0049da48c5d782194751f4d790766328a62c))

- Codestyle
  ([`4a08163`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/4a0816305fd162b06007bb8916c40bebf3da8468))

- Move worker_env dependencies to separate environment.yml
  ([`c34f739`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commit/c34f739462f78abe1a282abd09f924c79c4f757a))
