import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/model/addresses_entity.dart';
import 'package:bluekango/service/address_service.dart';
import 'package:bluekango/ui/widget/button_favorite.dart';
import 'package:flutter/material.dart';

class AddressListScreen extends StatelessWidget implements ItemClickListener{
  static final String routeName = "/addresses";
  final AddressService _addressService = AddressService();


  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: FavoriteButton(this),
      ),
    );
  }

  @override
  void onClick(item) {

  }
}