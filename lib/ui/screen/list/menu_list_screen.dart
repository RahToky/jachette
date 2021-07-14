import 'package:bluekango/ui/screen/detail/command_detail_screen.dart';
import 'package:flutter/material.dart';

class MenuListScreen extends StatelessWidget {
  static final String routeName = "/commands";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              child: ListView.separated(
                itemCount: 50,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.transparent,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                      leading: Image.asset('assets/images/photo_1.png'),
                      title: Text('title $index'),
                      subtitle: Text('sous titre $index \nblabla'),
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, CommandDetailScreen.routeName),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
