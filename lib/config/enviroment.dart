import 'package:flutter_dotenv/flutter_dotenv.dart';

late String serverURL;
late String title;

Future<void> loadEnviroments()async{
  await dotenv.load(fileName: ".env");
  serverURL = dotenv.env["BACKEND_URL"]!;
  title = dotenv.env["APP_TITLE"]!;
}
