import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../business_logic/blocs/client_bloc.dart';
import '../widgets/basic_date_field.dart';
import '../widgets/basic_time_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/padding_wrapper.dart';
import '../widgets/text_field_design.dart';
import '../../data/models/client.dart';

class NewAppointment extends StatefulWidget {
  static const routeName = '/';
  final String title;
  NewAppointment({Key? key, required this.title}) : super(key: key);

  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  final ClientBloc clientBloc = ClientBloc();
  final _appointmentType = TextEditingController();
  final _clientName = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _whatsappNo = TextEditingController();
  final _email = TextEditingController();
  final _location = TextEditingController();
  final _projectName = TextEditingController();

  final _newAppformKey = GlobalKey<FormState>();
  final _newClientformKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _appointmentType.dispose();
    _clientName.dispose();
    _date.dispose();
    _time.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _whatsappNo.dispose();
    _email.dispose();
    _location.dispose();
    _projectName.dispose();
    clientBloc.dispose();
    super.dispose();
  }

  Future<void> newClientForm(BuildContext context) async {
    return await showDialog<Null>(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(20),
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(235, 244, 247, 1)),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Form(
                  key: _newClientformKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaddingWrapper(
                          pad: 10,
                          myWidget: Text(
                            'Add a New Client',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFieldDesign(
                            widgetMargin: 5.0,
                            formWidget: CustomTextFormField(
                              myController: _firstName,
                              hintText: 'First Name',
                            )),
                        TextFieldDesign(
                            widgetMargin: 5.0,
                            formWidget: CustomTextFormField(
                              myController: _lastName,
                              hintText: 'Last Name',
                            )),
                        TextFieldDesign(
                            widgetMargin: 5.0,
                            formWidget: CustomTextFormField(
                              myController: _whatsappNo,
                              hintText: 'Whatsapp No',
                            )),
                        TextFieldDesign(
                            widgetMargin: 5.0,
                            formWidget: CustomTextFormField(
                              myController: _email,
                              hintText: 'Email',
                            )),
                        TextFieldDesign(
                            widgetMargin: 5.0,
                            formWidget: CustomTextFormField(
                              myController: _location,
                              hintText: 'Location',
                            )),
                        TextFieldDesign(
                            widgetMargin: 5.0,
                            formWidget: CustomTextFormField(
                              myController: _projectName,
                              hintText: 'Project Name',
                            )),
                        CustomButton(
                            child: Text(
                              'Save',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.orange.shade900,
                                Colors.orange.shade600
                              ],
                            ),
                            onPressed: () {
                              final newClient = Client(
                                  firstName: _firstName.value.text,
                                  lastName: _lastName.value.text,
                                  whatsappNo: _whatsappNo.value.text,
                                  email: _email.value.text,
                                  location: _location.value.text,
                                  projectName: _projectName.value.text);
                              if (newClient.firstName.isNotEmpty &&
                                  newClient.lastName.isNotEmpty &&
                                  newClient.whatsappNo.isNotEmpty &&
                                  newClient.location.isNotEmpty &&
                                  newClient.projectName.isNotEmpty &&
                                  newClient.location.isNotEmpty) {
                                clientBloc.addClient(newClient);
                              }
                              Navigator.pop(context);
                              print('Added');
                            }),
                      ],
                    ),
                  ),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black87,
                onPressed: () => {},
              );
            },
          ),
          title: Text(widget.title),
          centerTitle: false,
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _newAppformKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFieldDesign(
                    formWidget: CustomTextFormField(
                  myController: _appointmentType,
                  hintText: 'Site Visit',
                )),
                Card(
                  margin: EdgeInsets.all(15),
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldDesign(
                          widgetMargin: 0.0,
                          formWidget: CustomTextFormField(
                            myController: _clientName,
                            hintText: 'Client Name',
                          )),
                      PaddingWrapper(
                        myWidget: getClientsWidget(),
                      ),
                      PaddingWrapper(
                        myWidget: Divider(),
                        pad: 5.0,
                      ),
                      PaddingWrapper(
                        myWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.orange.shade900,
                                size: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () => newClientForm(context),
                                  child: Text(
                                    'New Client',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
                BasicDateField(myController: _date),
                BasicTimeField(myController: _time),
                CustomButton(
                    child: Text(
                      'Schedule',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.orange.shade900,
                        Colors.orange.shade600
                      ],
                    ),
                    onPressed: () {
                      print('Scheduled');
                    }),
              ],
            ),
          ),
        ));
  }

  Widget getClientsWidget() {
    return StreamBuilder(
        stream: clientBloc.clients,
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          return getEachClientWidget(snapshot);
        });
  }

  Widget getEachClientWidget(AsyncSnapshot<List<Client>> snapshot) {
    if (snapshot.hasData) {
      return snapshot.data!.length != 0
          ? Container(
              height: 100,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, itemPosition) {
                    Client client = snapshot.data![itemPosition];
                    return ListTile(
                      title: Text(client.firstName),
                      trailing: Text(client.location),
                    );
                  }),
            )
          : Text('Nothing to show here');
    } else {
      return Center(
        child: loadingData(),
      );
    }
  }

  Widget loadingData() {
    //pull todos again
    clientBloc.getClients();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 1,
            ),
            Text("Loading...", style: TextStyle(fontSize: 10))
          ],
        ),
      ),
    );
  }
}
