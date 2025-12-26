import 'package:flutter/material.dart';
import 'spinner_item.dart';
import 'spinner_styles.dart';

class SearchableSpinnerSheet<T> extends StatefulWidget {
  final List<SpinnerItem<T>> items;
  final String searchHint;
  final ValueChanged<SpinnerItem<T>> onSelect;
  final SpinnerSearchFieldStyle? searchFieldStyle;

  const SearchableSpinnerSheet({
    super.key,
    required this.items,
    required this.onSelect,
    this.searchHint = 'Search...',
    this.searchFieldStyle,
  });

  @override
  State<SearchableSpinnerSheet<T>> createState() =>
      _SearchableSpinnerSheetState<T>();
}

class _SearchableSpinnerSheetState<T>
    extends State<SearchableSpinnerSheet<T>> {
  final TextEditingController _searchController = TextEditingController();
  late List<SpinnerItem<T>> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = widget.items;
  }

  void _onSearch(String query) {
    setState(() {
      filteredList = widget.items
          .where(
            (e) =>
            e.label.toLowerCase().contains(query.toLowerCase()),
      )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.searchFieldStyle;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearch,
              style: style?.textStyle, // ✅ TEXT STYLE FIX
              decoration: InputDecoration(
                hintText: widget.searchHint,
                hintStyle: style?.hintStyle,
                filled: true,
                fillColor: style?.fillColor, // ✅ COLOR FIX
                contentPadding: style?.padding,
                border: OutlineInputBorder(
                  borderRadius:
                  style?.borderRadius ?? BorderRadius.circular(12),
                  borderSide:
                  style?.borderSide ?? const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (_, index) {
                  final item = filteredList[index];
                  return ListTile(
                    title: Text(item.label),
                    onTap: () {
                      widget.onSelect(item);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
