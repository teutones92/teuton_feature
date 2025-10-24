[![Pub Version](https://img.shields.io/pub/v/teuton_feature)](https://pub.dev/packages/teuton_feature)
[![GitHub Stars](https://img.shields.io/github/stars/teutones92/teuton_feature)](https://github.com/teutones92/teuton_feature)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Dart](https://img.shields.io/badge/SDK-%3E%3D3.0.0-blue.svg)](https://dart.dev)

# 🧩 Teuton Feature CLI

A powerful CLI tool that generates **production-ready Flutter features** using **Clean Architecture**, **Cubit state management**, and **GetIt dependency injection** — in seconds.

## ✨ Features

- 🏗️ **Clean Architecture** scaffolding with separation of concerns
- 🔄 **Cubit** state management with built-in error handling
- 💉 **GetIt** dependency injection setup
- 📁 Consistent, industry-standard folder structure
- ⚡ Generate complete features with a single command
- 🎯 Production-ready code templates
- 🔧 Customizable templates and naming conventions

## 🚀 Quick Start

### Installation

Install globally from pub.dev:
```bash
dart pub global activate teuton_feature
```

Or install from source:
```bash
dart pub global activate --source path .
```

### Usage

Navigate to your Flutter project and run:
```bash
teuton_feature create <feature_name>
```

## 📖 Commands

### Create a Feature
```bash
teuton_feature create profile
```

### Create with Custom Path
```bash
teuton_feature create profile --path lib/modules
```

### List Available Templates
```bash
teuton_feature templates
```

### Flags and Options

- Global:
  - `--help`, `-h`: Show help
  - `--version`, `-v`: Show version

- `create <name>`:
  - `--path`, `-p`: Base features path (overrides config)
  - `--template`, `-t`: Template to use (`default` | `minimal`)
  - `--dry-run`: Simulate without writing files
  - `--verbose`, `-v`: Verbose output

- `delete <name>`:
  - `--force`, `-f`: Do not ask for confirmation
  - `--path`, `-p`: Base features path (overrides config)

- `list`:
  - `--path`, `-p`: Base features path (overrides config)

## 📂 Generated Architecture

```
lib/features/profile/
├── data/
│   ├── datasources/
│   │   ├── profile_local_datasource.dart
│   │   └── profile_remote_datasource.dart
│   ├── models/
│   │   └── profile_model.dart
│   └── repositories/
│       └── profile_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── profile_entity.dart
│   ├── repositories/
│   │   └── profile_repository.dart
│   └── usecases/
│       ├── get_profile.dart
│       └── update_profile.dart
└── presentation/
    ├── cubit/
    │   ├── profile_cubit.dart
    │   └── profile_state.dart
    ├── pages/
    │   └── profile_page.dart
    └── widgets/
        └── profile_widget.dart
```

## 💡 Example Output

```bash
$ teuton_feature create chat
```

```
🚀 Generating feature: chat
✅ Created data layer (3 files)
✅ Created domain layer (4 files)
✅ Created presentation layer (4 files)
✅ Updated dependency injection
🎉 Feature "chat" created successfully!

Next steps:
1. Add your API endpoints in chat_remote_datasource.dart
2. Implement business logic in chat use cases
3. Update chat_cubit.dart with your state logic
4. Import ChatPage in your routing
```

## 🛠️ Configuration

Create a `teuton_config.yaml` in your project root:

```yaml
features_path: lib/features
default_template: default
author: Your Name
organization: com.example
templates:
  - default
  - minimal
```

## 🧰 Why Teuton Feature CLI?

- **🎯 Consistency**: Ensures all team members follow the same architecture
- **⚡ Speed**: Generate complete features in seconds, not hours
- **🏗️ Best Practices**: Implements proven Clean Architecture patterns
- **🔧 Maintainable**: Clear separation of concerns makes code easy to modify
- **📚 Educational**: Learn Clean Architecture through generated examples

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## 📜 License

MIT © 2025 [Carlos Díaz (Teutondev)](https://github.com/teutones92)

---

**Built with ❤️ by [Teutondev](https://teutondev.com/)**
