import 'package:flutter/material.dart';
import 'package:paged/features/onboarding/presentation/pages/create_blend_playlist.dart';
import 'package:paged/features/onboarding/presentation/pages/create_jam_session.dart';
import 'package:paged/features/components/custom_buton.dart';

class CreateOption extends StatefulWidget {
  const CreateOption({super.key});

  @override
  State<CreateOption> createState() => _CreateOptionState();
}

class _CreateOptionState extends State<CreateOption> {
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
                      "What would you like to create?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
                    CustomButton(
                      text: "Create Blend Playlist",
                      onPressed: () {
                        // Navigate to Create Blend Playlist page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlend()));
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Create Jam Session",
                      onPressed: () {
                        // Navigate to Create Jam Session page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateJam()));
                      },
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
                  onPressed:() {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}