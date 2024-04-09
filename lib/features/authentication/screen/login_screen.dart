import 'package:devnet2/core/common/loader.dart';
import 'package:devnet2/core/common/sign_in_button.dart';
import 'package:devnet2/core/constants/constants.dart';
import 'package:devnet2/features/authentication/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signInAsGuest(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signInAsGuest(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    final Shader textShader = LinearGradient(
      colors: [
        Color(0xFFBE1010), // Start color of the gradient
        Color(0xFF5C358E), // Middle color of the gradient
        Color(0xFF4140B3), // End color of the gradient
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(Rect.fromLTWH(100.0, 0.0, 150.0, 70.0));
    return Scaffold(
        
        body: isLoading
            ? const Loader()
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Constants.loginEmotePath,
                      height: 200,
                    ),
                  ),
                  Text(
                    'DevNet.',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      // Apply the shader to the text
                      foreground: Paint()..shader = textShader,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SignInButton(),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      signInAsGuest(ref, context);
                    },
                    child: const Text(
                      "Explore First",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18, // Text color is black
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.black, // Text color is black
                      // Border color and width
                      elevation: 0, // Remove shadow
                    ),
                  )
                ],
              ));
  }
}
