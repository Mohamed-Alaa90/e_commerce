import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String routeName = '/main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
        //
        centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Locale newLocale =
                Localizations.localeOf(context).languageCode == 'ar'
                    ? const Locale('en')
                    : const Locale('ar');
          },
          child: const Text("Switch Language"),
        ),
      ),
    );
  }
}
