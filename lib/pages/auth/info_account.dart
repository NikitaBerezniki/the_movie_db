

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InfoAccountWidget extends StatelessWidget {
  const InfoAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Войти в свою учётную запись', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        InformationAboutRegistration(),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      ],
    );
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
              style: TextStyle(fontSize: 18, color: Colors.black)),
          TextSpan(
              text: 'Нажмите здесь',
              style: TextStyle(
    fontSize: 18,
    color: Colors.blue,
    decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigator.of(context).pushNamed('registration/');
                }),
          const TextSpan(text: ', чтобы начать.', style: TextStyle(fontSize: 18, color: Colors.black)),
          const TextSpan(text: '\n\n', style: TextStyle(fontSize: 18, color: Colors.black)),
          const TextSpan(
              text: 'Если Вы зарегистрировались,'
                  ' но не получили письмо для подтверждения, ',
              style: TextStyle(fontSize: 18, color: Colors.black)),
          TextSpan(
              text: 'нажмите здесь',
              style: TextStyle(fontSize: 18, color: Colors.black),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigator.of(context).pushNamed('registration');
                }),
          const TextSpan(
            text: ', чтобы отправить письмо повторно.',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )
        ],
      ),
    );
  }
}
