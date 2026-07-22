import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: buildContainer(), subtitle: buildContainer()),
        Divider(),
      ],
    );
  }

  Widget buildContainer() {
    return Container(
      color: Colors.grey.shade200,
      height: 24,
      width: 150,
      margin: EdgeInsets.only(top: 5, bottom: 5),
    );
  }
}
