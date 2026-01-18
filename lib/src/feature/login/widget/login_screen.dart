import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp/src/feature/login/data/login_repository.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: 'user1');
    _passwordController = TextEditingController(text: 'password123');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: <Widget>[
            TextField(controller: _usernameController),
            TextField(controller: _passwordController),

            ElevatedButton(
              onPressed: isProcessing
                  ? null
                  : () async {
                      try {
                        setState(() {
                          isProcessing = true;
                        });
                        await ref
                            .read(loginRepositoryProvider)
                            .login(
                              _usernameController.text,
                              _passwordController.text,
                            );
                      } on Object catch (error, stackTrace) {
                        debugPrintStack(
                          label: error.toString(),
                          stackTrace: stackTrace,
                        );
                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('$error')));
                        }
                      } finally {
                        await Future.delayed(Durations.medium4);

                        setState(() {
                          isProcessing = false;
                        });
                      }
                    },
              child: isProcessing
                  ? CircularProgressIndicator()
                  : const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
