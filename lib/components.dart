import 'package:url_launcher/url_launcher.dart';




launchEmail() async
{
  final url ='mailto:contact@ittalents.dz' ;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
makingPhoneCall() async
{
  const url = 'tel: +213  23 78 10 28';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}