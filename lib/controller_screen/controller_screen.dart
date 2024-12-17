import 'package:flutter/material.dart';
import 'package:hiremi_t4/screens/edit_profile_screen.dart';
import 'package:hiremi_t4/screens/education_screen.dart';
import 'package:hiremi_t4/screens/experience_screen.dart';
import 'package:hiremi_t4/screens/resume_screen.dart';
import 'package:hiremi_t4/widget/custom_bottom_bar.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  int currentIndex = 0;
  int currentScreen = 0;
  final appBarTitle = ['Resume', 'Edit Profile', 'Education', 'Experience'];
  void setIndex(int index) {
    setState(() {
      currentScreen = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var screens = [
      ResumeScreen(index: setIndex,),
      EditProfileScreen(index: setIndex,),
      EducationScreen(index: setIndex,),
      ExperienceScreen(index: setIndex,),
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle[currentScreen],
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
      body: screens[currentScreen],
      bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
