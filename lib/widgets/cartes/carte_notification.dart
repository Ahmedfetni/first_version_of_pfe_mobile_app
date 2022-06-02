import 'package:flutter/material.dart';

class CarteNotification extends StatefulWidget {
  CarteNotification({Key? key}) : super(key: key);

  @override
  State<CarteNotification> createState() => _CarteNotificationState();
}

class _CarteNotificationState extends State<CarteNotification> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Wrap(
          children: const [
            Text(
              "une nouvelle notification",
              style: TextStyle(color: Colors.lightBlue),
            ),
          ],
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
