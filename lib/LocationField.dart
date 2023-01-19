import 'package:flutter/material.dart';


class LocationField extends StatefulWidget {
  const LocationField({super.key});

  @override
  LocationFieldState createState() {
    return LocationFieldState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LocationFieldState extends State<LocationField> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Location',
              contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ])
    );
  }
}
