import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/model/addresses_entity.dart';
import 'package:bluekango/model/menu.dart';
import 'package:bluekango/service/address_service.dart';
import 'package:bluekango/service/menu_service.dart';
import 'package:bluekango/ui/widget/button_favorite.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class AddressListScreen extends StatefulWidget {
  static final String routeName = "/addresses";

  @override
  _AddressListScreenState createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> implements ItemClickListener{
  final AddressService _addressService = AddressService();
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
              child: Text('Mes adresses', textScaleFactor: 1.8),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Address>>(
                future: _addressService.getAddresses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<Address> addresses = snapshot.data;
                      return ListView.separated(
                        itemCount: addresses.length,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.transparent),
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: ListTile(
                              title: Text('${index+1} addresse'),
                              subtitle: Text(addresses[index].street+'\n'+addresses[index].address),
                            ),
                            onTap: (){},
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
        bottomNavigationBar: FavoriteButton(isFavorite:menu.isFavorite,itemClickListener: this),
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