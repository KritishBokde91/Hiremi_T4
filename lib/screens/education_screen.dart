import 'package:flutter/material.dart';
import 'package:hiremi_t4/widget/custom_text_field1.dart';
import 'package:hiremi_t4/widget/custom_text_field_2.dart';

class EducationScreen extends StatefulWidget {
  final Function(int) index;
  const EducationScreen({super.key, required this.index});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController collegeName = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController collegeState = TextEditingController();
  TextEditingController collegeCity = TextEditingController();
  TextEditingController passOutYear = TextEditingController();
  TextEditingController percentage = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField2(
              labelText: 'College name*',
              hintText: 'j.r.r college',
              text: (p0) => setState(() {
                collegeName.text = p0;
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
              labelText: 'Degree*',
              hintText: 'B Tech',
              text: (p0) => setState(() {
                degree.text = p0;
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
              labelText: 'Branch*',
              hintText: 'computer science',
              text: (p0) => setState(() {
                branch.text = p0;
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextField1(
                    labelText: 'College state',
                    hintText: 'West Bengal',
                    text: (p0) => setState(() {
                      collegeState.text = p0;
                    }),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomTextField1(
                    labelText: 'College city',
                    hintText: 'Kolkata',
                    text: (p0) => setState(() {
                      collegeCity.text = p0;
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
              labelText: 'Passing Out Year*',
              hintText: '2023',
              keyboardType: TextInputType.number,
              text: (p0) => setState(() {
                passOutYear.text = p0;
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
              labelText: 'Percentage/CGPA',
              hintText: '84.99%',
              keyboardType: TextInputType.number,
              text: (p0) => setState(() {
                percentage.text = p0;
              }),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  'Required fields are incomplete.\nFill them out to move forward.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  if (collegeName.text.isEmpty ||
                      degree.text.isEmpty ||
                      branch.text.isEmpty ||
                      collegeState.text.isEmpty ||
                      collegeCity.text.isEmpty ||
                      passOutYear.text.isEmpty ||
                      percentage.text.isEmpty) {
                    setState(() {
                      isVisible = true;
                    });
                    widget.index(2);
                  } else {
                    widget.index(3);
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
