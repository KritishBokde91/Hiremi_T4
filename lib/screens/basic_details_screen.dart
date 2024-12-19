import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiremi_t4/controller_screen/controller_screen.dart';
import 'package:hiremi_t4/widget/custom_bottom_bar.dart';

import '../widget/customtextfield.dart';

class BasicDetailsScreen extends StatefulWidget {
  const BasicDetailsScreen({super.key});

  @override
  State<BasicDetailsScreen> createState() => _BasicDetailsScreenState();
}

class _BasicDetailsScreenState extends State<BasicDetailsScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController fathersNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? selectedGender;
  String? selectedState;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Chandigarh',
    'Delhi',
    'Lakshadweep',
    'Puducherry'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basic Detail',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        leading: Container(
            decoration: BoxDecoration(
              color: Color(0xFFECF5FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Image.asset('assets/images/appBarMenu.png'))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color(0xFFDBE4FF)),
                    child: Center(
                        child: Text(
                      '3',
                      style: TextStyle(
                          fontSize: size.width * 0.023,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3CC9)),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hint: 'John Doe',
                label: 'Full Name*',
                controller: fullNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                hint: 'John Doe Sr.',
                label: 'Father\'s Full Name*',
                controller: fathersNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your father\'s name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                hint: 'example@email.com',
                label: 'Email*',
                controller: emailController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@gmail.com')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const Text(
                'Gender*',
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildGenderOption('Male'),
                  const SizedBox(width: 10),
                  _buildGenderOption('Female'),
                  const SizedBox(width: 10),
                  _buildGenderOption('Other'),
                ],
              ),
              if (selectedGender == null)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Please select a gender',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                'Date of birth*',
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: dobController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _DateInputFormatter(),
                ],
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Date of Birth*',
                  hintText: 'DD/MM/YYYY',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Please enter your valid date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Birth State*',
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10,),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                value: selectedState,
                onChanged: (String? value) {
                  setState(() {
                    selectedState = value!;
                  });
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                  floatingLabelStyle:
                  TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold),
                  labelText: 'Birth State*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: states.map((String state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        selectedGender != null) {
                      if (emailController.text.contains('@gmail.com')) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ControllerScreen(basicDetails: {
                              'fullName': fullNameController.text,
                              'fatherName': fathersNameController.text,
                              'email': emailController.text,
                              'gender': selectedGender!,
                              'dateOfBirth': dobController.text,
                              'state': selectedState!
                            },),
                          ),
                        );
                      }
                    } else {
                      setState(() {});
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
      bottomNavigationBar: CustomBottomBar(currentIndex: currentIndex, onTabSelected: (value) {
        setState(() {
          currentIndex = value;
        });
      },),
    );
  }

  Widget _buildGenderOption(String label) {
    final bool isSelected = selectedGender == label;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = label;
          });
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF0F3CC9)
                  : const Color(0xFFB6B6B6),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected ? Icons.circle : Icons.circle_outlined,
                color: isSelected ? const Color(0xFF0F3CC9) : Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen')),
      body: const Center(child: Text('Welcome to the next screen!')),
    );
  }
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length > 10) return oldValue;

    String formatted = '';
    int selectionIndex = newValue.selection.end;

    int count = 0;
    for (int i = 0; i < text.length; i++) {
      formatted += text[i];
      count++;
      if ((count == 2 || count == 4) && count != text.length) {
        formatted += '/';
        if (i < newValue.selection.end) selectionIndex++;
      }
    }
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
