import 'package:url_launcher/url_launcher.dart';

abstract class LauncherApp {
  static Future<void> web() async {
    final Uri url = Uri.parse('https://google.com.br');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
