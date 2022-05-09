import 'package:flutter/material.dart';
import 'package:the_movie_db/pages/auth/auth_model.dart';
import 'package:the_movie_db/service/main_navigation.dart';
import 'package:the_movie_db/service/notifier_provider.dart';
import '../../widgets/sliver_appbar_widget.dart';
import 'info_account.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            MyAppBar(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  InfoAccountWidget(),
                  _LogInFormWidget(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _LogInFormWidget extends StatelessWidget {
  const _LogInFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.of<AuthScreenModel>(context);

    const _customInputDecoration = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.black),
        gapPadding: 5);
    const _customErrorInputDecoration = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Colors.red,
        ),
        gapPadding: 5);

    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: const Text('Имя пользователя / Почта',
              style: TextStyle(fontSize: 18, color: Colors.black))),
      TextField(
        controller: model?.usernameController,
        decoration: const InputDecoration(
            enabled: true,
            contentPadding: EdgeInsets.all(5),
            prefixIcon: Icon(Icons.person),
            border: _customInputDecoration),
        autocorrect: true,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      Container(
        alignment: Alignment.centerLeft,
        child: const Text('Пароль',
            style: TextStyle(fontSize: 18, color: Colors.black)),
        padding: EdgeInsets.symmetric(vertical: 5),
      ),
      TextField(
        controller: model?.passwordController,
        obscureText: model?.isPasswordDisplay ?? true,
        cursorColor: Colors.blue,
        autocorrect: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            prefixIcon: Icon(Icons.key_rounded),
            suffixIcon: IconButton(
                onPressed: model?.onSwitchPasswordDisplay,
                icon: model?.isPasswordDisplay == true
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility)),
            errorBorder: _customErrorInputDecoration,
            border: _customInputDecoration),
      ),
      const _ErrorMessageWidget(),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            _AuthButton(),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Забыли пароль? Восстановить',
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    ]);
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.of<AuthScreenModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? SizedBox(
            height: 18,
            width: 18,
            child: const CircularProgressIndicator(strokeWidth: 2))
        : const Text('Войти', style: TextStyle(fontSize: 18));
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        NotifierProvider.of<AuthScreenModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(errorMessage,
          style: TextStyle(fontSize: 18, color: Colors.red[900])),
    );
  }
}

// class _LogInFormWidget extends StatefulWidget {
//   const _LogInFormWidget({Key? key}) : super(key: key);

//   @override
//   _LogInFormWidgetState createState() => _LogInFormWidgetState();
// }

// class _LogInFormWidgetState extends State<_LogInFormWidget> {
//   bool _isPasswordDisplay = true;
//   Icon iconSwitchVisiblePassword = const Icon(Icons.visibility_off);
//   TextEditingController emailController = TextEditingController(text: 'admin');
//   TextEditingController passwordController =
//       TextEditingController(text: 'admin');

//   void _onlogInToYourAccount() {
//     if (emailController.text == 'admin' && passwordController.text == 'admin') {
//       Navigator.of(context).pushNamed(MainNavigationOfRoutes.homePage);
//     }
//   }

//   void _clearPassword() {
//     passwordController.clear();
//   }

//   void onSwitchPasswordDisplay() {
//     setState(() {
//       _isPasswordDisplay = _isPasswordDisplay ? false : true;
//       iconSwitchVisiblePassword = _isPasswordDisplay
//           ? const Icon(Icons.visibility_off)
//           : const Icon(Icons.visibility);
//     });
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const _customInputDecoration = OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(5)),
//         borderSide: BorderSide(color: Colors.black),
//         gapPadding: 5);
//     const _customErrorInputDecoration = OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(5)),
//         borderSide: BorderSide(
//           color: Colors.red,
//         ),
//         gapPadding: 5);

//     return Column(children: [
//       Container(
//           alignment: Alignment.centerLeft,
//           padding: EdgeInsets.symmetric(vertical: 5),
//           child: const Text('Имя пользователя / Почта', style: _styleInfoText)),
//       TextField(
//         controller: emailController,
//         decoration: const InputDecoration(
//             enabled: true,
//             contentPadding: EdgeInsets.all(5),
//             prefixIcon: Icon(Icons.person),
//             border: _customInputDecoration),
//         autocorrect: true,
//       ),
//       const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//       Container(
//         alignment: Alignment.centerLeft,
//         child: const Text('Пароль', style: _styleInfoText),
//         padding: EdgeInsets.symmetric(vertical: 5),
//       ),
//       TextField(
//         controller: passwordController,
//         obscureText: _isPasswordDisplay,
//         cursorColor: Colors.blue,
//         autocorrect: false,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(5),
//             prefixIcon: Icon(Icons.key_rounded),
//             suffixIcon: IconButton(
//                 onPressed: onSwitchPasswordDisplay,
//                 icon: iconSwitchVisiblePassword),
//             errorBorder: _customErrorInputDecoration,
//             border: _customInputDecoration),
//       ),
//       Container(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Row(
//           children: [
//             ElevatedButton(
//                 onPressed: _onlogInToYourAccount,
//                 child: const Text(
//                   'Войти',
//                   style: TextStyle(fontSize: _sizeText),
//                 )),
//             const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//             TextButton(
//                 onPressed: _clearPassword,
//                 child: const Text(
//                   'Сбросить пароль',
//                   style: TextStyle(fontSize: _sizeText),
//                 ))
//           ],
//         ),
//       ),
//     ]);
//   }
// }
