class Client {
  final String firstName;
  final String lastName;
  final String whatsappNo;
  final String email;
  final String location;
  final String projectName;

  Client(
      {required this.firstName,
      required this.lastName,
      required this.whatsappNo,
      required this.email,
      required this.location,
      required this.projectName});

  factory Client.fromDatabaseJson(Map<String, dynamic> data) => Client(
        firstName: data['firstName'],
        lastName: data['lastName'],
        whatsappNo: data['whatsappNo'],
        email: data['email'],
        location: data['location'],
        projectName: data['projectName']    
      );

  Map<String, dynamic> toDatabaseJson() => {
        "firstName": this.firstName,
        "lastName": this.lastName,
        "whatsappNo": this.whatsappNo,
        "email": this.email,
        "location": this.location,
        "projectName": this.projectName,
      };
}
