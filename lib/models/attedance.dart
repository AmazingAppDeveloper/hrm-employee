// ignore_for_file: non_constant_identifier_names

class Employee {
  String attendance_date;
  String clock_in;
  String clock_out;
   String address;

  Employee(
      {required this.attendance_date,
      required this.clock_in,
      required this.address,
      required this.clock_out});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      attendance_date: json['attendance_date'] as String,
      clock_in: json['clock_in'] as String,
        address: json['location'] as String,
      clock_out: json['clock_out'] as String,
    );
  }
}
