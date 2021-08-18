import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController updateController = TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  var link = 'https://internship.zuri.team/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('simple app'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.asset('assets/images/i4g.png'),
                            radius: 30),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.asset('assets/images/zuri.png'),
                            radius: 30),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'assets/images/hngi.png',
                            ),
                            radius: 30),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    updateController.text,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          child: new Text(
                            'Visit us on our website',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 22),
                          ),
                          onTap: () => launch('$link')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                updateController.text = val;
                                setState(() {});
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter update';
                                }

                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.blue,
                                content: Text(
                                  'update has been added',
                                  style: TextStyle(fontSize: 15),
                                )));
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Add'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                    ],
                  );
                })));
  }
}
