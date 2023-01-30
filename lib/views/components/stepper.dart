// ignore_for_file: camel_case_types
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_c/views/components/global.dart';
import 'global.dart';

class stepper extends StatefulWidget {
  const stepper({Key? key}) : super(key: key);

  @override
  State<stepper> createState() => _stepperState();
}

class _stepperState extends State<stepper> {
  int initialStep = 0;

  ImagePicker image = ImagePicker();
  File? file;

  String? name;
  String? descrpition;
  String? number;

  camera() async {
    final cam = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(cam!.path);
    });
  }

  gallery() async {
    final gal = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(gal!.path);
    });
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  GlobalKey<FormState> key2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: initialStep,
      onStepContinue: () {
        setState(() {
          if (initialStep < 3) {
            ++initialStep;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (initialStep > 0) {
            --initialStep;
          }
        });
      },
      onStepTapped: (val) {
        setState(() {
          initialStep = val;
        });
      },
      controlsBuilder: (context, controlDetails) {
        controlDetails.stepIndex;
        return Row(
          children: [
            (controlDetails.stepIndex == 0)
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: controlDetails.onStepContinue,
                          child: Text("CONTINUE"),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        OutlinedButton(
                          onPressed: controlDetails.onStepCancel,
                          child: Text("CANCEL"),
                        ),
                      ],
                    ),
                  )
                : (controlDetails.stepIndex == 1)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  key.currentState!.save();
                                  setState(() {
                                    // controlDetails.onStepContinue;
                                    if (initialStep < 2) {
                                      ++initialStep;
                                    }
                                  });
                                }
                              },
                              child: Text("CONTINUE"),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            OutlinedButton(
                              onPressed: controlDetails.onStepCancel,
                              child: Text("CANCEL"),
                            ),
                          ],
                        ),
                      )
                    : (controlDetails.stepIndex == 2)
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (key1.currentState!.validate()) {
                                      key1.currentState!.save();
                                      setState(() {
                                        // controlDetails.onStepContinue;
                                        if (initialStep < 3) {
                                          ++initialStep;
                                        }
                                      });
                                    }
                                  },
                                  // controlDetails.onStepContinue,
                                  child: Text("CONTINUE"),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                OutlinedButton(
                                  onPressed: controlDetails.onStepCancel,
                                  child: Text("CANCEL"),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (key2.currentState!.validate()) {
                                        key2.currentState!.save();
                                        setState(() {
                                          // controlDetails.onStepContinue;
                                          if (initialStep < 4) {
                                            Map<String, dynamic> lol = {
                                              'image': file,
                                              'name': name,
                                              'desc': descrpition,
                                              'num': number,
                                              'time': 'Now',
                                            };

                                            details.addAll([lol]);

                                            Navigator.of(context).pop();
                                          }
                                        });
                                      }
                                    });
                                  },
                                  child: Text("ADD"),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                OutlinedButton(
                                  onPressed: controlDetails.onStepCancel,
                                  child: Text("CANCEL"),
                                ),
                              ],
                            ),
                          ),
          ],
        );
      },
      steps: [
        Step(
          isActive: (initialStep >= 0) ? true : false,
          state: StepState.indexed,
          title: Text("PROFILE PHOTO"),
          subtitle: Text("Add profile photo"),
          content: Stack(
            alignment: Alignment.bottomRight,
            children: [
              (file != null)
                  ? CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: (file != null) ? FileImage(file!) : null,
                    )
                  : CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.grey[300],
                    ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    camera();
                  });
                },
                mini: true,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
        Step(
          isActive: (initialStep >= 1) ? true : false,
          title: Text("NAME"),
          subtitle: Text("Enter name"),
          content: Form(
            key: key,
            child: TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter name...";
                }
              },
              onSaved: (val) {
                setState(() {
                  name = val;
                });
              },
              decoration: InputDecoration(
                hintText: "kishan gaudani",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Step(
          isActive: (initialStep >= 2) ? true : false,
          title: Text("DISCRIPATION"),
          subtitle: Text("Enter discripation"),
          content: Form(
            key: key1,
            child: TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter desc...";
                }
              },
              onSaved: (val) {
                setState(() {
                  descrpition = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Welcome to apk",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Step(
          isActive: (initialStep >= 3) ? true : false,
          title: Text("NUMBER"),
          subtitle: Text("Enter Number"),
          content: Form(
            key: key2,
            child: TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter num...";
                }
              },
              keyboardType: TextInputType.number,
              onSaved: (val) {
                setState(() {
                  number = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
