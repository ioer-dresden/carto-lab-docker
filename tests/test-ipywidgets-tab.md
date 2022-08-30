---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.14.0
  kernelspec:
    display_name: worker_env
    language: python
    name: worker_env
---

```python
import ipywidgets as widgets
from pathlib import Path
```

```python
pathrefs = {
    0: ('img_topics.png', 'Sample Title'),
    }
```

```python
widgets_images = [
    widgets.Image(
        value=open(Path('resources') / pathref[0], "rb").read(),
        format='png',
        width=700
     )
    for pathref in pathrefs.values()]
```

```python
children = widgets_images
tab = widgets.Tab()
tab.children = children
for i in range(len(children)):
    tab.set_title(i, pathrefs[i][1])
```

```python
tab
```

```python

```
