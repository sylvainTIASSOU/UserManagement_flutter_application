
class Notifications
{
  String minute;
  String hour;
  String name;
  String mode;

  Notifications({required this.minute, required this.hour , required this.name, required this.mode});

  Map<String, dynamic> toMap()
  {
    return{
      'minute': minute,
      'hour': hour,
      'name': name,
      'mode': mode
    };
  }

//convert to string
  String toString()
  {
    return 'minute: $minute, hour: $hour, name: $name, mode: $mode';
  }
}