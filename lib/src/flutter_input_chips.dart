import 'package:flutter/material.dart';
import 'package:flutter_input_chips/src/controller.dart';

///
/// [FlutterInputChips] is a Flutter widget that builds the input field with input chips options
///
class FlutterInputChips extends StatefulWidget {
  /// list of Strings to prepopulated the chips with
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

  /// text overflow behavior
  final TextOverflow textOverflow;

  /// keyboard input type
  final TextInputType inputType;

  /// parent container padding
  final EdgeInsets padding;
  // padding container decoration
  final BoxDecoration? decoration;

  /// spacing between chips
  final double chipSpacing;

  /// style for chip text/label
  final TextStyle? chipTextStyle;

  /// background color of the chip
  final Color? chipBackgroundColor;

  /// custom delete icon
  final Widget? chipDeleteIcon;

  /// if true, displays a delete icon in the chip
  final bool chipCanDelete;

  /// Color for delete icon in the chip
  final Color? chipDeleteIconColor;

  /// controller for the input field
  final InputChipsController? inputChipsController;

  const FlutterInputChips({
    super.key,
    required this.onChanged,
    this.initialValue = const [],
    this.enabled = true,
    this.inputAction = TextInputAction.done,
    this.keyboardAppearance = Brightness.light,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.inputDecoration = const InputDecoration(),
    this.textOverflow = TextOverflow.clip,
    this.inputType = TextInputType.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.chipCanDelete = true,
    this.chipSpacing = 5,
    this.maxChips,
    this.decoration,
    this.chipTextStyle,
    this.chipBackgroundColor,
    this.chipDeleteIcon,
    this.chipDeleteIconColor,
    this.inputChipsController,
  }) : assert(maxChips == null || initialValue.length <= maxChips);

  @override
  State<FlutterInputChips> createState() => FlutterInputChipsState();
}

class FlutterInputChipsState extends State<FlutterInputChips> {
  /// controller for the input field
  late final InputChipsController inputChipsController;

  /// controller for the input field
  final TextEditingController textCtrl = TextEditingController();

  /// checks whether the chips has reached the maximum number of chips allowed
  bool get _hasReachedMaxChips =>
      widget.maxChips != null &&
      inputChipsController.chips.length >= widget.maxChips!;

  @override
  void initState() {
    inputChipsController =
        widget.inputChipsController ?? InputChipsController();
    inputChipsController.addAllChips(widget.initialValue);
    super.initState();
  }

  /// remove the chip from the list and calls [widget.onChanged]
  void deleteChip(String value) {
    if (widget.enabled) {
      setState(() => inputChipsController.removeChip(value));
      widget.onChanged(inputChipsController.chips);
    }
  }

  /// adds the chip to the list, clear the text field and calls [widget.onChanged]
  void addChip(String value) {
    if (value.isEmpty || _hasReachedMaxChips) return;
    setState(() {
      inputChipsController.addChip(value.trim());
    });
    textCtrl.clear();
    widget.onChanged(inputChipsController.chips);
  }

  /// sets the selected chip's value to the text field
  void onChipSelected(String value) {
    textCtrl.text = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: widget.decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
              spacing: widget.chipSpacing,
              children: inputChipsController.chips
                  .map((e) => GestureDetector(
                        onTap: () => onChipSelected(e),
                        child: Chip(
                          label: Text(e, overflow: widget.textOverflow),
                          onDeleted:
                              widget.chipCanDelete ? () => deleteChip(e) : null,
                          deleteIcon: widget.chipDeleteIcon,
                          backgroundColor: widget.chipBackgroundColor,
                          labelStyle: widget.chipTextStyle,
                          deleteIconColor: widget.chipDeleteIconColor,
                        ),
                      ))
                  .toList()),
          TextField(
            controller: textCtrl,
            onSubmitted: (value) => addChip(value),
            onChanged: (value) {
              if (value.contains(",")) addChip(value.replaceAll(",", ""));
            },
            onEditingComplete: () {}, // this prevents keyboard from closing
            decoration: widget.inputDecoration,
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            keyboardAppearance: widget.keyboardAppearance,
            textCapitalization: widget.textCapitalization,
            enabled: widget.enabled,
            autofocus: widget.autofocus,
          ),
        ],
      ),
    );
  }
}
