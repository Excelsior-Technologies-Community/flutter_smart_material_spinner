import 'package:flutter/material.dart';
import 'package:flutter_smart_material_spinner/widgets/smart_material_spinner/spinner_styles.dart';
import '../widgets/smart_material_spinner/smart_material_spinner.dart';
import '../widgets/smart_material_spinner/spinner_controller.dart';
import '../widgets/smart_material_spinner/spinner_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final countryController = SmartSpinnerController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Material Spinner')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SmartMaterialSpinner<String>(
          controller: countryController,
          searchable: true,
          hint: 'Search Country',
          fieldStyle: SpinnerFieldStyle(
            fillColor: Colors.white,
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            hintStyle: TextStyle(color: Colors.red),
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black,),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          ),
          searchFieldStyle: SpinnerSearchFieldStyle(
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
            textStyle: TextStyle()
          ),
          items: [
            SpinnerItem(value: 'IN', label: 'India'),
            SpinnerItem(value: 'US', label: 'USA'),
          ],
        )

      ),
    );
  }
}
