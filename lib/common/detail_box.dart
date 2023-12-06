import 'package:flutter/material.dart';

class DetailBox extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final Icon? iconEnd;
  const DetailBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconEnd = null,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 100,
      child: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 2.0,
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            leading: icon,
            trailing:
                iconEnd == null ? iconEnd : Icon(Icons.star_outline_outlined),
          ),
        );
      }),
    );
  }
}
