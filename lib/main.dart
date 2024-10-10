import 'package:flutter/material.dart';
import 'package:localization/controller.dart';
import 'package:localization/home.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp= await SharedPreferences.getInstance();
  final String language= sp.getString('languageCode')?? ' ';
  runApp(MyApp(locale: language,));
}

class MyApp extends StatelessWidget {
  final String locale;

  const MyApp({super.key,required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>localControler()),
    ],
    child:Consumer<localControler>(builder: (context,provider,child){


      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: locale ==' '? Locale('en'):provider.locale==null? Locale(locale):provider.locale,
        localizationsDelegates: [
          AppLocalizations.delegate,

          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en'),
          Locale('es'),
        ],
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const homeScreen(),
      );
    }));
  }
}

