# 🌀 Smart Material Spinner

A **smart, flexible, and fully customizable Material Spinner** for Flutter.  
Supports both **normal dropdown** and **searchable spinner** with clean architecture and widget-level styling.

> Built for developers who want **control, reusability, and future library scalability**.

---

## ✨ Features

✅ Normal Material Dropdown (`DropdownButtonFormField`)  
✅ Searchable Spinner with BottomSheet  
✅ Generic `<T>` support  
✅ Controller-based selection handling  
✅ Separate styling for:
- Dropdown field
- Search TextField  
✅ Widget-level styling (no global theme dependency)  
✅ No third-party packages  
✅ Library-ready architecture  

---

## 📁 Project Structure

```text
lib/
├── flutter_smart_material_spinner.dart
│
├── core/
│   ├── constants/
│   │   └── app_colors.dart
│   └── utils/
│       └── size_utils.dart
│
└── widgets/
    └── smart_material_spinner/
        ├── smart_material_spinner.dart
        ├── searchable_spinner_sheet.dart
        ├── spinner_controller.dart
        ├── spinner_item.dart
        └── spinner_styles.dart
```

---

## 📸 Preview
![Screenrecorder-2025-12-26-15-42-42-737](https://github.com/user-attachments/assets/ce796c3f-3146-48c2-ac2b-e208a187d690)
![Screenrecorder-2025-12-26-15-43-04-204](https://github.com/user-attachments/assets/45f328be-556c-4572-b48f-8f04c458995c)



---

## 📦 Installation
### Add dependency in `pubspec.yaml`:
```yaml
dependencies:
  smart_material_spinner:
    path:
      url: '.../flutter_smart_material_spinner/smart_material_spinner' ## your path
```

### Using GitHub (recommended during development):
```yaml
dependencies:
  smart_material_spinner:
    git:
      url: https://github.com/YOUR_USERNAME/flutter_smart_material_spinner.git
```

---

## 🚀 Quick Usage
### 1️⃣ Import
```dart
import 'package:smart_material_spinner/smart_material_spinner.dart';
```

### 2️⃣ Create Controller
```dart
final spinnerController = SmartSpinnerController<String>();
```

### 3️⃣ Use Spinner
```dart
SmartMaterialSpinner<String>(
  controller: spinnerController,
  searchable: true,
  hint: 'Search Country',

  fieldStyle: SpinnerFieldStyle(
    fillColor: Colors.grey.shade100,
    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    hintStyle: TextStyle(color: Colors.grey),
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(color: Colors.deepPurple),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  ),

  searchFieldStyle: SpinnerSearchFieldStyle(
    fillColor: Colors.blue.shade50,
    textStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.grey),
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(color: Colors.blue),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  ),

  items: const [
    SpinnerItem(value: 'IN', label: 'India'),
    SpinnerItem(value: 'US', label: 'USA'),
    SpinnerItem(value: 'UK', label: 'United Kingdom'),
  ],

  onChanged: (value) {
    debugPrint('Selected: $value');
  },
);
```

### 🔄 Normal Dropdown Mode
```dart
SmartMaterialSpinner<String>(
  controller: spinnerController,
  searchable: false, // 🔥 Normal Dropdown
  hint: 'Select Country',
  items: [
    SpinnerItem(value: 'IN', label: 'India'),
    SpinnerItem(value: 'US', label: 'USA'),
  ],
);
```

---

## 🧩 Core Concepts
### 🔹 SmartSpinnerController
Manages selected value and notifies UI updates.
```dart
final controller = SmartSpinnerController<String>();
controller.setValue('IN');
controller.clear();
```

### 🔹 SpinnerItem
Simple value–label model.
```dart
SpinnerItem(
  value: 'IN',
  label: 'India',
);
```

### 🔹 SpinnerFieldStyle
Controls **dropdown field UI**.
| Property     | Description         |
| ------------ | ------------------- |
| fillColor    | Background color    |
| textStyle    | Selected text style |
| hintStyle    | Hint text style     |
| borderRadius | Corner radius       |
| borderSide   | Border color        |
| padding      | Inner spacing       |

### 🔹 SpinnerSearchFieldStyle
Controls **search TextField UI**.
| Property     | Description             |
| ------------ | ----------------------- |
| fillColor    | Search field background |
| textStyle    | Search text style       |
| hintStyle    | Hint style              |
| borderRadius | Corner radius           |
| borderSide   | Border color            |
| padding      | Inner spacing           |

---

## 📄 License
```text
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
