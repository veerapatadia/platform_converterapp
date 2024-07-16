import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platformconverterapp/provider/stepper_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/contact_provider.dart';
import '../../../provider/image_provider.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertBox();
            },
          );
          final stepperProvider =
              Provider.of<StepperProvider>(context, listen: false);
          stepperProvider.nameController.clear();
          stepperProvider.contactController.clear();
          stepperProvider.step = 0;
          // Provider.of<imageProvider>(context, listen: false).clearImagePath();
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: Consumer<ContactProvider>(
        builder: (context, contactProvider, _) {
          return ListView.builder(
            itemCount: contactProvider.allContact.length,
            itemBuilder: (context, index) {
              final contact = contactProvider.allContact[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('detailPage', arguments: contact);
                  },
                  subtitle: Row(
                    children: [
                      Consumer<imageProvider>(
                        builder: (context, imageProvider, _) {
                          return CircleAvatar(
                            radius: 30,
                            backgroundImage: contact.imagePath != null
                                ? FileImage(File(contact.imagePath!))
                                : null,
                            child: contact.imagePath == null
                                ? Text(
                                    contact.name[0].toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 20),
                        child: Text(
                          contact.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(
                              onTap: () {},
                              child: const Text("Hide"),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                Future.microtask(() {
                                  Provider.of<ContactProvider>(context,
                                          listen: false)
                                      .deleteContacts(contact);
                                });
                              },
                              child: const Text("Delete"),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  const AlertBox({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Contact"),
      content: SizedBox(
        height: 500,
        width: 300,
        child: Consumer<StepperProvider>(
          builder: (context, stepProvider, _) {
            return Stepper(
              currentStep: stepProvider.step,
              onStepContinue: () {
                if (stepProvider.step < 2) {
                  stepProvider.forwardStep(context);
                } else {
                  stepProvider.saveContact(context);
                }
              },
              onStepCancel: () {
                if (stepProvider.step > 0) {
                  stepProvider.backwardStep();
                } else {
                  Navigator.of(context).pop();
                }
              },
              steps: [
                Step(
                  title: const Text("Profile Photo"),
                  content: Consumer<imageProvider>(
                    builder: (context, imageProvider, _) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: stepProvider.imagePath != null
                                ? FileImage(File(stepProvider.imagePath!))
                                : null,
                            child: stepProvider.imagePath == null
                                ? IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Pick Image"),
                                              content: const Text(
                                                  "Choose Image From Gallery or Camera"),
                                              actions: [
                                                FloatingActionButton(
                                                  mini: true,
                                                  onPressed: () async {
                                                    await imageProvider
                                                        .pickPhoto();
                                                    if (imageProvider
                                                            .pickImagePath !=
                                                        null) {
                                                      stepProvider.setImagePath(
                                                          imageProvider
                                                              .pickImagePath!);
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  },
                                                  elevation: 3,
                                                  child: const Icon(
                                                      Icons.camera_alt),
                                                ),
                                                FloatingActionButton(
                                                  mini: true,
                                                  onPressed: () async {
                                                    await imageProvider
                                                        .pickImage();
                                                    if (imageProvider
                                                            .pickImagePath !=
                                                        null) {
                                                      stepProvider.setImagePath(
                                                          imageProvider
                                                              .pickImagePath!);
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  },
                                                  elevation: 3,
                                                  child:
                                                      const Icon(Icons.image),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.camera_alt),
                                  )
                                : null,
                          ),
                          const SizedBox(height: 20),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     if (stepProvider.imagePath != null) {
                          //       stepProvider.forwardStep(context);
                          //     } else {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         const SnackBar(
                          //             content: Text(
                          //                 "Please select a profile photo")),
                          //       );
                          //     }
                          //   },
                          //   child: const Text("Continue"),
                          // ),
                        ],
                      );
                    },
                  ),
                ),
                Step(
                  title: const Text("Name"),
                  content: TextField(
                    controller: stepProvider.nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Step(
                  title: const Text("Contact"),
                  content: TextField(
                    controller: stepProvider.contactController,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
              controlsBuilder: (context, details) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text(stepProvider.step == 2 ? "Add" : "Next"),
                      ),
                      OutlinedButton(
                        onPressed: details.onStepCancel,
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
