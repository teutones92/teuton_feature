[![Pub Version](https://img.shields.io/pub/v/teuton_feature)](https://pub.dev/packages/teuton_feature)
[![GitHub Stars](https://img.shields.io/github/stars/teutones92/teuton_feature)](https://github.com/teutones92/teuton_feature)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Dart](https://img.shields.io/badge/SDK-%3E%3D3.0.0-blue.svg)](https://dart.dev)


# 🧩 Teuton Feature CLI

A powerful CLI tool to generate **Flutter features** using **Clean Architecture**, **Cubit state management**, and **GetIt dependency injection** — in seconds.

## ✨ Features

- 🏗️ Full **Clean Architecture** scaffolding
- 🔄 **Cubit** state management integration
- 💉 **GetIt** dependency injection ready
- 📁 Consistent and organized folder structure
- ⚡ Fast feature generation with one command

## 🚀 Installation

Install globally:
```bash
dart pub global activate --source path .
```

Then run it from any Flutter project:
```bash
teuton_feature create <feature_name>
```

---

## 📖 Usage

Create a new feature:
```bash
teuton_feature create profile
```

This generates a complete module with:
- **Data layer** → repositories, data sources, models  
- **Domain layer** → entities, repositories, use cases  
- **Presentation layer** → cubits, pages, widgets  

---

## 📂 Generated Structure

```
lib/features/profile/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── cubit/
    ├── pages/
    └── widgets/
```

---

## 💡 Example

```bash
teuton_feature create chat
```

Output:
```
✅ Feature "chat" created successfully!
🟢 lib/features/chat/data/models/chat_model.dart created
🟢 lib/features/chat/domain/usecases/get_chat.dart created
🟢 lib/features/chat/presentation/cubit/chat_cubit.dart created
...
```

---

## 🧰 About

**Teuton Feature CLI** was built by [Teutondev](https://teutondev.com/)  
to speed up Flutter app development and enforce a scalable architecture.

---

## 📜 License

MIT © 2025 [Carlos Díaz (Teutondev)](https://github.com/teutones92)
