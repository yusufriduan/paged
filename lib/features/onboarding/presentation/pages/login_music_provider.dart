import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:paged/features/components/custom_buton.dart';

class LoginMusicProvider extends StatefulWidget {
  final int pageIndex;
  final int currentPage;
  final VoidCallback onNext;
  const LoginMusicProvider({super.key, required this.pageIndex, required this.currentPage, required this.onNext});

  @override
  State<LoginMusicProvider> createState() => _LoginMusicProviderState();
}

class _LoginMusicProviderState extends State<LoginMusicProvider> {

  // Function to handle the OAuth flow for a given music provider
  Future<void> _connectProvider(String provider) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in. Please log in first.')),
      );
      return;
    }

    String returnUrl;
    String callbackUrlScheme;
    if (kIsWeb) {
      returnUrl = '${Uri.base.origin}/auth.html'; // grabs localhost:5000 or the current origin for web
      callbackUrlScheme = 'http'; // For web, appends auth.html to the current origin
    } else {
      returnUrl = 'paged-music://callback'; // For mobile, use a custom scheme
      callbackUrlScheme = 'paged-music'; // For mobile, use a custom scheme
    }

    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.10:8080/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'uid': user.id,
          'provider': provider,
          'returnUrl': returnUrl,
        }),
      );

      if (response.statusCode == 200) {
        final authUrl = jsonDecode(response.body)['url'];

        final result = await FlutterWebAuth2.authenticate(
          url: authUrl,
          callbackUrlScheme: callbackUrlScheme
        );

        debugPrint("OAuth Result: $result");

        final data64 = Uri.parse(result).queryParameters['data64'];

        if (data64 != null) {
          try {
            String normalized = base64.normalize(data64);
            String decodedString = utf8.decode(base64.decode(normalized));
            Map<String, dynamic> payload = jsonDecode(decodedString);

            if (payload['authModel'] != null && payload['authModel']['status'] == 'success') {
              final String integrationUserUUID = payload['integrationUserUUID'];
              debugPrint("Success! MusicAPI UUID: $integrationUserUUID");

              widget.onNext();
            } else {
              final errorMsg = payload['authModel']?['error'] ?? 'Unknown error occurred';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login failed: $errorMsg')),
              );
            }
          } catch (decodeError) {
            debugPrint("Failed to decode MusicAPI data: $decodeError");
          }
        } else {
          debugPrint("No data64 parameter found in the return URL");
        }
      } else {
         debugPrint("Backend Error: ${response.body}");
      }
    } catch (e) {
      debugPrint("OAuth Exception: $e");
    }
  }

  // Dots indicator for the onboarding pages
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
      body: Padding(
        padding: const EdgeInsets.only(left:50.0, right: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please select your music provider to continue.',
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
              CustomButton(
                text: 'Connect with Spotify',
                onPressed: () {
                  // Handle Spotify login
                  _connectProvider('spotify');
                },
                variant: ButtonVariant.outlined,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Connect with Youtube Music',
                onPressed: () {
                  // Handle Youtube Music login
                  _connectProvider('youtube');
                },
                variant: ButtonVariant.outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}