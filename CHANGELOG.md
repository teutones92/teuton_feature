# 1.2.0

- ArgParser-based commands with options:
  - `create`: `--path`, `--template`, `--dry-run`, `--verbose`
  - `delete`: `--force`, `--path`
  - `list`: `--path`
  - `templates`: lists available templates
- Config support via `teuton_config.yaml` (`features_path`, `default_template`, `author`, `organization`, `templates`)
- Cross-platform paths using `package:path`
- New templates system (`default`, `minimal`) for Clean Architecture + Cubit hooks
- Improved help output and added `--version`
- Lints and tests added; GitHub Actions CI (analyze + test)

# 1.1.0

- Initial release of **Teuton Feature CLI** 🎉
- Added commands:
  - `create` → generates a new feature
  - `delete` → removes a feature
  - `list` → lists all features
- Includes Clean Architecture structure with Cubit and GetIt
