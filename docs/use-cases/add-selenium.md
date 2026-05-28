## Add selenium and webdriver

The base container is constructed lightweight and comes without a webdriver.

If you need a webdriver (e.g. for `svg` output in Bokeh), either update the Dockerfile
or temporarily install Selenium and Chromedriver (e.g.).

### Manual Steps: Chrome

1. Install Selenium

```bash
conda activate worker_env
conda install selenium webdriver-manager -c conda-forge
```

2. Install Chrome

```bash
apt-get update && apt-get install -y gnupg2 zip wget
curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
apt-get -y update
apt-get -y install google-chrome-stable
```

3. Optional: Install Chromedriver

This is an optional step, since `webdriver_manager` will automatically install the matching Chromedriver (see below).

Get the Chrome version and install the matching Chromedriver

```bash
google-chrome --version
```
> Google Chrome 104.0.5112.101

- go [to](https://chromedriver.chromium.org/downloads)
- click on matching version:
    - > If you are using Chrome version 104, please download ChromeDriver 104.0.5112.79
- copy path to `chromedriver_linux64.zip`
```bash
cd /tmp/
wget https://chromedriver.storage.googleapis.com/104.0.5112.79/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /usr/bin/chromedriver
chown root:root /usr/bin/chromedriver
chmod +x /usr/bin/chromedriver
```

4. Use in Jupyter

```python
from bokeh.io import export_svgs
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

options = webdriver.ChromeOptions()
options.add_argument('--headless')
options.add_argument('--disable-gpu')
options.add_argument("--no-sandbox")
options.add_argument("--window-size=2000x2000")
options.add_argument('--disable-dev-shm-usage')        

service = Service(ChromeDriverManager().install())
webdriver = webdriver.Chrome(service=service, options=options)

# Export svg in Bokeh/Holoviews
p =  hv.render(my_layers, backend='bokeh')
p.output_backend = "svg"
export_svgs(p, 
    filename=output / 'svg' / 'graphic.svg',
    webdriver=webdriver)
```

Note that `--disable-dev-shm-usage` is necessary for Chrome to work inside Docker.
