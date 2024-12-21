import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/utils/colors.dart';
import 'package:new_project/core/utils/text_style.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  String? selectedGender;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserInfoView',
          style: getHeadLineTextStyle(
            context,
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter your name', style: getTitleTextStyle(context)),
              const Gap(10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const Gap(10),
              Text('Enter your age', style: getTitleTextStyle(context)),
              const Gap(10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your age',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const Gap(10),
              Text('Enter your height', style: getTitleTextStyle(context)),
              const Gap(10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your height',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const Gap(10),
              Text('Enter your weight', style: getTitleTextStyle(context)),
              const Gap(10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your weight',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const Gap(10),
              Text(
                'What\'s your gender?',
                style: getTitleTextStyle(context),
              ),
              const Gap(10),
              DropdownButton<String>(
                borderRadius: BorderRadius.circular(20),
                value: selectedGender,
                hint: const Text("Select Gender"),
                items: ["Male", "Female"].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue; // Update the selected value
                  });
                },
              ),
              const Gap(10),
              Text(
                'What\'s your goal?',
                style: getTitleTextStyle(context),
              ),
              const Gap(10),
              DropdownButton<String>(
                borderRadius: BorderRadius.circular(20),
                value: selectedGender,
                hint: const Text("Select your goal"),
                items: ["Muscle Gain", "Keep Fit", "Weight Loss", "Other"]
                    .map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue; // Update the selected value
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
