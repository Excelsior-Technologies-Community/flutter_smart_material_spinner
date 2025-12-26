import 'package:flutter/material.dart';
import '../../core/utils/size_utils.dart';
import 'spinner_controller.dart';
import 'spinner_item.dart';
import 'searchable_spinner_sheet.dart';
import 'spinner_styles.dart';

class SmartMaterialSpinner<T> extends StatelessWidget {
  final List<SpinnerItem<T>> items;
  final SmartSpinnerController<T> controller;
  final String hint;
  final bool enabled;
  final bool searchable;
  final ValueChanged<T?>? onChanged;

  final SpinnerFieldStyle? fieldStyle;
  final SpinnerSearchFieldStyle? searchFieldStyle;

  const SmartMaterialSpinner({
    super.key,
    required this.items,
    required this.controller,
    this.hint = 'Select item',
    this.enabled = true,
    this.searchable = false,
    this.onChanged,
    this.fieldStyle,
    this.searchFieldStyle,
  });

  void _openSearchSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SearchableSpinnerSheet<T>(
          items: items,
          searchFieldStyle: searchFieldStyle, // ✅ FIX
          onSelect: (item) {
            controller.setValue(item.value);
            onChanged?.call(item.value);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        /// NORMAL DROPDOWN
        if (!searchable) {
          return DropdownButtonFormField<T>(
            value: controller.selected,
            items: items
                .map(
                  (item) => DropdownMenuItem<T>(
                value: item.value,
                child: Text(
                  item.label,
                  style: fieldStyle?.textStyle,
                ),
              ),
            )
                .toList(),
            onChanged: enabled
                ? (value) {
              controller.setValue(value);
              onChanged?.call(value);
            }
                : null,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: fieldStyle?.fillColor,
              hintStyle: fieldStyle?.hintStyle,
              contentPadding: fieldStyle?.padding,
              border: OutlineInputBorder(
                borderRadius:
                fieldStyle?.borderRadius ?? BorderRadius.circular(12),
                borderSide:
                fieldStyle?.borderSide ?? const BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                fieldStyle?.borderRadius ?? BorderRadius.circular(12),
                borderSide:
                fieldStyle?.borderSide ?? const BorderSide(),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                fieldStyle?.borderRadius ?? BorderRadius.circular(12),
                borderSide:
                fieldStyle?.borderSide ?? const BorderSide(),
              ),
            ),
          );
        }

        /// SEARCHABLE FIELD (DISPLAY)
        String displayText = hint;
        if (controller.selected != null) {
          final match =
          items.where((e) => e.value == controller.selected);
          if (match.isNotEmpty) {
            displayText = match.first.label;
          }
        }

        return InkWell(
          onTap: enabled ? () => _openSearchSheet(context) : null,
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: searchFieldStyle?.fillColor,
              hintStyle: searchFieldStyle?.hintStyle,
              contentPadding: searchFieldStyle?.padding,
              border: OutlineInputBorder(
                borderRadius:
                searchFieldStyle?.borderRadius ?? BorderRadius.circular(12),
                borderSide:
                searchFieldStyle?.borderSide ?? const BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                searchFieldStyle?.borderRadius ?? BorderRadius.circular(12),
                borderSide:
                searchFieldStyle?.borderSide ?? const BorderSide(),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                searchFieldStyle?.borderRadius ?? BorderRadius.circular(12),
                borderSide:
                searchFieldStyle?.borderSide ?? const BorderSide(),
              ),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  displayText,
                  style: searchFieldStyle?.textStyle,
                ),
                 Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        );
      },
    );
  }
}
