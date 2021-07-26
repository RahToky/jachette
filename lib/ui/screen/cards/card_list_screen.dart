import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/model/menu.dart';
import 'package:bluekango/service/card_service.dart';
import 'package:bluekango/model/cards_entity.dart' as mpackage;
import 'package:bluekango/service/menu_service.dart';
import 'package:bluekango/ui/widget/button_favorite.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CardListScreen extends StatefulWidget {
  static final String routeName = "/cards";

  @override
  _CardListScreenState createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> implements ItemClickListener{
  final CardService _cardService = CardService();
  final MenuService _menuService = MenuService();
  Menu menu;


  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    menu = arguments['menu'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text('Mes cartes', textScaleFactor: 1.8),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<mpackage.Card>>(
                future: _cardService.getCards(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<mpackage.Card> cards = snapshot.data;
                      return ListView.separated(
                        itemCount: cards.length,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.transparent),
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: ListTile(
                              title: Text('Card ${index+1}'),
                              subtitle: Text(cards[index].type+'\n'+cards[index].number),
                            ),
                            onTap: () {
                            },
                          );
                        },
                      );
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),

        bottomNavigationBar: FavoriteButton(isFavorite: menu.isFavorite,itemClickListener: this),
      ),
    );
  }


  @override
  void onClick(item) {
    updateFavorite();
  }

  void updateFavorite() async{
    int updated = await _menuService.setFavorite(menu.id, !menu.isFavorite);
    dev.log('updated = $updated');
    if(updated == 1) {
      menu.isFavorite = !menu.isFavorite;
    }
  }
}