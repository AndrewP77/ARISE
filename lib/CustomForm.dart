import 'package:flutter/material.dart';


class CustomForm extends StatefulWidget {
  const CustomForm(this.formController, {super.key});
  final TextEditingController formController;

  @override
  CustomFormState createState() {
    return CustomFormState(formController);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CustomFormState extends State<CustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  //final FormController = TextEditingController();
  CustomFormState(this.formController);
  final TextEditingController formController;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    formController.dispose();
    super.dispose();
  }
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
            controller: formController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    formController.dispose();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('OK'),
                ),
              )
            ],
          ),
        ]));
  }
}
