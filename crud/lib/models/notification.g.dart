// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      idNotif: json['idNotif'],
      minute: json['minute'] as String,
      hour: json['hour'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'idNotif': instance.idNotif,
      'minute': instance.minute,
      'hour': instance.hour,
      'message': instance.message,
    };
