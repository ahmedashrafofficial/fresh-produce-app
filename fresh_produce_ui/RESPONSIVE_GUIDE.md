# Responsive Design Implementation Guide

This guide explains how to apply responsive sizing to all screens in the Fresh Produce App using the `ResponsiveUtils` class and responsive text styles.

## Overview

The app now uses the `responsive_framework` package to provide adaptive sizing across different screen sizes (mobile, tablet, desktop).

## Key Components

### 1. ResponsiveUtils Class
Located at: `lib/core/utils/responsive_utils.dart`

Provides methods for:
- `ResponsiveUtils.width(context, size)` - Responsive width
- `ResponsiveUtils.height(context, size)` - Responsive height
- `ResponsiveUtils.fontSize(context, size)` - Responsive font size
- `ResponsiveUtils.padding(context, size)` - Responsive padding
- `ResponsiveUtils.radius(context, size)` - Responsive border radius
- `ResponsiveUtils.iconSize(context, size)` - Responsive icon size

### 2. Responsive Text Styles
Located at: `lib/core/theme/app_text_styles.dart`

Available responsive methods:
- `AppTextStyles.responsiveH1(context)`
- `AppTextStyles.responsiveH2(context)`
- `AppTextStyles.responsiveH3(context)`
- `AppTextStyles.responsiveBodyLarge(context)`
- `AppTextStyles.responsiveBodyMedium(context)`
- `AppTextStyles.responsiveBodySmall(context)`
- `AppTextStyles.responsiveLabel(context)`

## Implementation Pattern

### Step 1: Add Imports
Add these imports to every screen file:

```dart
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/responsive_utils.dart';
```

### Step 2: Replace Fixed Dimensions

#### Before (Fixed):
```dart
const EdgeInsets.all(24)
const SizedBox(height: 32)
const Icon(Icons.email, size: 24)
BorderRadius.circular(16)
```

#### After (Responsive):
```dart
EdgeInsets.all(ResponsiveUtils.padding(context, 24))
SizedBox(height: ResponsiveUtils.height(context, 32))
Icon(Icons.email, size: ResponsiveUtils.iconSize(context, 24))
BorderRadius.circular(ResponsiveUtils.radius(context, 16))
```

### Step 3: Replace Text Styles

#### Before (Fixed):
```dart
Text(
  'Welcome',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

#### After (Responsive):
```dart
Text(
  'Welcome',
  style: AppTextStyles.responsiveH2(context).copyWith(
    fontWeight: FontWeight.bold,
  ),
)
```

## Screens to Update

### ✅ Completed:
1. LoginScreen
2. NeighborhoodSelectionScreen
3. HomeScreen (partial)

### 📝 Remaining Screens:

#### 1. RegisterScreen
- Update padding, heights, icon sizes
- Replace TextStyle with responsive styles
- Update button heights

#### 2. CheckoutScreen
- Update all EdgeInsets
- Replace SizedBox heights
- Update icon sizes in TextFields
- Replace font sizes with responsive styles

#### 3. RoundDetailsScreen
- Update padding and margins
- Replace icon sizes
- Update text styles
- Make card dimensions responsive

#### 4. MyOrdersScreen
- Update list item padding
- Replace icon sizes
- Update text styles
- Make card heights responsive

#### 5. OrderSuccessScreen
- Update padding
- Replace icon sizes
- Update text styles

## Common Replacements

### Padding/Margin
```dart
// Before
padding: const EdgeInsets.all(16)
padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
margin: const EdgeInsets.only(bottom: 12)

// After
padding: EdgeInsets.all(ResponsiveUtils.padding(context, 16))
padding: EdgeInsets.symmetric(
  horizontal: ResponsiveUtils.padding(context, 24),
  vertical: ResponsiveUtils.padding(context, 16),
)
margin: EdgeInsets.only(bottom: ResponsiveUtils.padding(context, 12))
```

### SizedBox
```dart
// Before
const SizedBox(height: 24)
const SizedBox(width: 16)

// After
SizedBox(height: ResponsiveUtils.height(context, 24))
SizedBox(width: ResponsiveUtils.width(context, 16))
```

### Icons
```dart
// Before
const Icon(Icons.check, size: 24)
Icon(Icons.error, size: 32, color: Colors.red)

// After
Icon(Icons.check, size: ResponsiveUtils.iconSize(context, 24))
Icon(
  Icons.error,
  size: ResponsiveUtils.iconSize(context, 32),
  color: Colors.red,
)
```

### Border Radius
```dart
// Before
BorderRadius.circular(12)
BorderRadius.only(
  topLeft: Radius.circular(24),
  topRight: Radius.circular(24),
)

// After
BorderRadius.circular(ResponsiveUtils.radius(context, 12))
BorderRadius.only(
  topLeft: Radius.circular(ResponsiveUtils.radius(context, 24)),
  topRight: Radius.circular(ResponsiveUtils.radius(context, 24)),
)
```

### Button Sizes
```dart
// Before
minimumSize: const Size(double.infinity, 56)

// After
minimumSize: Size(
  double.infinity,
  ResponsiveUtils.height(context, 56),
)
```

## Widgets to Update

### Common Widgets
Check and update these widget files:
- `lib/presentation/widgets/rounds_list_widget.dart`
- `lib/presentation/widgets/common/` (all widgets)

## Testing

After updating each screen:
1. Test on mobile breakpoint (< 450px)
2. Test on tablet breakpoint (451-800px)
3. Test on desktop breakpoint (> 800px)
4. Verify text is readable at all sizes
5. Verify spacing looks proportional

## Notes

- Remove `const` keyword when using ResponsiveUtils (values are computed at runtime)
- Always pass `context` to responsive methods
- Use `.copyWith()` to add additional style properties to responsive text styles
- Keep the original static text styles for theme definitions

## Example: Complete Screen Update

See `login_screen.dart` and `neighborhood_selection_screen.dart` for complete examples of responsive implementation.
