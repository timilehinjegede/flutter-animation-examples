import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation Examples',
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.3),
        itemBuilder: (_, index) {
          return ItemCard(
            cardTitle: 'index $index',
            onTap: (){
              print(index);
            },
          );
        },
        itemCount: 3,
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String cardTitle;
  final VoidCallback onTap;

  const ItemCard({Key key, this.cardTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.blue,
        child: Center(
          child: Text(
            cardTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
