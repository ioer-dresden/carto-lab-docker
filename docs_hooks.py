import re
import shutil
from pathlib import Path

ROOT = Path(__file__).parent

def _read_version() -> str:
    text = (ROOT / ".version").read_text(encoding="utf-8")
    match = re.search(r"__version__\s*=\s*['\"]([^'\"]+)['\"]", text)
    return match.group(1) if match else "dev"

def on_pre_build(config):
    # Makes local `mkdocs serve` / `mkdocs build` work without running CI first
    src = ROOT / "CHANGELOG.md"
    dst = ROOT / "docs" / "changelog.md"
    if src.exists():
        shutil.copyfile(src, dst)

def on_page_markdown(markdown, page, config, files):
    version = _read_version()
    return (
        markdown
        .replace("{{ version }}", version)
        .replace("{{ v_version }}", f"v{version}")
    )