import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whether_app/db/funtions/db_functions.dart';
import 'package:whether_app/home/widget/toggle_switch.dart';
import 'package:whether_app/login/login_screen.dart';
import 'package:whether_app/userform/userform_page.dart';
import 'package:whether_app/wheather/wheather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getAllUserData();
    return WillPopScope(
      onWillPop: (() => Future.value(false)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Wheather App"),
          backgroundColor: Color(0xFF556bf9),
          leading: const Icon(Icons.cloud),
          elevation: 0,
          actions: [
            //IconButton
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add New User',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AddNewUser())));
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'LogOut',
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("isLogin");

                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LoginScreen())));
              },
            ), //
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: userdata,
          builder: (context, value, child) {
            return ListView.separated(
                itemBuilder: ((context, index) {
                  var data = value[index];
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      if (data.id != null) {
                        deleteItem(data.id!);
                      } else {
                        print("User ID is null ,can't delete");
                      }
                    },
                    key: Key(index.toString()),
                    child: ListTile(
                      title: Text("${data.firstname} ${data.lastname}"),
                      subtitle: Text(data.emailid),
                      trailing: SwitchScreen(
                        id: data.id ?? 0,
                        status: data.wheather_status == 1 ? true : false,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => WheatherPage())));
                      },
                    ),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return const Divider();
                }),
                itemCount: value.length);
          },
        ),
      ),
    );
  }
}
