import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatbox/Features/Authentication/Riverpod/providers.dart';
import 'package:chatbox/Features/Authentication/Widgets/custom_buttons.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(authNotifierProvider.notifier);

    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text('Sign in'),
          ),
          body: Column(
            children: [
            
              ButtonWidget(
                text: 'Sign In',
                color: const Color.fromRGBO(45, 101, 246, 1),
                onTap: () async {
                  await signInState.signIn(emailEditingController.text,
                      passwordEditingController.text);
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Google authentication required',
                  style: TextStyle(
                    color: Color.fromRGBO(45, 101, 246, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              
              const SizedBox(
                height: 28.0,
              ),
              ButtonWidget(
                text: 'Sign in With Google',
                color: const Color.fromRGBO(45, 101, 246, 1),
                onTap: () {
                  signInState.googleSignIn();
                },
                assetIconURL: 'Assets/Images/googleIcon.png',
              ),
            ],
          ),
        );
      },
    );
  }
}
