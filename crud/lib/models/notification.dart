import 'package:json_annotation/json_annotation.dart';
part 'notification.g.dart';
@JsonSerializable()
class Notifications
{
  var idNotif;
  String minute;
  String hour;
  String message;

  Notifications({required this.idNotif, required this.minute, required this.hour, required this.message});

  Map<String, dynamic> toMap()
  {
    return{
      'idNotif': idNotif,
      'minute': minute,
      'hour': hour,
      'message': message
    };
  }

//convert to string
  String toString()
  {
    return 'idNotif: $idNotif, minute: $minute, hour: $hour, message: $message';
  }

  factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}