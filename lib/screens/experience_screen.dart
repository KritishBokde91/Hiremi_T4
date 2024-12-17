import 'package:flutter/material.dart';
import 'package:hiremi_t4/widget/custom_text_field_2.dart';

import '../widget/custom_options.dart';

class ExperienceScreen extends StatefulWidget {
  final Function(int) index;
  const ExperienceScreen({super.key, required this.index});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  TextEditingController organizationName = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  List<String> currentCompany = [];
  List<String> employmentType = [];
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: CustomTextField2(
                  labelText: 'Organization name*',
                  hintText: 'XYZ',
                  text: (p0) {
                    setState(() {
                      organizationName.text = p0;
                    });
                  },
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CustomTextField2(
                  labelText: 'Job title*',
                  hintText: 'PM',
                  text: (p0) {
                    setState(() {
                      jobTitle.text = p0;
                    });
                  },
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
              labelText: 'Joining Date',
              hintText: '00/00/0000',
              keyboardType: TextInputType.datetime,
              text: (p0) {
                joiningDate.text = p0;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Is this your current company?*',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomOptions(label: 'Yes', option: (p0) => setState(() {
                  currentCompany.add(p0);
                })),
                const SizedBox(width: 10),
                CustomOptions(label: 'No', option: (p0) => setState(() {
                  currentCompany.add(p0);
                })),
              ],
            ),
            const SizedBox(height: 20,),
            CustomTextField2(
              labelText: 'End Date',
              hintText: '11/11/1111',
              keyboardType: TextInputType.datetime,
              text: (p0) {
                endDate.text = p0;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Employment type*',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomOptions(label: 'Full time', option: (p0) => setState(() {
                    employmentType.add(p0);
                  })),
                  const SizedBox(width: 10),
                  CustomOptions(label: 'Part time', option: (p0) => setState(() {
                    employmentType.add(p0);
                  })),
                  const SizedBox(width: 10),
                  CustomOptions(label: 'Internship', option: (p0) => setState(() {
                    employmentType.add(p0);
                  })),
                  const SizedBox(width: 10),
                  CustomOptions(label: 'Freelance', option: (p0) => setState(() {
                    employmentType.add(p0);
                  })),
                ],
              ),
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
                  if (organizationName.text.isEmpty ||
                      jobTitle.text.isEmpty ||
                      joiningDate.text.isEmpty ||
                      currentCompany.isEmpty ||
                      endDate.text.isEmpty ||
                      employmentType.isEmpty) {
                    setState(() {
                      isVisible = true;
                    });
                    widget.index(3);
                  } else {
                    setState(() {
                      isVisible = false;
                    });
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
