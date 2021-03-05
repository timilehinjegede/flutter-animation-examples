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
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (_, index) {
          return ItemButton(
            title: ScreenModel.screenModelList[index].screenName,
            onPressed: () {
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

class ItemButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ItemButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  })  : assert(title != null, 'Button Title cannot be null'),
        assert(onPressed != null, 'onTap cannot be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor),
          child: Text(
            title,
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
    );
  }
}
