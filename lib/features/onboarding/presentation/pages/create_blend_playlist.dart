import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_text_field.dart';
import 'package:paged/features/components/custom_buton.dart';

class CreateBlend extends StatefulWidget {
  const CreateBlend({super.key});

  @override
  State<CreateBlend> createState() => _CreateBlendState();
}

class _CreateBlendState extends State<CreateBlend> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
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
                      "What's your Playlist name?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomTextField(
                      controller: _groupNameController,
                      hintText: 'Playlist Name',
                    ),
                    const SizedBox(height: 100),
                    CustomTextField(
                      enabled: false,
                      controller: _groupLinkController,
                      hintText: 'Generated Playlist Link',
                      variant: TextFieldVariant.withButton,
                      actionIcon: const Icon(Icons.copy),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Psst! Share this link with your friends to join the playlist!",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Finish',
                      onPressed: () {},
                    ),
                  ],
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