import 'package:client_shared/config.dart';

String serverUrl = "http://$serverIP:4000/";
String wsUrl = serverUrl.replaceFirst("http", "ws");
