import 'package:flutter/material.dart';

class ResumeScreen extends StatefulWidget {
  final Function(int) index;
  const ResumeScreen({super.key, required this.index});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  TextEditingController controller = TextEditingController();
  bool isVisible = false;

  void _visibility() {
    setState(() {
      isVisible = controller.text.isEmpty;
    });
  }

  void sendIndex() {
    if(controller.text.isEmpty) {
      widget.index(0);
    } else {
      widget.index(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Resume link',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'https://resume.link',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
                    _visibility();
                    sendIndex();
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
      ),
    );
  }
}
