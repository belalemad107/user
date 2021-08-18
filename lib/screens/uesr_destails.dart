import 'package:flutter/material.dart';
import 'package:user/screens/Widgets/my_card.dart';
import 'package:user/models/user_model.dart';
import 'package:user/utils.dart';

class UserDetails extends StatefulWidget {
  final User user;
  UserDetails(this.user);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          MyCard(
            content: "${widget.user.name}",
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                launchURL("mailto:${widget.user.email}");
              },
              child: Text("Email: ${widget.user.email}")),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                launchURL("tel:${widget.user.phone}");
              },
              child: Text("Phone: ${widget.user.phone}")),
          Divider(),
          InkWell(
            onTap: () {
              launchURL("https://${widget.user.website}");
            },
            child: Text("web: ${widget.user.website}"),
          ),
        ],
      ),
    );
  }
}
