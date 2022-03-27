import 'package:flutter/material.dart';
import 'package:the_movie_db/json_serialization/auth_model.dart';
import 'package:the_movie_db/resources/styles.dart';

import 'auth_provider.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AuthMockup(),
      ),
    );
  }
}

class AuthMockup extends StatefulWidget {
  const AuthMockup({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthMockup> createState() => _AuthMockupState();
}

class _AuthMockupState extends State<AuthMockup> {
  final model = AuthModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AuthProvider(
        model: model,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const UsernameField(),
              const PasswordField(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [AuthButton(), RegisterButton()],
              ),
              const SizedBox(height: 20),
              const TextResult(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextResult extends StatelessWidget {
  const TextResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secretCode =
        AuthProvider.of(context)?.secretCode ?? 'Секретный код не выдан';
    return Text('Результат: $secretCode');
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text('Регистрация Encode'));
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: AuthProvider.of(context)?.logIn,
        child: Text('Авторизация Decode'));
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: ((value) => AuthProvider.of(context)?.email = value),
      obscureText: true,
      decoration: AppTextFieldStyle.underline_start('Пароль'),
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => AuthProvider.of(context)?.username = value,
      decoration: AppTextFieldStyle.underline_start('Имя пользователя'),
    );
  }
}
