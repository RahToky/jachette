import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/service/comand_service.dart';
import 'package:bluekango/ui/screen/commands/command_detail_screen.dart';
import 'package:bluekango/ui/widget/button_favorite.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CommandListScreen extends StatelessWidget implements ItemClickListener{
  static final String routeName = "/commands";
  final CommandService _commandService = CommandService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text('Commandes', textScaleFactor: 1.8),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Cart>>(
                future: _commandService.getCarts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<Cart> carts = snapshot.data;
                      return ListView.separated(
                        itemCount: carts.length,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(color: Colors.transparent),
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: ListTile(
                              leading: Image.asset('assets/images/${carts[index].user.photo}'),
                              title: Text('${index+1} transaction'),
                              subtitle: Text(carts[index]
                                  .commands
                                  .map((e) => e.product.name)
                                  .join("\n")
                                  .toString()),
                            ),
                            onTap: () => Navigator.pushNamed(
                                context, CommandDetailScreen.routeName,arguments: {'cart':carts[index]}),
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
    // TODO: implement onClick
  }
}
