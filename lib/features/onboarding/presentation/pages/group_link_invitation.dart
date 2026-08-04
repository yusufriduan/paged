import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_buton.dart';
import 'package:paged/features/components/custom_text_field.dart';

class GroupLinkInvitation extends StatefulWidget {
  const GroupLinkInvitation({super.key});

  @override
  State<GroupLinkInvitation> createState() => _GroupLinkInvitationState();
}

class _GroupLinkInvitationState extends State<GroupLinkInvitation> {
  final TextEditingController _controller = TextEditingController();

  void _dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:50.0, right: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Got an invitation link to proceed? else, we could set one up for you!',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 300),
              CustomTextField(
                controller: _controller,
                hintText: 'Enter your invitation link',
                actionIcon: Icon(Icons.arrow_forward),
                variant: TextFieldVariant.withButton,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "I don't have a link",
                onPressed: () {
                  _dismissKeyboard();
                  // Pass the screen to create group page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}