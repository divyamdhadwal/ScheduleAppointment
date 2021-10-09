class Appointment {
  final String appointmentType;
  final String clientName;
  final DateTime date;
  final DateTime time;

  Appointment(
      {required this.appointmentType,
      required this.clientName,
      required this.date,
      required this.time});

  factory Appointment.fromDatabaseJson(Map<String, dynamic> data) => Appointment(
        appointmentType: data['appointmentType'],
        clientName: data['clientName'],
        date: data['date'],
        time: data['time']   
      );

  Map<String, dynamic> toDatabaseJson() => {
        "appointmentType": this.appointmentType,
        "clientName": this.clientName,
        "date": this.date,
        "time": this.time
      };
}
