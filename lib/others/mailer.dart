import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<bool> sendMail(String to, String subject, String body) async {
  String username = 'applicationwayout@gmail.com';
  String password = 'ejntpurrhwoplqcq';

  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username, 'Rio')
    ..recipients.add(to)
    ..subject = subject
    ..text = body;

  try {
    var connection = PersistentConnection(smtpServer);

    // Send the message
    await connection.send(message);

    // Close the connection
    await connection.close();

    return true;
  } catch (e, stackTrace) {
    // Log the error
    print('Error sending email: $e\n$stackTrace');

    return false;
  }
}
