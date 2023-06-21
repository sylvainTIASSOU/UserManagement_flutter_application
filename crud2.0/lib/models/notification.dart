
class Notifications
{
  var id;
  String minute;
  String hour;
  String name;
  String mode;

  Notifications({required this.id, required this.minute, required this.hour , required this.name, required this.mode});

  Map<String, dynamic> toMap()
  {
    return{
      'id': id,
      'minute': minute,
      'hour': hour,
      'name': name,
      'mode': mode
    };
  }

//convert to string
  String toString()
  {
    return 'id: $id, minute: $minute, hour: $hour, name: $name, mode: $mode';
  }
}