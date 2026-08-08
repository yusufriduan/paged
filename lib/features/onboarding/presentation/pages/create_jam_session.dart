import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_text_field.dart';
import 'package:paged/features/components/custom_buton.dart';

class CreateJam extends StatefulWidget {
  const CreateJam({super.key});

  @override
  State<CreateJam> createState() => _CreateJamState();
}

class _CreateJamState extends State<CreateJam> {
  final TextEditingController _jamNameController = TextEditingController();
  final TextEditingController _jamLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Let's set one up for you!",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "What's your Jam name?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 50),
                            CustomTextField(
                              controller: _jamNameController,
                              hintText: 'Jam Name',
                            ),
                            const SizedBox(height: 100),
                            CustomTextField(
                              enabled: false,
                              controller: _jamLinkController,
                              hintText: 'Generated Jam Link',
                              variant: TextFieldVariant.withButton,
                              actionIcon: const Icon(Icons.copy, size: 20),
                              onActionPressed: () {
                                // copy link
                                debugPrint('Copy button pressed with link: ${_jamLinkController.text}');
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Psst! Share this link with your friends to join the session!",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              text: 'Finish',
                              onPressed: () {
                                // Handle finish action
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () {
                    // logout
                  },
                  child: const Text('Logout'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}