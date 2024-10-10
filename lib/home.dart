import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/controller.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}
enum language{english, spanish}
class _homeScreenState extends State<homeScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloworld),
        actions: [
          Consumer<localControler>(
              builder: (context,provider,child){
            return  PopupMenuButton(
                onSelected: (language item){
                  if(language.english.name==item.name){
                    provider.changeLanguage(Locale('en'));
                    print('english');

                  }else{
                    provider.changeLanguage(Locale('es'));
                    print('spanish');
                  }
                },
                itemBuilder: (BuildContext context)=><PopupMenuEntry<language>>[

                  const PopupMenuItem(
                      value: language.english,
                      child: Text('English')),
                  const PopupMenuItem(
                      value: language.spanish,
                      child: Text('Spanish')),

                ]);
          })

        ],
      ),
      body:  Center(
        child:  Column(
          children: [
            Text(AppLocalizations.of(context)!.home),
            Text(AppLocalizations.of(context)!.enjoy),
             ExpansionTile(
              title: Text('ExpansionTile 1'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
            ),
            ExpansionTile(
              title: const Text('ExpansionTile 2'),
              subtitle: const Text('Custom expansion arrow icon'),
              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
              ),
              children: const <Widget>[
                ListTile(title: Text('This is tile number 2')),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
          ],

        ),
      ),
    );
  }
}
