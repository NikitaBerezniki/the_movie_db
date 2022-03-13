import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

const double _sizeHeaderText = 24;
const double _sizeText = 18;
const _styleHeaderText =
    TextStyle(fontSize: _sizeHeaderText, fontWeight: FontWeight.bold);
const _styleInfoText = TextStyle(fontSize: _sizeText, color: Colors.black);
const _styleNavigateText = TextStyle(
    fontSize: _sizeText,
    color: Colors.blue,
    decoration: TextDecoration.underline);

class AuthorizationPage extends StatelessWidget {
  AuthorizationPage({Key? key}) : super(key: key);
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

class InfoAccountWidget extends StatelessWidget {
  const InfoAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Войти в свою учётную запись',
          style: _styleHeaderText,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        InformationAboutRegistration(),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        InformationAboutConfirmationMail(),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      ],
    );
  }
}

class _LogInFormWidget extends StatefulWidget {
  const _LogInFormWidget({Key? key}) : super(key: key);

  @override
  _LogInFormWidgetState createState() => _LogInFormWidgetState();
}

class _LogInFormWidgetState extends State<_LogInFormWidget> {
  bool _isPasswordDisplay = true;
  Icon iconSwitchVisiblePassword = const Icon(Icons.visibility_off);
  TextEditingController emailController = TextEditingController(text: 'admin');
  TextEditingController passwordController =
      TextEditingController(text: 'admin');

  void _onlogInToYourAccount() {
    if (emailController.text == 'admin' && passwordController.text == 'admin') {
      Navigator.of(context).pushNamed('/');
    }
  }

  void _clearPassword() {
    passwordController.clear();
  }

  void onSwitchPasswordDisplay() {
    setState(() {
      _isPasswordDisplay = _isPasswordDisplay ? false : true;
      iconSwitchVisiblePassword = _isPasswordDisplay
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility);
    });
  }

  @override
  Widget build(BuildContext context) {
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

    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 5),
            child:
                const Text('Имя пользователя / Почта', style: _styleInfoText)),
        TextField(
          controller: emailController,
          // cursorColor: Colors.blue,
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
          child: const Text('Пароль', style: _styleInfoText),
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        TextField(
          controller: passwordController,
          obscureText: _isPasswordDisplay,
          cursorColor: Colors.blue,
          autocorrect: false,
          decoration: InputDecoration(
              // labelText: 'Введите пароль',

              contentPadding: EdgeInsets.all(5),
              prefixIcon: Icon(Icons.key_rounded),
              suffixIcon: IconButton(
                  onPressed: onSwitchPasswordDisplay,
                  icon: iconSwitchVisiblePassword),
              errorBorder: _customErrorInputDecoration,
              border: _customInputDecoration),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: _onlogInToYourAccount,
                  child: const Text(
                    'Войти',
                    style: TextStyle(fontSize: _sizeText),
                  )),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              TextButton(
                  onPressed: _clearPassword,
                  child: const Text(
                    'Сбросить пароль',
                    style: TextStyle(fontSize: _sizeText),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class InformationAboutConfirmationMail extends StatelessWidget {
  const InformationAboutConfirmationMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(
          text: 'Если Вы зарегистрировались,'
              ' но не получили письмо для подтверждения, ',
          style: _styleInfoText),
      TextSpan(
          text: 'нажмите здесь',
          style: _styleNavigateText,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pushNamed('registration');
            }),
      const TextSpan(
        text: ', чтобы отправить письмо повторно.',
        style: _styleInfoText,
      )
    ]));
  }
}

class InformationAboutRegistration extends StatelessWidget {
  const InformationAboutRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
              text: 'Чтобы пользоваться правкой и возможностями рейтинга TMDB,'
                  ' а также получить персональные рекомендации,'
                  ' необходимо войти в свою учётную запись.'
                  ' Если у вас нет учётной записи,'
                  ' её регистрация является бесплатной и простой. ',
              style: _styleInfoText),
          TextSpan(
              text: 'Нажмите здесь',
              style: _styleNavigateText,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed('registration');
                }),
          const TextSpan(text: ', чтобы начать', style: _styleInfoText)
        ],
      ),
    );
  }
}

class MySliverAppBar extends SliverAppBar {
  const MySliverAppBar({Key? key}) : super(key: key);
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color.fromRGBO(3, 37, 65, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 35,
              )),
          IconButton(
            onPressed: null,
            icon: Image.asset('images/logo.png'),
            iconSize: 60,
            padding: const EdgeInsets.all(0),
          ),
          Row(
            children: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
