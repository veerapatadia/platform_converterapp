import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platformconverterapp/provider/callprovider.dart';
import 'package:platformconverterapp/provider/stepper_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/call.dart';
import '../../../model/ioschat.dart';
import '../../../provider/contact_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/platform_provider.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlatformProvider>(context).isIOS)
        ? CupertinoPageScaffold(
            child: Container(
              decoration: const BoxDecoration(
                color: CupertinoColors.black,
              ),
              child: ListView.builder(
                itemCount: chatItems.length,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) {
                  final chat = chatItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(chat.imagePath),
                          ),
                          title: Text(
                            chat.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              chat.message,
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.inactiveGray,
                              ),
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                chat.time,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CupertinoColors.inactiveGray,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Icon(
                                CupertinoIcons.chevron_forward,
                                color: CupertinoColors.inactiveGray,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : Scaffold(
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
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                contact.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
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
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border(
                                          top: BorderSide(
                                            width: 1,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: Icon(
                                              Icons.person,
                                              color: Colors.green,
                                            ),
                                            title: Text(
                                              contact.name,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.phone,
                                              color: Colors.blue,
                                            ),
                                            title: Text(
                                              'Call',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            onTap: () async {
                                              await launchUrl(Uri.parse(
                                                  "tel:${contact.contact}"));

                                              Provider.of<CallProvider>(context,
                                                      listen: false)
                                                  .addCallHistory(CallHistory(
                                                name: contact.name,
                                                contact: contact.contact,
                                                timestamp: DateTime.now(),
                                              ));
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.message,
                                                color: Colors.orange),
                                            title: Text('Message',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onTap: () async {
                                              await launchUrl(Uri.parse(
                                                  "sms:${contact.contact}"));
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.person,
                                color: Colors.green,
                              ),
                            ),
                            PopupMenuButton(
                              itemBuilder: (context) {
                                return <PopupMenuEntry>[
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
                    keyboardType: TextInputType.number,
                    controller: stepProvider.contactController,
                    decoration: const InputDecoration(
                      labelText: "Contact",
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

class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  CupertinoListTile({
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                SizedBox(height: 10),
                subtitle,
              ],
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}
