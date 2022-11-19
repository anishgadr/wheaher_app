import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class UserDataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String firstname;
  @HiveField(2)
  final String lastname;
  @HiveField(3)
  final String emailid;
  @HiveField(4)
  int wheather_status;

  UserDataModel(
      {required this.firstname,
      required this.lastname,
      required this.emailid,
      required this.wheather_status,
      this.id});
}
