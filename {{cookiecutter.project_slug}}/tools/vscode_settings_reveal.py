import argparse
import itertools
import json
import pathlib


BASE_DIR = pathlib.Path(__file__).parent
vscode_settings_path = BASE_DIR.parent / ".vscode" / "settings.json"

always_hide = ("src/server/collected-static", "src/server/media")
hideables = (
    ".devcontainer",
    ".editorconfig",
    ".envrc",
    ".flake8",
    ".gitignore",
    ".prettierignore",
    ".prettierrc",
    ".vscode",
    ".vsls.json",
)
always_unsearchable = ()


def _load_settings():
    with open(vscode_settings_path) as fin:
        return json.load(fin)


def _set_admin_excludes(settings, exclude):
    settings["files.exclude"] = dict(
        itertools.chain(
            ((k, True) for k in always_hide),
            ((k, exclude) for k in hideables),
        )
    )
    settings["search.exclude"] = dict(((k, True) for k in always_unsearchable))


def _persist_settings(settings):
    with open(vscode_settings_path, "w") as fout:
        json.dump(settings, fout, indent=2)
        fout.write("\n")


def main(exclude_hideables):
    settings = _load_settings()
    _set_admin_excludes(settings, exclude_hideables)
    _persist_settings(settings)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--conceal", action="store_true")
    args = parser.parse_args()
    main(args.conceal)
