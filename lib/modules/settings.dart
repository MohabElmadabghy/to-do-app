import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isChecked = false;
  double age=20;
  bool isSwitched = false;
  bool isCheckAgree= false;
  String? selectedGender;
  String male='Male';
  String female='Female';
  String label1='Single';
  String label2='Married';
  String label3='Divorced';
  var dropdpwnController=TextEditingController();
  var notesController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.shutterstock.com/image-vector/cartoon-cute-baby-elephant-sitting-600nw-2500095921.jpg',
                    ),
                    radius: 50,
                  ),
                  SizedBox(height: 25),
                  Text(
                    'ELEPHANT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 35),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gender:',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      Radio<String>(
                        value: male,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 15),
                      Radio<String>(
                        value: female,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  DropdownMenu(
                    label: Text('select your status'),
                    width: 400,
                    controller: dropdpwnController,
                    dropdownMenuEntries:
                    [
                      DropdownMenuEntry(value: 1, label: label1),
                      DropdownMenuEntry(value: 2, label: label2),
                      DropdownMenuEntry(value: 3, label: label3),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        'Age : ${age.toInt()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54,

                        ),
                      ),
                      Expanded(
                        child: Slider(
                          value: age,
                          onChanged: (value)
                          {
                            setState(() {
                              age=value;
                              print(age.toInt());
                            });
                          },
                          min: 10,
                          max: 80,
                          activeColor: Colors.redAccent[100],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'receive notifications :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        activeColor: Colors.redAccent[100],
                        value:isSwitched ,
                        onChanged: (value)
                        {
                          setState(() {
                            isSwitched=!isSwitched;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I Agree to the Terms and coditions :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54,
                        ),
                      ),
                      Spacer(),
                      Checkbox(
                        value:isCheckAgree ,
                        activeColor: Colors.redAccent[100],
                        onChanged:(value)
                        {
                          setState(() {
                            isCheckAgree=!isCheckAgree;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 4,
                    controller: notesController,
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: ()
                    {
                      print('Email : ${emailController.toString()}');
                      print('Password : ${passwordController.toString()}');
                      print('Gender : ${selectedGender}');
                      print('Status : ${dropdpwnController}');
                      print('Age : ${age.toInt()}');
                      print('Notifications : ${isSwitched}');
                      print('Agree : ${isCheckAgree}');
                      print('Notes : ${notesController}');

                    },
                    color: Colors.redAccent[100],
                    child: TextButton(
                      onPressed: () {
                        print('Email : ${emailController.toString()}');
                        print('Password : ${passwordController.toString()}');
                        print('Gender : ${selectedGender}');
                        print('Status : ${dropdpwnController}');
                        print('Age : ${age.toInt()}');
                        print('Notifications : ${isSwitched}');
                        print('Agree : ${isCheckAgree}');
                        print('Notes : ${notesController}');

                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
