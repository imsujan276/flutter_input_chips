# flutter_input_chips

FlutterInputChips is a Flutter widget that builds the input field with input chips options

[![Pub Version](https://img.shields.io/pub/v/flutter_input_chips?style=for-the-badge)](https://pub.dev/packages/flutter_input_chips)
[![GitHub](https://img.shields.io/github/license/imsujan276/flutter_input_chips?style=for-the-badge)](https://github.com/imsujan276/flutter_input_chips/blob/main/LICENSE)

## Demo
![Demo](https://github.com/imsujan276/flutter_input_chips/blob/main/demo.gif)

## Import

```dart
import 'package:flutter_input_chips/flutter_input_chips.dart';
```

## Example

```dart
import 'package:flutter_input_chips/flutter_input_chips.dart';


FlutterInputChips(
    initialValue: const [],
    maxChips: 5,
    onChanged: (v) {
        setState(() {
            values = v;
        });
    },
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        ),
    inputDecoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Enter text here",
    ),
    chipTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
    ),
    chipSpacing: 8,
    chipDeleteIconColor: Colors.white,
    chipBackgroundColor: Colors.blueGrey,
),
```

## Available properties
```dart
  /// list of Strings to prepopulate the chips with
  final List<String> initialValue;

  /// returns a list of string on inout field submitted
  final ValueChanged<List<String>> onChanged;

  /// number of maximum chips
  final int? maxChips;

  /// enables the input field and chip delete ability
  final bool enabled;

  /// inout field action
  final TextInputAction inputAction;

  /// keyboard appearance
  final Brightness keyboardAppearance;

  /// autofocus the inout field
  final bool autofocus;

  /// text capitalization type for the input field keyboard
  final TextCapitalization textCapitalization;

  /// text input decoration
  final InputDecoration inputDecoration;

  /// text overflow behaviour
  final TextOverflow textOverflow;

  /// keyboard input type
  final TextInputType inputType;

  /// parent container padding
  final EdgeInsets padding;
  
  /// padding container decoration
  final BoxDecoration? decoration;

  /// spacing between chips
  final double chipSpacing;
  // style for chip text/label
  final TextStyle? chipTextStyle;

  /// backhround color of the chip
  final Color? chipBackgroundColor;

  /// custom delete icon
  final Widget? chipDeleteIcon;

  /// if true, displays a delete icon in the chip
  final bool chipCanDelete;

  /// Color for delete icon in the chip
  final Color? chipDeleteIconColor;
```

## Support
If you lik this package. Feel free to create pull request or report issues.
