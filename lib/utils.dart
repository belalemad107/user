import 'package:url_launcher/url_launcher.dart';

void launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}
