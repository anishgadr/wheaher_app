import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whether_app/db/models/data_model.dart';

ValueNotifier<List<UserDataModel>> userdata = ValueNotifier([]);

Future<void> addUserData(UserDataModel modeldata) async {
  print(modeldata.toString());
  final userDB = await Hive.openBox<UserDataModel>('user_db');
  final _id = await userDB.add(modeldata);
  modeldata.id = _id;
  userdata.value.add(modeldata);
  userdata.notifyListeners();
}

Future<void> getAllUserData() async {
  final userDB = await Hive.openBox<UserDataModel>('user_db');
  userdata.value.clear();
  userdata.value.addAll(userDB.values);
  userdata.notifyListeners();
}

Future<void> deleteItem(int id) async {
  final userDB = await Hive.openBox<UserDataModel>('user_db');
  await userDB.delete(id);
  getAllUserData();
}

Future<void> updateItem(int? id, bool status) async {
  final userDB = await Hive.openBox<UserDataModel>('user_db');
  final modelDb = userDB.containsKey(id);
  if (modelDb) {
    final data = userDB.values.elementAt(id!);
    var statusval = 0;
    if (status) {
      statusval = 1;
    } else {
      statusval = 0;
    }
    var model = UserDataModel(
        firstname: data.firstname,
        lastname: data.lastname,
        emailid: data.emailid,
        wheather_status: statusval);
    userDB.put(id, model);
  }
  getAllUserData();
}
