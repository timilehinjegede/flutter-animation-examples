import 'package:animations/models/screen_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Animation Examples',
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (_, index) {
          return ItemCard(
            cardTitle: ScreenModel.screenModelList[index].screenName,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ScreenModel.screenModelList[index].screenWidget,
                ),
              );
            },
          );
        },
        itemCount: ScreenModel.screenModelList.length,
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String cardTitle;
  final VoidCallback onTap;

  const ItemCard({
    Key key,
    @required this.cardTitle,
    @required this.onTap,
  })  : assert(cardTitle != null, 'Card Title cannot be null'),
        assert(onTap != null, 'onTap cannot be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              cardTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ),
      ),
    );
  }
}
