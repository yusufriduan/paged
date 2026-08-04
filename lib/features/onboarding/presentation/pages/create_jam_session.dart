import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_text_field.dart';
import 'package:paged/features/components/custom_buton.dart';

class CreateJam extends StatefulWidget {
  const CreateJam({super.key});

  @override
  State<CreateJam> createState() => _CreateJamState();
}

class _CreateJamState extends State<CreateJam> {
  final TextEditingController _GroupNameController = TextEditingController();
  final TextEditingController _GroupLinkController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:50.0, right: 50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's set one up for you!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("What's your Jam name?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
                    CustomTextField(
                      controller: _GroupNameController,
                      hintText: 'Jam Name',
                      ),
                    SizedBox(height: 100),
                    CustomTextField(
                      enabled: false,
                      controller: _GroupLinkController,
                      hintText: 'Generated Jam Link',
                      variant: TextFieldVariant.withButton,
                      actionIcon: Icon(Icons.copy),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Psst! Share this link with your friends to join the session!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Finish',
                      onPressed: () {
                        // Handle finish action
                      },
                    ),
                  ]
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // Navigate to Group Link Invitation page
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