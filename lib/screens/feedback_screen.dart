import 'package:campus_connect/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import '../utilities/drawer_widget.dart';
import '../utilities/show_error_dialog.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();
  late final String _subject;
  late final String _body;

  void pushReplacementRoute(String route){
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Feedback"),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLines: 1,
              enableSuggestions: true,
              autocorrect: true,
              keyboardType: TextInputType.text,
              controller: subjectController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Subject'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLines: 20,
              maxLength: 300,
              enableSuggestions: true,
              autocorrect: true,
              keyboardType: TextInputType.text,
              controller: feedbackController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Feedback Details'
              ),
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
            child: ElevatedButton(
              onPressed: () async{
                try{
                  _subject = subjectController.text;
                  _body = feedbackController.text;
                  final Email email = Email(
                    body: _body,
                    subject: _subject,
                    recipients: ['emmanueldokeii@gmail.com'],
                    isHTML: false,
                  );
                  await FlutterEmailSender.send(email);
                  pushReplacementRoute(homeScreenRoute);
                } catch (e){
                  await showErrorDialog(context, e.toString());
                }
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                    padding: EdgeInsets.all(8),
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
