import 'package:flutter/material.dart';
import 'package:paged/features/onboarding/presentation/pages/create_option.dart';
import 'package:paged/features/components/custom_buton.dart';
import 'package:paged/features/components/custom_text_field.dart';

class GroupLinkInvitation extends StatefulWidget {
  final int pageIndex;
  final int currentPage;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  const GroupLinkInvitation({super.key, required this.pageIndex, required this.currentPage, this.onNext, this.onBack});

  @override
  State<GroupLinkInvitation> createState() => _GroupLinkInvitationState();
}

class _GroupLinkInvitationState extends State<GroupLinkInvitation> {
  final TextEditingController _controller = TextEditingController();

  void _dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        final active = i == widget.currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: active ? 20 : 6,
          decoration: BoxDecoration(
            color: active ? Colors.blue : Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                        SizedBox(height: 280),
                        _buildDots(),
                        SizedBox(height: 50),
                        CustomTextField(
                          controller: _controller,
                          hintText: 'Enter your invitation link',
                          actionIcon: Icon(Icons.arrow_forward),
                          variant: TextFieldVariant.withButton,
                          onActionPressed: () {
                            _dismissKeyboard();
                            debugPrint('Action button pressed with input: ${_controller.text}');
                            // Handle the action when the button is pressed
                          },
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: "I don't have a link",
                          onPressed: () {
                            _dismissKeyboard();
                            // Pass the screen to create group page
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOption()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )        
      ),
    );
  }
}