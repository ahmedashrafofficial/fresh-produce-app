---
trigger: always_on
---

# Fresh Produce App - Coding Rules

Strict **Clean Architecture**, **OOP**, and **SOLID** principles. No exceptions.

---

## 🏗️ Layer Dependencies

```
PRESENTATION → DOMAIN, CORE
DOMAIN       → CORE only (NO Data/Presentation imports!)
DATA         → DOMAIN, CORE
CORE         → No dependencies
```

---

## 📁 Structure

```
lib/
├── core/
│   ├── constants/     # app_colors, app_strings, app_dimensions, api_constants
│   ├── theme/         # app_theme, app_text_styles
│   ├── utils/         # validators, formatters, extensions
│   ├── errors/        # exceptions, failures
│   └── network/       # api_client, network_info
├── domain/
│   ├── entities/      # Pure Dart classes, NO fromJson/toJson
│   ├── repositories/  # Abstract interfaces only
│   └── usecases/      # Single-purpose use cases
├── data/
│   ├── models/        # Extends entity, HAS fromJson/toJson
│   ├── repositories/  # Implements domain interfaces
│   └── data_sources/  # remote/, local/
├── presentation/
│   ├── screens/
│   ├── widgets/       # common/, [feature]/
│   ├── providers/
│   └── controllers/
└── main.dart
```

---

## 📏 SOLID

| Principle | Rule |
|-----------|------|
| **S**ingle Responsibility | ONE class per file, filename = class name |
| **O**pen/Closed | Abstract classes for extensibility |
| **L**iskov Substitution | Implementations fully honor interfaces |
| **I**nterface Segregation | Small, specific interfaces |
| **D**ependency Inversion | Depend on abstractions, not concretions |

---

## 📝 Naming

| Type | File | Class |
|------|------|-------|
| Screen | `home_screen.dart` | `HomeScreen` |
| Widget | `product_card_widget.dart` | `ProductCardWidget` |
| Model | `product_model.dart` | `ProductModel` |
| Entity | `product.dart` | `Product` |
| Repo Interface | `product_repository.dart` | `ProductRepository` |
| Repo Impl | `product_repository_impl.dart` | `ProductRepositoryImpl` |
| Provider | `cart_provider.dart` | `CartProvider` |

**Variables**: `camelCase`, private `_camelCase`, booleans: `isX`, `hasX`, `canX`

---

## 🎨 Constants Templates

```dart
// app_colors.dart
abstract class AppColors {
  AppColors._();
  static const Color primary = Color(0xFF4CAF50);
}

// app_strings.dart
abstract class AppStrings {
  AppStrings._();
  static const String networkError = 'No internet connection';
}

// app_dimensions.dart
abstract class AppDimensions {
  AppDimensions._();
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double radiusM = 8.0;
}

// api_constants.dart
abstract class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://api.example.com';
  static const String products = '/products';
}
```

---

## �️ Entity vs Model

```dart
// ENTITY (domain/) - NO serialization
class Product {
  final String id;
  final String name;
  const Product({required this.id, required this.name});
}

// MODEL (data/) - WITH serialization
class ProductModel extends Product {
  const ProductModel({required super.id, required super.name});
  
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
    ProductModel(id: json['id'], name: json['name']);
  
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
```

---

## 🔌 Repository Pattern

```dart
// INTERFACE (domain/repositories/)
abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}

// IMPLEMENTATION (data/repositories/)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remote;
  ProductRepositoryImpl(this._remote);
  
  @override
  Future<Either<Failure, List<Product>>> getProducts() async { ... }
}
```

---

## ⚠️ Error Handling

```dart
// exceptions.dart
class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

// failures.dart
abstract class Failure { final String message; const Failure(this.message); }
class ServerFailure extends Failure { const ServerFailure(super.message); }
class NetworkFailure extends Failure { const NetworkFailure(super.message); }

// Usage with Either<Failure, T>
result.fold(
  (failure) => showError(failure.message),
  (data) => display(data),
);
```

---

## 📋 Import Order

```dart
import 'dart:async';                    // 1. Dart SDK
import 'package:flutter/material.dart'; // 2. Flutter SDK
import 'package:dartz/dartz.dart';      // 3. External packages
import 'package:app/core/...';          // 4. Project: core→domain→data→presentation
```

---

## 🚫 Forbidden

- ❌ Magic strings/numbers → Use constants
- ❌ Business logic in widgets → Use providers
- ❌ Direct API calls in presentation → Use repository
- ❌ Concrete dependencies → Use interfaces
- ❌ Multiple classes per file → One class only
- ❌ Higher layer imports → Respect boundaries
- ❌ Mutable entities → Use immutable

---

## 📚 Quick Reference

| What | Where |
|------|-------|
| Colors | `core/constants/app_colors.dart` |
| Strings | `core/constants/app_strings.dart` |
| Dimensions | `core/constants/app_dimensions.dart` |
| API endpoints | `core/constants/api_constants.dart` |
| Formatters | `core/utils/formatters.dart` |
| Validators | `core/utils/validators.dart` |
| Repo interface | `domain/repositories/` |
| Repo impl | `data/repositories/` |
| Entities | `domain/entities/` |
| Models | `data/models/` |
