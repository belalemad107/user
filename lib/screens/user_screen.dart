import 'package:flutter/material.dart';
import 'package:user/models/user_model.dart';
import 'package:user/screens/Widgets/my_card.dart';
import 'package:user/screens/uesr_destails.dart';
import 'package:user/services/user_service.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isloading = true;
  List<User> users = [];
  getUserList() async {
    users = await UserService().getUser();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Screen'),
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetails(users[index])));
                    },
                    child: MyCard(
                      content: "${users[index].name}",
                    )),
              ),
              itemCount: users.length,
            ),
    );
  }
}
