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
    // !Factory method converts JSON obj coming from querying db to Client object
        appointmentType: data['appointmentType'],
        clientName: data['clientName'],
        date: data['date'],
        time: data['time']   
      );

  Map<String, dynamic> toDatabaseJson() => {
    // !This method will be used to convert Client objects that
    // !are to be stored into the datbase in a form of JSON
        "appointmentType": this.appointmentType,
        "clientName": this.clientName,
        "date": this.date,
        "time": this.time
      };
}
