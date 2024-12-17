import 'package:flutter/material.dart';
import 'package:hiremi_t4/widget/custom_options.dart';
import 'package:hiremi_t4/widget/custom_text_field1.dart';
import 'package:hiremi_t4/widget/custom_text_field_2.dart';

class EditProfileScreen extends StatefulWidget {
  final Function(int) index;
  const EditProfileScreen({super.key, required this.index});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController currentState = TextEditingController();
  TextEditingController currentCity = TextEditingController();
  TextEditingController currentPinCode = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  List<String> differentlyAbled = [];
  List<String> careerBreak = [];
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // State and City Fields
              Row(
                children: [
                  Expanded(
                      child: CustomTextField1(
                    labelText: 'Current state',
                    hintText: 'e.g: West Bengal',
                    keyboardType: TextInputType.text,
                    text: (p0) => setState(() {
                      currentState.text = p0;
                    }),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: CustomTextField1(
                          labelText: 'Current city',
                          hintText: 'e.g: Kolkata',
                          keyboardType: TextInputType.text,
                          text: (p0) => setState(() {
                                currentCity.text = p0;
                              }))),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField2(
                labelText: 'Current pincode*',
                hintText: '609609',
                keyboardType: TextInputType.phone,
                  text: (p0) => setState(() {
                    currentPinCode.text = p0;
                  })
              ),
              const SizedBox(height: 20),
              CustomTextField2(
                labelText: 'Marital status*',
                hintText: 'status',
                keyboardType: TextInputType.text,
                  text: (p0) => setState(() {
                    maritalStatus.text = p0;
                  })
              ),
              const SizedBox(height: 20),
              Text(
                'Are you differently abled?*',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CustomOptions(label: 'Yes', option: (p0) => setState(() {
                    differentlyAbled.add(p0);
                  }),),
                  const SizedBox(width: 10),
                  CustomOptions(label: 'No', option: (p0) => setState(() {
                    differentlyAbled.add(p0);
                  }))
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Do you have career break?*',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CustomOptions(label: 'Yes', option: (p0) => setState(() {
                    careerBreak.add(p0);
                  })),
                  const SizedBox(width: 10),
                  CustomOptions(label: 'No', option: (p0) => setState(() {
                    careerBreak.add(p0);
                  })),
                ],
              ),
              Visibility(
                visible: isVisible,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      'Required fields are incomplete.\nFill them out to move forward.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if(currentState.text.isEmpty || currentCity.text.isEmpty || currentPinCode.text.isEmpty || maritalStatus.text.isEmpty || differentlyAbled.isEmpty || careerBreak.isEmpty) {
                      setState(() {
                        isVisible = true;
                      });
                      widget.index(1);
                    } else {
                      widget.index(2);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F3CC9),
                    fixedSize: Size(size.width * 0.4, size.height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
