# CHANGELOG


## Unreleased (:dev tag)

### Bug Fixes

- Use native JupyterLab templating for login.html override
  ([`7b58c97`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7b58c9745c8a92fa7a955e2087cea8a648871c67))

- **conda**: Remove incompatible conda-anaconda-tos plugin from base env
  ([`d6eacaf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d6eacaf72cd2de6bd076ebf449854666c37c7da5))

- **conda**: Remove legacy nodefaults pseudo-channel from environment specs
  ([`af21735`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/af2173553a6830f0aca44f3f1623c8ebcc298207))

- **jupyter**: Configure IdentityProvider cookie secret path for persistence
  ([`cb03c1b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cb03c1b137ba5a1303c55db5ce35607af7b57237))

- **r**: Replace deprecated text shortcuts extension with native JupyterLab 4 shortcuts
  ([`c6e7eb9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c6e7eb941b2b950011f7f2e135ace52da364ff22))

### Chores

- Add telegraf.conf to gitignore, for catching mistakes
  ([`e58637b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e58637bcbe3fe8e1f43b0ff5216e0a1f0fe6ad9a))

- Update CHANGELOG.md
  ([`458afae`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/458afae5dacc3422ba3b3f063fc306dbdecfaf0d))

- Update CHANGELOG.md
  ([`c922662`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c9226629b5f3f99c676f6132f03f2b070438db8c))

- Update CHANGELOG.md
  ([`666fc57`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/666fc5781c68e79c74f00e6db3142c51296c6c68))

- Update CHANGELOG.md
  ([`5b984c3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5b984c368512d40007c3a6425ea2d49e582be706))

- Update version badge and CITATION.cff to 1.1.0
  ([`43d5902`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/43d59023559c7b063adf9645add45d813140d079))

- Update version matrix script to include R packages
  ([`bc25978`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bc2597869a311228aa32d65302833e3eaca885fb))

### Code Style

- Fix markdown formatting issue
  ([`5de2b6c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5de2b6cbdc7dfabbf183681cda6c7fc60aac41ed))

- Fix summary-details not displayed correctly
  ([`ab8dba9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ab8dba9fdbd75f04f2377444100aa076e8fc93fd))

- Limit admonitions on matrix table page to selected max-width
  ([`dbd80fa`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/dbd80fa4979da2e0f0e4ab5be116298fb3db099c))

### Continuous Integration

- Also build dev_r image on all latest changes and publish/overwrite
  ([`dfec1a5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/dfec1a5398366c24d3fe03ff2d55753c27725579))

- Gracefully skip if Quay is down
  ([`3baf6af`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3baf6afc9cca3ab2121dee0b2195650fad3046e5))

- Revise release workflow; push dedicated :dev image with latest features and test releases
  ([`0c433fd`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0c433fd06f1874c6f473fdab04f88e7e89f53eb9))

- Try to reduce emory footprint (OOM) for build jobs
  ([`c633509`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c633509501d7e4cb567aa5d1b6e372091dd97b28))

### Documentation

- Add admonition for preventing implicit assumptions
  ([`31de7b9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/31de7b9c65c1a85777d92ca0d4588c854959cfd0))

- Add ansible playbooks to documentation
  ([`6a72af0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6a72af030f356fcc3e4036b62f6a4093c15743c1))

- Add back links to package origin/documentations for Python and R
  ([`2b2cd3e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2b2cd3e654ff333e91c21269abce2169edc64de8))

- Add controls to video
  ([`0a709a0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0a709a04dbd206b1ddc52d4dac1daf3a2599c66d))

- Add cross-link to building flavors
  ([`65acbb5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/65acbb552c95b9dfb7bbaea4e7ba24f9f33840a2))

- Add dedicated QGIS page and explain how to use QGIS and build the flavor image
  ([`79a117f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/79a117f84c4ba5059b2a5877a01a8441a0df6b85))

- Add Digitale Spuren entry to showcases
  ([`f1ab9b6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f1ab9b6cdf406813b29abdd938720ee7bf8b1dce))

- Add example on login.html override
  ([`396af98`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/396af982fc818d55ee7c742db3dea9f1c2d846cf))

- Add explanation for how version tags will be honored during derived child image builds
  ([`52113f5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/52113f5e005ccf254378e38d0ee839ea683e57d6))

- Add github ssh example
  ([`928a9c3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/928a9c365976166b159093fc77abf44a4a9af866))

- Add guide for hybrid work with vscode remote
  ([`c4c7672`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c4c7672c78b4f7e463885e7b1d36da55e33bed2d))

- Add guide for long running jobs
  ([`a0c0b51`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a0c0b5181baa203d05a0e34796103bfa7b50bebc))

- Add ioer login.html template override as an example
  ([`3ee4063`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3ee4063342b61b52fba5421473c4897a68917d65))

- Add jupytergis page
  ([`3a50e57`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3a50e570742383f7674e7c92437a7d652995d1c9))

- Add new flavors (tags) and explain updated stable versioning and release cycle
  ([`19e4528`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/19e45285379c0a53f7bb0eebcfbd8bd8c3b346f1))

- Add step by step guide on how to build flavors
  ([`2b46e0d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2b46e0d7297d53c728188abaca94a400cb471c4b))

- Add template example link
  ([`95d58f5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/95d58f5f39ff8bee6e2924cfd2b412bf4489f8b0))

- Add version column for dev tag in matrix table
  ([`a9aef33`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a9aef33bb558f40c5279ef920c314c5ec66107cd))

- Allow md in html for summary-details dropdown
  ([`71e9044`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/71e90449174d95f874bf9e9471c2b71db3abbae6))

- Clean up landing page (remove list of packages) and focus on spatial/gis highlights
  ([`1a0672d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1a0672ddc9a776781ab56165665e207f8f21c3e2))

- Clean up matrix table for v1.1.0
  ([`e3a33e2`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e3a33e2a0b6f519e9ee555549feb07a8161aa565))

- Document GIT_USER_NAME and GIT_USER_EMAIL env setting
  ([`2172437`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/21724374a1bd5211d9ee82f7ca6fb85163efdc74))

- Fix admonition/code blocks formatting throughout the documentation
  ([`808722e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/808722e9b3714e04f83f39ac8ef3c7d3acc2fee9))

- Fix bullet point formatting
  ([`528ae73`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/528ae73160960506b5ae58d372398440ce28e4a5))

- Fix code blocks standard formatting
  ([`f8e3a41`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f8e3a414413db8c8fcca1a66cbda6a1f61fefaec))

- Fix markdown admonition
  ([`98e6814`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/98e6814b9e004336537a29e0518a72746135e619))

- Fix markdown formatting
  ([`5e61ba6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5e61ba6eaa0b060c5a1ff603fecda6290a3f7b18))

- Fix markdown indentation
  ([`08982d8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/08982d88ac96a6fa74b5a685ec42857308164d67))

- Fix markdown list formatting
  ([`fa2fd02`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fa2fd02061fc57c0aaee4d3278d0675ebd5cdf46))

- Fix repo branch for urls
  ([`0081678`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0081678fe105a5ec03c9fec3edc04325546a15c2))

- Fix typo
  ([`45673e8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/45673e831cbe78b514c8c7e675c2651fe78bf250))

- Formatting fix for dotenv code blocks
  ([`c48e7e5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c48e7e5011ad8c34f037f6ff9d121400e6ab613e))

- Improve ansible automation for bashrc-commands
  ([`d6613b2`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d6613b285cb2f31fa5d7f86648242fee8c197975))

- Overhaul and imrprove ansible automations, deployment and best-practice examples following
  upstream conventions
  ([`414e473`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/414e473c7e0c3f7ca277817aff78f7627cb8c54b))

- Refactor intro and quickstart, to better address target audience
  ([`30890bb`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/30890bbe207afada193fdae34d0bf8c9146a355a))

- Remove duplicate paragraph
  ([`1613890`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1613890487feed364e9bb1d30c57c06094bda8ed))

- Remove non-working link to source file
  ([`80abc72`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/80abc725b6a8b477d331e1dcc263e6c71ae97a1c))

- Remove unsecure command
  ([`33b40b3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/33b40b30f268f582c77c3f3796e5ad11a1eac51a))

- Remove verbose wording
  ([`ab19116`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ab19116dcf312e9e503c3cd908cbe47390e3c6da))

- Revise developer section to outline release workflow with :dev tag
  ([`e4ab49e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e4ab49ea84ef13171cf195a7186fca5e880293c3))

- Revise docker compose commands throughout the docs to honor compose chaining
  ([`ec5919e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ec5919ed251ff34a38140e73347d0eecfa75c865))

- Revise instructions and best practices for ssh keys
  ([`ff16e80`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ff16e807a878be6ae0a391c68d5bc745ad795536))

- Update .env.example to latest parameters
  ([`010a7ea`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/010a7ea0b879768f06705f853eb0d2d7621a605e))

- Update flavor setup guides for layered compose architecture
  ([`4bf575a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4bf575a24b49f5668000e125ba15c50c4305457c))

- Update matrix version table
  ([`8fd5c7e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8fd5c7e7eba240b40048f753dec55d878c1631bf))

- Update SSH instructions to match latest release
  ([`28ccee7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/28ccee7a82614a02ae20884ce1442dc9d0a33801))

- Update ssh key guide
  ([`23ba6ca`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/23ba6ca683b20cb86d01c82d1988d02e59259c6a))

- Update toc
  ([`05aee90`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/05aee9083680a030f3714de6273160e020828872))

- Use correct link for gitlab profile ssh settings
  ([`00bbbfc`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/00bbbfc14cf7adbf8d47d00cf05a16307aed3738))

- **about**: Add perspective
  ([`0064725`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0064725479c72d5ce5c27616daef4b7d57afba59))

- **chore**: Exclude version listing for unchanged packages
  ([`67734f6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/67734f6223e47d4e3749d0adef5b5de0dbae026f))

- **chore**: Fix geopands and matplotlib version in matrix
  ([`cdc53d3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cdc53d38be13246d896cca52568f0697dc0afc5c))

- **chore**: Fix jupyter_env package extractions missing
  ([`0883675`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/08836751a6cf3f97aca9f1639556a3fc4dd859c9))

- **chore**: Fix minor inconsistencies in matrix version table generation
  ([`3207cd9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3207cd973a6275e682f0e5fcc58c90656ed61c48))

- **chore**: Properly update script to update R-matrix versions
  ([`00311f0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/00311f0fe041ac137cb9e1eda53136f77ff7e2c8))

- **concept**: Add architectural boundaries & scope
  ([`c469baf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c469bafd4696112e81f1d0c47b577e81670b87b1))

- **css**: Clean up extra.css duplicates
  ([`57812d1`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/57812d1bf171286252b04e4e32b366ae36ebdcb0))

- **docker**: Add link to quay image registry
  ([`01a452e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/01a452ee039bb27a76fe15fe18daa1cb9cf36500))

- **docker**: Clarify flavor setup
  ([`fe3e922`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fe3e922dd25d8a823d12572417aeb1c4d8a72350))

- **format**: Fix markdown indentation
  ([`1d825ed`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1d825ed8cbd27c8cfce555099dd4642639f50e0c))

- **formatting**: Add missing linebreak
  ([`6d0edd3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6d0edd346afd74d7e41776fcf9d745c886f6103e))

- **formatting**: Fix markdown code
  ([`8eaab1f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8eaab1f58396c709d63c74f001f84c494d938970))

- **formatting**: Fix markdown code blocks
  ([`63b38b4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/63b38b46cfd12c422b51e6c0a072ba7fa979beda))

- **guides**: Add gitlab ssh screenshot and improve description
  ([`aa9cedd`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/aa9cedd1bf302d2230620f5caf96e7e23ed418f7))

- **sec**: Add note to protected web endpoints
  ([`f08ccc7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f08ccc7e313b9e269460264a45c4715a75c7d971))

- **ssh+vscode**: Improve guidance and best practice steps
  ([`f96abc9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f96abc930400064ba0016cb549ca644df99c416c))

- **ssh-auth**: Cleanup & minimize duplicates
  ([`78f2db7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/78f2db702fd5d20022f7347194bec0620cc3852f))

- **ssh-client-auth**: Add motivation
  ([`ed3272e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ed3272edb3a6df8e9ab764bf1e1153e28e1de823))

- **style**: Add indentation
  ([`2354013`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2354013a627b28b409d73f72a677f94dc5b798dc))

- **style**: Enable automatic table line wrap
  ([`d94be2b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d94be2b521395b3e11eb028559af162c5b47e884))

- **style**: Fix markdown formatting typo
  ([`d63eda7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d63eda774649efaaa8c87bff58504279b6d6ca1f))

- **style**: Fix markdown indent
  ([`289e3db`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/289e3dbd2647fad499f357736ba7056a3f415c23))

### Features

- Add qgis flavor (Dockerfile, compose.yml)
  ([`c7a1863`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c7a186341264281d289dfa91931cf859a0e5af7e))

- Include full GDAL suite, instead of just the libgdal-core
  ([`c12ef17`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c12ef1754975562ccdcf8353798a31977ef624db))

- Persist user settings, workspace layout, and session cookie
  ([`c280b17`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c280b17e8180916bd94a23cb3f26d1de4cafd4ad))

### Refactoring

- Make sure that configuration generation is non-interactive and unattended
  ([`53d2bba`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/53d2bba2ca314e05df16c50cd268d0f5833283f2))

- **chore**: Use fully automated (py) script to extract/update versions in matrix table
  ([`03845eb`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/03845ebd7e3eab5d1754aa2e2f7b44513ee94184))

- **compose**: Convert flavor compose files to layered overlays
  ([`089001c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/089001cdc49147b949f167b7cb45f47e1dbf51ea))


## v1.1.0 (2026-05-29)

### Bug Fixes

- Collections.Iterable bug in Holoviews with Python>=3.10;
  ([`9290949`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/92909499e8e67e5b22d767280e16584c1192e5d5))

### Chores

- Update CHANGELOG.md
  ([`452d065`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/452d0654d86a14510bd96770be8a5ce1a6c0e284))

- Update CHANGELOG.md
  ([`d4d7a0b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d4d7a0bfcff33df706fbc1cf0dfb53f3e5b271bf))

- Update CHANGELOG.md
  ([`dfd628a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/dfd628a6c84741229bc5cda9d5ffe09af84dfeb0))

- Update version badge and CITATION.cff to 1.0.1
  ([`a62de0b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a62de0bd4805033b802c516b8c821a5807ca10f9))

- Update version badge and CITATION.cff to 1.1.0
  ([`ad82aa4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ad82aa4e01a142a2a36b4717cd87767c8efca16c))

### Code Style

- Fix Markdown list formatting
  ([`acb916f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/acb916fe86ac85a25f5c56e1f1d79c612b491a79))

### Documentation

- Add advanced task guides for SSH Auth and cookieninja templating
  ([`0a84e02`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0a84e020f200a3e93279fb961fde740457ca6f0d))

- Add pckage inclusion policy
  ([`c2376a6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c2376a67517d007b6cf98bd8ec78ca72ca2a00c0))

- Change miniconda to mambaforge upstream image
  ([`3086a39`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3086a398cf3b9257a9e50ae8a580cc58d79acd6e))

- Fix typo
  ([`2adc4ff`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2adc4ff931631a87b72dc84bd156550108493705))

- Update matrix version table for v1.1.0
  ([`b51ed77`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b51ed774c7abc10fa4d0ead15437554475861533))

- Update R version in matrix
  ([`a3f4e50`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a3f4e50780c4d2b2737c92639f8eb12f1c55244b))

- Update showcase PDFs and add citation
  ([`6c8f3e5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6c8f3e570f57f67f5fbb0893f0857170adb5ceca))

- Update version matrix for 1.0.1
  ([`0142602`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/014260215405648e55202993ccd3bbd522d6f4ae))

### Features

- Add jupytergis to default jupyter server env
  ([`9a0208c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/9a0208c6302f9f4aaf435f0e17be7ef6707a357f))

- Add option to preconfigure GIT_USER_NAME and GIT_USER_EMAIL via environment variables
  ([`7d3456e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7d3456e96d11c8840303c67a6463ddd76206a8ce))

- Add option to use a shared SSH Socket; add curl to the base container
  ([`94bc53f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/94bc53fa7fa397647e7ea215b7edbba36432b08c))

- Add rioxarray to default worker_env
  ([`a2c35d6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a2c35d63d28732d064cd0618ba775699212cc197))

- Enable spellchecker by default; use sane default (dotted underline, en-us, Markdown support)
  ([`602390d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/602390d8741ad64b84d1f27e81f0dc5b87e6982a))

- Minimum python version for server environment set to 3.10; maximum notebook package
  (compatibility) increased to <=7.5.0
  ([`fa0b241`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fa0b241011905b28623a7a3468148cfec54dc008))

- Update r environment packages
  ([`198e932`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/198e93224af33742cc7cb5a019eef2844dc54f92))

### Performance Improvements

- Switch from Anaconda/miniconda to mambaforge/mamba
  ([`43be77f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/43be77f6990d0337b2905f3ba5ed9f31ef7795be))


## v1.0.1 (2025-09-03)

### Bug Fixes

- Switch to cnda-forge channel for base image, to reduce number of possible CVEs
  ([`4b8f6b6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4b8f6b6dca3a398351930eed095cb7f8b1ba77a8))

- Typo and missing https for quai.io
  ([`c225855`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c225855cd1980ace66d28b0736ac4b049aecb97b))

- Use standard conform token generation
  ([`2180831`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/218083157f68b0e0f3cb23b3b8b1196ed12ddbd0))

### Chores

- Change changelog creation to init
  ([`672c5be`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/672c5be0514e46f39d6dd37d35b015b4fd5b6305))

- Fix get_versions.sh - missing versions and Deprecation Warnings
  ([`65a4be4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/65a4be495425d704e61eeef8263452867bd65e77))

- Fix getting R version from image
  ([`ae9ae1b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ae9ae1b2e241551b899ae01a51c57bfc453e7fea))

- Move remaining URLs from cartolab.theplink to cartolab.fdz
  ([`69e8246`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/69e82460870fd8942824db246874e6a9680cef40))

- Switch docker registry from internal to public quai.io
  ([`4544aa5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4544aa5fe0d84fd704850e06e250bbef01f9bd93))

- Update changelog
  ([`10e28e8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/10e28e89ca761c893c6e1d911669ff1e62a6a292))

- Update CHANGELOG.md
  ([`fd25c2a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fd25c2a8e01e4783dca840a3f0c5561ebacca95d))

- Update version badge and CITATION.cff to 1.0.0
  ([`487a160`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/487a16068dcbecb03048de20e961e8aa46473a2a))

### Code Style

- Fix code formatting
  ([`1caec9c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1caec9cc5309f6ffbe96c538cd23e06089e40b37))

- Fix minor bug in SVG
  ([`6869c35`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6869c3518134e857a02f5768beb98d488e7bba85))

- Fix svg color; add link for zoom
  ([`00cb49c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/00cb49c840d5cd118434e7aa0b0d513febab0bc8))

### Continuous Integration

- Ad push to quay.io registry
  ([`b7fb321`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b7fb3215a8f0c7eb91c59b5c7aea6a08623a57f6))

- Fix quay.io repo path
  ([`f39103f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f39103f0adfbfd87eb80a4d9a3b4482ae2bc967f))

### Documentation

- Add code copy button
  ([`51c781f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/51c781fae7d139865b5c75863d3addc57d4543a4))

- Add concept & philosophy section
  ([`4c15949`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4c1594927720e0600d61ce0bbff9311b5e41f4da))

- Add conda-pack and simple-archive section
  ([`527bb36`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/527bb360813a00cc6883780185fc85d88ee9c678))

- Add cross-links
  ([`956d9e6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/956d9e667cf572995a92dffec4692aa8d8283562))

- Add license
  ([`80c995e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/80c995e8f1bd8af4e1cdc38341f8dd38901d94ae))

- Add missing link formatting
  ([`cc9776d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cc9776d8e98d3d7b834cf39907cbb87814b623c4))

- Add missing step
  ([`5741c21`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5741c21c0e5e9eaa7b8336159172855582e8fcb4))

- Add note regarding Github release creation
  ([`f2a5c53`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f2a5c53a67addd702376cb2e7090388a6697a15b))

- Add note to manually update CHANGELOG
  ([`538b4d8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/538b4d8dda81b9957f40e5cbebb90923b1fc99f4))

- Clarify developer workflow for updating hardcoded versions after a new release
  ([`b014c48`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b014c484b42823475263a4a4eacae12e087f51e6))

- Consolidate environment management into a dedicated documentation page
  ([`160047a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/160047af62473be319a9cf2965b584562d66ee5b))

- Fix outdated internal link
  ([`167e570`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/167e57012f8e9bc5ab0063ec1c41c8d555703589))

- Minor reduction
  ([`09d9031`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/09d9031fcb05f0d8039eb0a515e4c2c507a98e33))

- Minor rephrase sentence
  ([`cd77259`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cd772597e352826459721c60d2413e23727d301d))

- Minor shuffle of admonitions
  ([`5664492`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5664492e4cc8a5fb80e525f322509ccad5610363))

- Overhaul quickstart
  ([`2edc03a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2edc03af9a91c23078f0b40019c53e136cfdf009))

- Replace wording
  ([`4986de7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4986de7cccefd4e5c7e85b4072bf515a29118099))

- Revise developers section, update security model
  ([`dd5c245`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/dd5c2457b8e445e9dd3b963e6b27191401e7cde0))

- Revise docker quick start section
  ([`3470744`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3470744e8ba5e196761c02079ac7d392af88daba))

- Revise live collaboration page
  ([`327b326`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/327b326f151b26ec3e2ee3c203be80ca6e2e1ad1))

- Revise the Showcase & Example Notebooks section
  ([`b35d3b7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b35d3b75cf885bbc4d20c01f9785814e06e49ee9))

- Update Additional resources secion
  ([`7b19b7c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7b19b7c77adba72e981632172ac4296e2fcc9f0f))

- Update changelog
  ([`bb895c3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bb895c344fe9639e2a3d6f2e5dd5ba45212b855f))

- Update R version
  ([`2149b19`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2149b1979d83abb797dd7b63962a14b1132f0897))

- Update title
  ([`efddeae`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/efddeae5596d53a867791d5be5efcdc985dd3ce5))

- Update version table for 1.0.0 and missing GDAL versions
  ([`ae3d637`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ae3d637b8a95235ec58ed7b9786dd02a0dc0c43b))

### Refactoring

- Rename rstudio tag to r, to reduce misunderstanding
  ([`37100ce`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/37100cefb073de49e1bb13bd1ad746ab828a3602))

- Use explicit base image tag, for better reproducibility
  ([`03b4081`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/03b4081785fb3762a9ea50492a69b4e065e72371))


## v1.0.0 (2025-08-06)

### Documentation

- Add fdz logo
  ([`4e6962f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4e6962fc4235ae62327d6f10480760119d965f96))

- Change public git clone path from gitlab to github
  ([`8a1742a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8a1742af892c1e43310119a3e108162b3e7d5381))

- Fix wrong branch link in Github edit uri
  ([`0bb894c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0bb894cbf63cf619f01e9e3e7505386ed9d03427))


## v0.28.1 (2025-08-01)

### Chores

- Compatibility with python-semantic-release > 10.0.0
  ([`940ea4e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/940ea4e30cf5fedf38591eb5b46165c443d4c139))

- Enable --debug in build compose
  ([`7e9bf47`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7e9bf47f144d26c2480087ce545b9eaa2942a4c1))

- Fix GDAL not found
  ([`96cc4b3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/96cc4b37e428f87d6ca9600f74af224b3d5e6bc1))

- Update matrix script
  ([`4b49aaf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4b49aafcaab5a9633ef9cfe0192d46391f3b2684))

- Update ymls for JUPYTER_EXTRA_ARGS
  ([`53c7566`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/53c7566850e2dc8d382f142219caf63f6fddd02d))

### Code Style

- Add horizontal divisions
  ([`63c2726`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/63c272681d1240f730aa5772fabe2bfbf2746c3c))

- Slighly change color
  ([`375c617`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/375c617a34f28b42e44da4365e60f3fc2667cec0))

### Continuous Integration

- Add TLS variables
  ([`fd8b214`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fd8b214c367a6dd886de566481a7bb958b6eda77))

- Change semantic release target
  ([`467b813`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/467b813427d3a25be01cd5681552c5f60a2b20d4))

- Fix DOCKER_HOST flag for running in rootless dind
  ([`69ce3dd`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/69ce3dd4ff659d1cd1888e08c1bf4fff1a8b0096))

- Fix DOCKER_HOST variable
  ([`8407b5d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8407b5d0291ac616819c3eb30164c8c97a60e3f7))

- Fix DOCKER_HOST variable
  ([`5f3a4af`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5f3a4af08cddae293828c88f1a3b7b5c7854f5c8))

- Fix network issues in CI
  ([`6c711ab`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6c711ab91203f51ca7d1c524bcb150d9fc90f843))

- Fix routing/dns issues by switching to --network=host
  ([`f216574`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f216574c999459d12d5bc1e030974d46ddc84d02))

- Further CI TLS fix
  ([`75c7d22`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/75c7d22bcebb12341cfe06afa4bd2688250090c4))

- Simplify dind
  ([`2d3f936`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2d3f93602186acf70bd759b14ce91345a75deec4))

- Switch to native docker-dind runner
  ([`bb3dd6a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bb3dd6a3388bab8c0604a6a751a917ea001ffe4a))

### Documentation

- Add better example for installing additional packages with conda (preferred)
  ([`4d06c5e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4d06c5e3ff42490fa2dadf8d7afb105460512c47))

- Add change to list
  ([`b4ccf75`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b4ccf75a3a1469a46716aa7b79a567670008be42))

- Add example for installing custom R Kernel
  ([`90a5010`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/90a50106da31eb75261647278df225f61ec73f93))

- Add explanation for JUPYTER_EXTRA_ARGS to .env.example
  ([`0092d5d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0092d5df4273f9efb01a2c265f92d9f4afdc5b07))

- Add explanation for JUPYTER_EXTRA_ARGS to docs
  ([`868f8bb`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/868f8bb46ddb8b85d6a4be2c48030e74f5f3ea48))

- Add gdal to version matrix
  ([`2498efa`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2498efa8b35aeb9b57d249caaf981af85f7fdd74))

- Add gdal version info
  ([`7f20051`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7f20051bf02dcac365a28621ca13a0507833899f))

- Add git tip
  ([`06fda09`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/06fda09405abd1bd26fe74636d90ee451a745dab))

- Fix Markdown formatting
  ([`e73caf9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e73caf99c5cf042f66857b2f81adb873f93050ec))

- Fix minor version in matrix
  ([`2aea505`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2aea5051734215b8115f68c202f12206a13c82c1))

- Fix missing linebreak
  ([`0efbab6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0efbab62e86e90ec2188d1cdfb4df5c5ac34f32b))

- Minor improvements
  ([`477809a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/477809a5065c855f1a0d4265c3eb4581c0cdaddf))

- Update about page, add governance, add history for the project and philosophy statement
  ([`24d1c2f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/24d1c2f46bdd35370260dffdfcc580c61a22dcbe))

- Update introduction and examples with new FDZ governance
  ([`e09eecf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e09eecf1936e8f7a942453117a7984505a54b6f1))

- Update version matrix for v0.27.2
  ([`2961eb2`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2961eb2eab6c8365af00f4c2c714ab28c07af444))

- Update version matrix for v0.28.0
  ([`9ecda63`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/9ecda63d0164c66258f1ef6ad14a3a0ec10a1286))

### Features

- Add CITATION.cff for Repository citation integration
  ([`524f273`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/524f273e976e61b0a9348145df2502976f0f34e5))

- Add JUPYTER_EXTRA_ARGS to pass additional (optional) arguments
  ([`4ed74fe`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4ed74fe47b22cef54439edb484b0e4aaa279fd04))

### Refactoring

- Migrate all URLs from vgiscience.org to Gitlab Chemnitz
  ([`d076e57`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d076e57aaf5bf0605202a10824fe85af2789118b))

- Remove Tagmaps from default environment
  ([`276cdf8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/276cdf84134d60af38bed7a367cf9b56ab27b7a2))

- Switch domain
  ([`02ad078`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/02ad0780c5ff6560f4fa6cf466ad1932a0cc91d4))

- Update mkdocs footer
  ([`643853f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/643853f8814cbff2595e675865c1939fd1da6e7f))


## v0.27.2 (2025-05-05)

### Bug Fixes

- Pin geopandas to 1.0.0 (minimal)
  ([`6191bff`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6191bff70ed8c44e99df610f92eac4a17e57ffe1))


## v0.27.1 (2025-04-16)

### Bug Fixes

- COLLABORATIVE flag evaluated vice versa in Dockefile
  ([`1414253`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1414253c83e360836bd8363b8cca404b897a361a))

- Remove pip dependency conflict for numpy
  ([`96e3240`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/96e324033c5c7ef13b07fdd86030759fc2ede251))

### Refactoring

- Pin JupyterLab version to latest
  ([`874612a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/874612aeabd0a7699f7f49fcf280ae6630d7d279))

- Show versions for worker_env
  ([`64635d3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/64635d3243e4cf5c676e460234139976cc1829ee))


## v0.27.0 (2025-04-08)

### Bug Fixes

- Terminado_settings and allow_hidden should always apply; large refactor of CMD-Part in Dockerfile
  (follow conventions)
  ([`5c9db23`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5c9db23f5f2e586cfc6bcaf197b5fec8caf02a64))

- Typo (test ci/version)
  ([`b6c640d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b6c640d25ca669f84acdd5d6a08db86f37bb6d0d))

- VERSION variable not populated in CI
  ([`f449160`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f4491605753a5f70eaecd162de05d3e99df257d1))

### Documentation

- Fix legend
  ([`468bdd2`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/468bdd2713d5be1ee2f53df9fe39f6ffcd0f0b38))

- Set matrix page to full width
  ([`0a7e92b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0a7e92b0cabc1427868fc9f76bd36c9a305ddc32))

- Update note
  ([`582c9fc`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/582c9fc126868b8527db323291c379419a02bd48))

### Features

- Update to JupyterLab 4.4.0
  ([`700b0f7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/700b0f7ab981ab1ad5038bd5a21f1c8c8a7c6816))


## v0.26.0 (2025-03-06)


## v0.25.0 (2025-02-06)

### Bug Fixes

- Announcement appearing again, despite config
  ([`1d50ae0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1d50ae0a6361febade872ea7eea503e98ccdbf84))

- CARTOLAB_VERSION not available on runtime
  ([`ef05e1f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ef05e1fb93a212b445421b2ad58b925e005bd7c8))

- Dask not compatible with latest Bokeh
  ([`177dc0a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/177dc0a4aa4a33c29cae10e8dfe1db486aa38c51))

- Dask not compatible with latest Bokeh
  ([`fc18033`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fc180333b7a90c254395653fcfbc42ad6798a9bb))

- Disable jupyter real time collaboration (RTC) extension by default
  ([`ff4cbdb`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ff4cbdb3bd128c4aa80ffec5363ea32494d4c62d))

### Code Style

- New logo
  ([`e519bd5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e519bd5586bc6fbca6d7e7b84ec5841d001a113a))

### Continuous Integration

- Enable mermaid plugin
  ([`66064f6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/66064f663d108df4d73f8caddfd1742000b05b6b))

- Reduce build complexity by relying on TAG instead of extra APP_VERSION
  ([`2da30e2`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2da30e274553827491231d4f3f3f457f6a832ea3))

- Use explicit mkdocs registry version tag; add mermaid
  ([`9db3c60`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/9db3c604006ef7c48730420543fa4a1e7fe7897c))

### Documentation

- Add compatibility matrix
  ([`20e3aa7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/20e3aa70e224fb1f9b9ac52d224528d678fde0cc))

- Add compatibility matrix for version 0.19.0
  ([`3263d6f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3263d6ffde1387844be0376a5c8eb523060642d7))

- Add missing parameters, update note for jupytext
  ([`96799a7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/96799a7b6fc7af7d8c6ad2418af75514e6d07e0f))

- Clarify difference between COLLABORATIVE and DISABLE_JUPYTER-COLLABORATION flags
  ([`a711178`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a711178559eb0675d638b5ea8258cb32e20a3892))

- Collaboration mode working tested as of 0.24.1
  ([`b12c541`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b12c54141b511c1720e2eaa0b3a5cc5298eae605))

- Improve description of collaboration mode and jupytext incompatibility
  ([`f5f9ea9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f5f9ea9327322f09d2f1b16eae09f8845de394d1))

- Update Matrix for v0.25.0
  ([`2f97f88`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2f97f8842fa883c1e97e9ae7e45c60796e140881))

- Update versions for 0.13.0
  ([`42592db`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/42592dbcdf74e24700c0a888c4a6948c8726bb46))

### Features

- Add 7zip for packaging
  ([`8b06d4b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8b06d4b3eebd7e3c44ad2ceae95dfe0bce6a70ac))

- Add carto-lab docker version to browser tab
  ([`f263464`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f26346411ac8520faae4d2d52147c0d6294b182b))

- Add Cookiecutter env for reproduction package workflow
  ([`0d7a8fd`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0d7a8fde012bddcd6cce3ec728829e6f9072ce8d))

- Allow RTC, collaboration and git-extension to be enabled alongside each other
  ([`c15e96c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c15e96c2e2e888617be551af8711f0da3f9e11f9))

- Allow RTC, collaboration and git-extension to be enabled alongside each other
  ([`821a45f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/821a45fa22b3c0957590816e2dfe0c0219fea10d))

- Pin jupyterlab 4.4.0a3 and latest (beta) RTC package
  ([`ddf229c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ddf229cfcdca188e003a6723b59a35d69f46230b))

- Pin jupyterlab 4.4.0a3 and latest (beta) RTC package
  ([`91283ae`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/91283ae2119f0bb66179ec678d96a0e44341c67a))

- Start terminal sessions in bash by default
  ([`16b6780`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/16b6780e6927ced8a95eacd2679dab29c4a9df4c))

### Performance Improvements

- Reduce build size of Mapntik image
  ([`dbe557a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/dbe557add6b3c49839b1b9a3db1afafa06ce1e3f))

### Refactoring

- Change deprecated c.ServerApp.token to c.IdentityProvider.token
  ([`1fc3004`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1fc300404e3d5f00d4cf0dd905e2fc2d1546ae0a))

- Remove Mapnik fonts bind in r-compose
  ([`7afd62c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7afd62cc678ae7e7fdfb6ed320272f810cfb7051))

- Use version from TAG in build process
  ([`37769ae`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/37769ae3e93366f25a351c0278c434986dbe38d2))


## v0.24.1 (2024-11-13)

### Bug Fixes

- PasswordIdentityProvider in favor of deprecated ServerApp
  ([`1649afe`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1649afe8a509abad75ca4d213eb6dc860ad77202))


## v0.24.0 (2024-11-13)

### Bug Fixes

- Collaboration mode turned off by default
  ([`5f5b3eb`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5f5b3eb16d88bb8cc440d233985b8511e452d748))

- Collaboration mode upstream bug
  ([`bc6107d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bc6107deb5f5a778fffe2656dd848308dea4003d))

- Collaboration mode upstream bug
  ([`7a31b01`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7a31b014965f66a55f1fa93ea5ea8fcd96528078))

- Collaboration mode upstream bug
  ([`561fd98`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/561fd987585462d8b037253e3e3f683214f8de77))

- Collaboration mode upstream bug #2
  ([`32fe030`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/32fe03029fbecf08b97dfa697dd02203d3c47969))

- Grass compose tag
  ([`a8f4153`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a8f4153b2c61b351ef721f4b3b501ee51619f9fe))

- Grass image tag
  ([`15186a6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/15186a66d1c96f01b3a3ddadce8ffd573bac74e9))

### Documentation

- Add grass gis example
  ([`bc48a80`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bc48a8084ec0954618d4376657694aab98ab6d10))

- Add grass gis jupyter example notebook
  ([`6f3a8f4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6f3a8f494742ad19fbc876cf49573a5f1bfdcb31))

- Add steps to override welcome page
  ([`71728e3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/71728e3b66d7a266b02d58446d487f41986c831b))

- Fix typos
  ([`cd79995`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cd79995f5b9979f98370b71773edd9463d114b29))

- Improve description of collaboration mode
  ([`5f24797`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5f24797ffb8ed3bceb2d3e6edc05e750e2b145a9))

- Minor rephrasing
  ([`cf1fd24`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cf1fd241a3b7502099f9dede5cc6fef93b423da7))

- Rename use cases to 'tasks'
  ([`4577b64`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4577b64a4643a8e17e00ed06800f1e664d31c69f))

- Update grass image tag
  ([`0b5b79e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0b5b79e81016ff0c50af08dcab42cf2ba794aa35))

### Features

- Add grass gis docker-compose.yml
  ([`0f255bf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0f255bff01dc0a9ce2d1fe25b0bb22724edc3aa9))


## v0.22.1 (2024-09-03)

### Bug Fixes

- Disable opening browser warning
  ([`b3d6c7a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b3d6c7a69996c444ce94619e37b4e0ad14119290))

### Documentation

- Add GL_TOKEN to release cycle
  ([`3a9896e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3a9896e45bde89695d1fb28fe59a50da85709b73))

- Add screenshot of link sharing in collaboration mode
  ([`7a8f959`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7a8f95983bc5b791507afe9aae32f6a5699c21c3))

- Document the collaboration feature
  ([`2e0be22`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2e0be227635d93b6de62003c8ddacbbacb7e177c))

- Update env variables
  ([`6f467c5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6f467c5fdd86715f4737bb8806c05b6e137fb186))


## v0.22.0 (2024-09-02)


## v0.21.0 (2024-09-02)


## v0.20.0 (2024-09-02)

### Bug Fixes

- Collaboration not working as expected
  ([`2fdf540`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2fdf54083f286416a9d697b2a4adc68b5cabb779))

- Deprecated notebook_dir
  ([`e9c216f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e9c216f2980c3bab466c48beec45a5c3c8da795e))

- Jupyter collaboration update version to fix incomatible jupyter server
  ([`8883bf4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8883bf438eb31f6772bc56192e4ebae59e957cbb))

### Continuous Integration

- Fix images not building
  ([`706572d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/706572db18520f0510f872d4bcc5835a4adea780))

### Documentation

- Add instructions for different versions
  ([`b743c44`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b743c4496904d7caa28a0b7691bd51a8601afca9))

- Add r packages list and reference
  ([`2bf0d76`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2bf0d76df95682a7b54c90e87438cb6845e42152))

- Change collaboration default to false
  ([`1a597e6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1a597e600c6649b94656a32c2cb581646d7b5dfe))

- Fix bullet list formatting
  ([`06629a6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/06629a6643cc0ab89b7686c31df92c18bdc0e467))

- Fix rstudio yml reference
  ([`abdfcdd`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/abdfcdd8dd350dd12d473b1921da68dabce494ab))

- Fix typo
  ([`f1499a4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f1499a4e1b3168c9c269d7c5eb12ea855ce8e4b5))

- Rename rstudio to r
  ([`30cf4bf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/30cf4bfbcdcf88f9e00044281784f1e246b2ca0e))

- Update TOC§
  ([`9ea9daf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/9ea9dafb5e0a5331ab95156ee385ff1d50cd38a2))

### Features

- Add r mapping packages
  ([`c7b6af9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c7b6af9627d622ed9a0b95c0e3b459b1cb8ebcd5))

- Add several environment variables to disable extensions; optionally allow generating a TOKEN in
  addition to a password
  ([`a3c838a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a3c838a35656e7156450a060f7f1f938cb2f8e3a))


## v0.18.0 (2024-08-05)

### Code Style

- Fix transparency in logo
  ([`633929c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/633929cf608773f8bf21ac8210498bcc687863c4))

- Slighly improve logo
  ([`83115f5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/83115f56bda6eb7ec19742c9d2a3ee439b4be067))

### Continuous Integration

- Add rstudio build
  ([`1e3fe39`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1e3fe39215696ef8df7b21ed866478c3dfd59be5))

- Build docker images when manual pipeline trigged
  ([`faf43c9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/faf43c992a1c906fc28cc21625ecbdb3ca066620))

- Fix order of build priorities
  ([`e946bd3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e946bd3a58d004251ef8333ed39bea53ce5da6d1))

- Remove manual trigger, as it does not work as intended
  ([`7804a88`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7804a88980923013444bcb1f416299942f531276))

### Documentation

- Add packages graphic
  ([`0bd44c8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0bd44c8eb37ae762faaf944b6885a23e20a675f5))

- Add rstudio version description
  ([`5fbe070`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5fbe0701634323218c759b5f4e2535cd90ed5642))

- Add security note
  ([`b843fb7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b843fb7dab169d00fb81fd2fcb8b0fa62a5bf8ae))

- Minor updates to the docs
  ([`8e51793`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8e517934d17fb7f8c0c8cafcbe7a98667f673ae2))

### Features

- Add RStudio Dockerfile extended image, push to extra registry tag
  ([`9f4ad88`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/9f4ad8841f857beb4b8c21e0f9631e49ad4af75b))


## v0.17.0 (2024-07-26)

### Bug Fixes

- Jupytext and collaboration feature cannot be activated together
  ([`2acc71e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2acc71eceb18478acb301c9d151b17d234260a64))

- PROJ error
  ([`13d5438`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/13d54380bb7ed0e44368e96a92f4fbd752484419))

### Chores

- Add mkdocs config
  ([`f28b32c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f28b32c2a9d8a6734d96f4f433e1b8e179c21cc9))

- Fix missing backslash in Dockerfile
  ([`3efc5a7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3efc5a79422cbbfc9f8e302616d642b5a40daf52))

- Update .gitignore
  ([`441d416`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/441d416a93c6292a9beda8e27a17563905bd61db))

### Code Style

- Change blue colors in badges and docs
  ([`bce28f5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bce28f59f1194429eb6f8cd37e7caea84f885e88))

### Continuous Integration

- Add gitlab-ci workflow to build and deploy the docs
  ([`39cca9b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/39cca9b682ffc54056b85d3c7f1ec0e87722e423))

- Add markdown include to mkdocs.yml
  ([`6672d79`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6672d791d3a1576eded09ddcc6ed65f856d7642d))

- Do not build images if no changes happened
  ([`04265ac`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/04265aca99a6ae9188336e3e5681f64a0b424c25))

- Exclude container build for gitlab-ci and mkdocs.yml changes
  ([`7ad29a4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7ad29a49b89d81bdfe6a307cdd3e0af2c4d9b57f))

- Fix changes yml tag not working as expected
  ([`ad917e0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ad917e01a23e62679b56b7d878e7cbc666f34243))

- Fix changes yml tag not working as expected
  ([`95784c1`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/95784c1185d89c2c33f3c3b5bfa1822a61d76dfe))

- Fix changes yml tag not working as expected
  ([`4c8b2c5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4c8b2c52d580b433013ef49fa8b3763f18ed447b))

- Fix gitlab-ci
  ([`b4ae095`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b4ae095b2be62f56a5a6f6ef605981b8a7c2cc86))

- Fix gitlab-ci
  ([`3e00c7f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3e00c7fbad8e8f7890614441aeb89e2595b7e8c6))

- Fix gitlab-ci
  ([`2c819f4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2c819f447266e18a2420bdd87b1de630865d5aff))

- Fix gitlab-ci
  ([`3eea538`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3eea538df03cb0161191df2a47d524ff2efc3ece))

- Fix mkdocs build
  ([`defe308`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/defe308fab7f614a0edfcb57a8b1d75a6a4c06ed))

- Fix typo
  ([`35caf5b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/35caf5be3650ba74b97e0d5ee645f7e82d2c113a))

- Try to get the if and changes following AND expression
  ([`b04109a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b04109a94ba6122af0e1b9ac46ee48e648f4ec3f))

- Try to get the if and changes following AND expression
  ([`2c55511`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2c55511feeeae6fa33999bbed327c841a05195b9))

- Typo in version.svg
  ([`f4d4b7b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f4d4b7bd2153f8e8f1e673df5f475205a36d8089))

### Documentation

- Add note to use cases
  ([`d970407`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d970407560b1664ce3a2ed2cbb5d24ca1e2327e6))

- Cleanup and reorganize docs
  ([`a12fb8f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a12fb8f456c6a1ebe2c0ba340ff4f6efc7335464))

- Cleanup Readme.md
  ([`4e05daa`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4e05daaad9bf32f930b6c8c4403989f0ab0ecb65))

- Minor rephrasing
  ([`2992c1e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2992c1eca34b55837a3b0c477b0fbf3ebcfa1dd7))

- Prepare initial mkdocs
  ([`6fc86d3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6fc86d33c64e0fccc999fc16d60094b5d13f5685))

- Use https git clone, for broader applicability
  ([`e0cf5ce`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e0cf5ce2cb2bd56dfc4041dc3984931f3e3a711b))

### Features

- Add JUPYTER_AUTOSHUTDOWN_TIMEOUT to environment variables, so that users can disable auto-shutdown
  ([`d149be2`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d149be2a8c26f8a65e64eb3f0573a92affa83a67))


## v0.16.3 (2024-07-19)

### Bug Fixes

- Mapnik Dockerfile build
  ([`5ec99c5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5ec99c5942c763dd560586b5130508db6a33dba3))


## v0.16.2 (2024-07-18)

### Bug Fixes

- Manual bump
  ([`30ce94c`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/30ce94c9e059e38cff9c4f68c0a790741ba0e19b))


## v0.16.1 (2024-07-18)

### Bug Fixes

- Manual bump
  ([`0e83810`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0e8381073f984ca9217dbc843bd12c93f48343b4))


## v0.16.0 (2024-07-18)

### Bug Fixes

- Nbconvert module not found (notebook.base)
  ([`ed16cbc`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ed16cbccfe6142a37c3cbfd506a90a335f084fe7))

### Chores

- No remote image when building
  ([`f8e648f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f8e648f99859a73c487fe3985742b895131a82cb))

- Remove deprecated version tag in compose
  ([`63b80f0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/63b80f00b1271f82528e0e1e804d133ce123ad92))

- Remove deprecated version tag in compose
  ([`4a30bad`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4a30bad15f8a03eb85ff1f383c549feeddb234fb))

### Documentation

- Add note to test local build
  ([`15f87b1`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/15f87b152a8383b02000708df0f9eb846a552e29))

- Update docker compose commands
  ([`b0da8af`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b0da8af41440b15a75bedecac1f2375fd8590544))

### Features

- Update python package list
  ([`6345628`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6345628bfc296456db20b40795eab4a49f4ff0dc))


## v0.15.7 (2023-09-15)

### Bug Fixes

- Correct new path to passwd
  ([`cf725ff`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cf725ff9572d880541038a5ee1e04084bd8979db))


## v0.15.6 (2023-09-15)

### Bug Fixes

- Password authentication not working
  ([`4b9f8fa`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4b9f8fae7db3fff1bfbff0a3c242b32c8b794c48))


## v0.15.5 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`dc1b47e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/dc1b47eb4a9d9d84cb85b747bef98cecd92ef8c2))


## v0.15.4 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`46076b5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/46076b52f83e95ce3e6d9d5d6bb38bec04bc5633))


## v0.15.3 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`bfe814f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bfe814f0decbeb56bb358792c64b8b5cac79047f))


## v0.15.2 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`5fb60b1`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5fb60b1b2949b1f6384d113f0890887ec9e18bdd))


## v0.15.1 (2023-09-15)

### Bug Fixes

- Update api_domain for semantic-release
  ([`830c80e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/830c80e09ae6181833ef2ea7b537a1a8a794b4b0))


## v0.15.0 (2023-09-15)

### Chores

- Bump jupytrer env python to 3.9 (minimal)
  ([`3a4b68f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3a4b68f5a9b6c312d802b7ce39c0ac95b8519937))

- Explicitly add GL_TOKEN
  ([`997b6dd`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/997b6dd78662f1323cf3e79754b004a45f7a249c))

- Migrate from setup.cfg to pyproject.toml (semantic-release)
  ([`6e9d4c9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6e9d4c9c6c75e1c23fd93f6252a6ed12afb0a2fe))

- Remove pinning of nbconvert in jupyter env
  ([`fbae7f8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fbae7f86a1f7b97c5b7748f61ba0458b37e12f21))

### Documentation

- Add semantic-release description for developers
  ([`16f715a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/16f715aa067ab75ede1885db575126ad36968208))

- Update package list
  ([`3863ed5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3863ed5b4d540d11201f365bea652d8ae1cd42d8))

### Features

- Add rasterio to default env
  ([`f0b2bee`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/f0b2bee621d25a683c5e2f3f1b232706dce7671d))

- Bump jupyter lab minimal version to 4; remove classic notebook extensions
  ([`69a6535`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/69a653547237d3d4a7fc0408a4065e02ff7df3ca))


## v0.14.0 (2023-07-14)

### Documentation

- Clarify python executable to be used for installing ipykernel spec
  ([`8e52943`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8e529435c753a95b8e86f2d0de77eea0b3636b5b))

### Features

- Update Jupyter Lab to 4.0
  ([`5af1cc1`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5af1cc1a5bf426513921598b6c62f82f166b5b9a))


## v0.13.0 (2023-03-27)

### Bug Fixes

- Disable Jupyter news
  ([`8811623`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/88116236186b4680247c7aba607e10eb6d6b5d32))

### Documentation

- Clarify pinning of tag via .env
  ([`0f4f16e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0f4f16eaf938c577ce75d8fae3172bb84f383e12))

### Features

- Add default persistent environment path and update docs
  ([`9b85dd5`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/9b85dd5d45a39be9717c4108725df5739c88972b))


## v0.12.3 (2023-02-21)

### Bug Fixes

- Incompatibility between numpy>1.2 and Shapely<1.8
  ([`6dcade0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6dcade084283712bc5631fec46dc9360e1bffd4a))

### Chores

- Add READONLY_USER_PASSWORD as environemnt variable to default compose file
  ([`3ba67bc`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3ba67bccd068e9606e548acae327cfcec0f4b662))

### Documentation

- Update reference to docker-compose build with explicit compose file
  ([`80d4cd9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/80d4cd953255690d63880f17258db7413e40773c))


## v0.12.2 (2023-02-03)

### Bug Fixes

- Ci-commit-tag empty for push-commits
  ([`ae3786d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ae3786dfc2736a3ca154635f0ab86e921d501d70))


## v0.12.1 (2023-02-03)

### Bug Fixes

- Ci-commit-tag empty for push-commits
  ([`659d74d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/659d74de7d95537347ba9b55572eb613a160f029))


## v0.12.0 (2023-02-03)

### Continuous Integration

- Latest and stable version tags not built
  ([`99e1bde`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/99e1bde3bc9d2b5ccfd8d6f721662c26643efc82))


## v0.11.0 (2023-02-03)

### Bug Fixes

- YAML syntax
  ([`da3a8e8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/da3a8e81ec510808b355bddc146c4482042100d4))

- YAML syntax
  ([`daed0fe`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/daed0febac9329202fd21c10cc11b2e110a29c8f))

### Continuous Integration

- Add explicit stages to .gitlab-ci.yml
  ([`2c1f0f8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2c1f0f88e5a4f36780b1679427981e77a569680c))

- Fix rules and only not allowed to be used together
  ([`2fa64d6`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2fa64d62fee41abcc21f58621392c595cb41656f))

- Fix Semantic-Release custom hvcs domain
  ([`a1e23f4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a1e23f48249fcf4507dfd2c747ea70e13d71d78f))

- Only build and push stable and latest version tags if CI_COMMIT_TAG is not empty
  ([`933944d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/933944de78cd4b7366f823b8ca3ccda07279a194))

### Features

- Add TAG environemnt-variable to pin specific versions in docker-compose.yml
  ([`e8144b8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e8144b87a6601e8a550c81b67a79f36fe05ea23c))


## v0.10.0 (2022-12-21)

### Chores

- Use the latest registry image in default docker-compose.yml
  ([`120c53a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/120c53ad12c4917ecc517fbaf17e0a3e8f082d8b))

### Documentation

- Add explicit docker network create
  ([`023e4c7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/023e4c7497c0cb5ad5d7b71ec193b06a4cfebaed))

- Clarify steps to setup svg_export
  ([`cbb888e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cbb888e26a69ee4d39cf31ca4f22a69215588f5d))

- Suggest to pull registry image, to prevent build of image by default
  ([`0879b51`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0879b513b7aa555f1a31637e7bd2bd51fd26ec2f))

- Update readme header
  ([`5e26d21`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5e26d21dee3b875d48fb6b779ac078382b948003))

### Features

- Bump nbconvert from 6.5.* to 7.2.*
  ([`ee20a57`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ee20a5744569ec5163ed46192ebc0a827b6a2988))


## v0.9.0 (2022-08-30)

### Bug Fixes

- CI extract version from file
  ([`9d10722`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/9d10722215ae99394294ded3005c0dafa2cb8eb7))

- Ipywidgets compatibility
  ([`bb1c0be`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/bb1c0beaa8718ffaba49e282da81df979d291ca7))

- Use master-latest for versioned releases
  ([`6d390ef`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/6d390ef36ac9316b3a423a2ba5c3c6c49c30b259))

### Code Style

- Readme formatting
  ([`4dcfee0`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4dcfee02c94e554164b196d1e7edd15e831a0a1d))

### Continuous Integration

- Build and push versions and latest tags
  ([`2a40eea`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2a40eeaa24726fcb0e10c0380c2a72213c5376ec))

### Documentation

- Add COMPOSE_FILE to .env examples
  ([`5cf73a2`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5cf73a2654a869dce9d394a1f1951cd057ce64e9))

- Add instructions to install selenium and webdriver
  ([`cb4038a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/cb4038a19bdd849a9abdd9bae4d7ae566fc4ddf0))

- Update header
  ([`c57caa3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c57caa3c0a7b2e43fc24b593ec852b909e790eb8))

### Features

- Add .version to Dockerfile, to be able to get the Container version at runtime
  ([`31ed7cb`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/31ed7cbe4337020fd7eebd540dd00d88a182ca79))

### Testing

- Add test for ipywidgets (tab)
  ([`5895168`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/58951686a970d531b6f0665f7806197135333f93))


## v0.8.0 (2022-08-25)


## v0.8.1 (2022-08-25)

### Bug Fixes

- Formatting§
  ([`56db080`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/56db0806aadc89ff28dea849cb5aa34121403011))

- Typo
  ([`5138e09`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5138e09c179cea1cc627d47af6bcc0c48d1550c7))

### Continuous Integration

- Add docker release versions
  ([`4887b5d`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/4887b5d8d19d964353cc6edfcfbdcdc718faabf1))

### Documentation

- Add badges
  ([`1f4d139`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/1f4d1398471aa387c40139438a11bb38e50b3cef))

### Features

- Add mapnik-cli package to jupyterlab:mapnik
  ([`c76b423`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/c76b423751d15dce8e226560800c9e177fc61a8d))

- Add matplotlib-scalebar package to default
  ([`b3159fc`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b3159fc7ce041f413bfb578cfe659dadfb56b291))

- Add PySal ESDA to default worker_env
  ([`0a21727`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0a21727c4f0b8f634f31cb6eca5b366d49d742b4))


## v0.7.0 (2022-07-22)

### Bug Fixes

- Nbconvert pinned to old version
  ([`fb611fc`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fb611fc04ef08db9e222597ca92e27e9d6623d54))

### Continuous Integration

- Build Mapnik tag only on latest
  ([`7667e2f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7667e2f35f2c7a39255343c98b5f4121e55d7e52))

### Documentation

- Add note to use registry images in readme
  ([`05528e4`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/05528e481c4dce7ed41346e45c02d2354efe50d9))

- Update readme to include collaborative editing feature
  ([`7b40eb9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7b40eb97dd38b83b95566476d6cf924711fe3f38))

### Features

- Add Mapnik docker and tag
  ([`3ce9d06`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3ce9d064a4829ef2870fb6ee9c6009d8d6c1d49e))


## v0.6.1 (2022-03-24)

### Bug Fixes

- Incompatible geoviews package for latest holoviews release
  ([`5baa575`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5baa575acfcff1ec6c861adfc700f7aaf8a46865))

### Chores

- Add ipyleaflet package to default env
  ([`7e08c82`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7e08c8202da83d4af9226d72f95f5158c7349141))

- Pin shapely to 1.7.1 (and add hvplot), default env
  ([`2d7683b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2d7683b4f45a305f6c742b815fd9add1e3950bda))

### Documentation

- Add warning to update pinnings regularly
  ([`5b40fbc`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5b40fbcea47ecfbe90027844899e086400ab31a7))


## v0.6.0 (2021-07-12)

### Bug Fixes

- /home/alex reference to notebooks in compose; update readme
  ([`97f3525`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/97f35259a2039613379158bb259ee0cf83b9614e))

- Do not use nbextensions install in jupyterlab 3.0
  ([`0edd466`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0edd4661d0e6476377b1ce8e607f8a9ff0dfbfde))

- Ipywidgets not yet released
  ([`96ac9ba`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/96ac9ba21b3677ee7b3abdbb5997c65c6352cf22))

- Move config to ServerApp transition
  ([`fbd83fe`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fbd83fe3c389740f5b5dda69e6c22807676b3012))

- Remove nodejs not needed anymore for Jupyter Lab 3.0
  ([`a6008a3`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a6008a33b0c8d3a3a55be6691485f7727ce06984))

- Use commented default values in .env.example
  ([`8ea4401`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8ea44015777c574dba95f7eafff15b9ae4b681f7))

### Chores

- Build registry images according to branch
  ([`a8f1399`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/a8f139915d4daec46cfc84bc5b62e43823693e29))

- Shuffle master-latest and stable branch, set stable to master
  ([`d875227`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/d875227947800b5226b169f476dbf2ec7961d295))

- Update changelog
  ([`3ade60a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/3ade60a7f560963463232e24226886b30654878b))

### Documentation

- Add list of packages and links to documentations to readme
  ([`2229554`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2229554742d0508dc1815ccea44cecb5676016e2))

- Update Readme.md with branch shuffle
  ([`b261af9`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/b261af9a3542b927b1fbd247f50a9a1343145a69))

### Features

- Add datashader to worker_env
  ([`ee8a49a`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/ee8a49ac6edbecc66ba9636903a6bd840a05e29e))

- Add flopy to default packages
  ([`e92819b`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/e92819b0688f079ca80830e4df9fcad014b3cb33))

- Add package adjust_text
  ([`00bbfe8`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/00bbfe8461c871c1278f1458f24678d5e7be76a0))

- Add pyepsg package to worker_env
  ([`2e2ea2f`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/2e2ea2fa8458e4a5b93b632f5ab3c6e7f1021382))

- Add pyvizcomm for Holoviews/Jupyter Lab 3.0 compatibility
  ([`7a7eacf`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/7a7eacf634c3f8a8f0fc7c14925e6df39ae04c85))

- Remove firefox, geckodriver and selenium dependencies, as they are not reliable enough
  ([`fd18aae`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/fd18aae5c8a20502ff60b4e32988acf543c3fc7f))


## v0.4.0 (2021-03-29)

### Bug Fixes

- Environment_default.yml ipywidgets pinning
  ([`89c2f1e`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/89c2f1edf6973ed0a2918d1b453746bb20877c2f))

### Chores

- Add version, release
  ([`8351a84`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/8351a846dc4c1bf46fe678c7edef96a9a0e89464))

- Build registry images according to branch
  ([`76da4ca`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/76da4ca100b8e767c9cab19e47296e1419001450))

### Documentation

- Add master-stable branch note
  ([`5add915`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/5add9153c04474bfd324855208f7689dcf48fb6b))

- Fix link to lbsn-ctl
  ([`0494fad`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/0494fad2093f9be24c1a671ea05bc38b53a82f4b))


## v0.3.0 (2021-03-29)


## v0.2.0 (2021-03-29)

### Chores

- Remove Chrome and Firefox from Dockerfile
  ([`84a10c7`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/84a10c75a825a0bd5970a010d8e98c5dda084fbe))

### Documentation

- Add linebreaks to Readme
  ([`34756cd`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/34756cd1a5351aa86f1844003a5e939a3f9dbeca))

### Features

- Update Dockerfile to JupyterLab 3.0 compatibility
  ([`65615aa`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commit/65615aab3fe6407360f41669c89aec99c3b48e0b))


## v0.1.0 (2021-03-29)


## v0.5.0 (2021-07-12)

- Initial Release
