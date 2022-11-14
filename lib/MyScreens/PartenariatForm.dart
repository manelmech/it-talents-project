import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../GoogleAuth.dart';





class PartenariatForm extends StatefulWidget {
  PartenariatForm({Key key}) : super(key: key);


  @override

  _PartenariatForm createState() => _PartenariatForm();
}

class _PartenariatForm extends State<PartenariatForm> {
  final snackBar = SnackBar(content: Text('Message envoyé avec succes'),backgroundColor: Colors.green,);
  int group =1;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var societyController = TextEditingController();
  var telephoneController = TextEditingController();
  var messageController = TextEditingController();
   Email email;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
          alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24,
                      right: 24,top :50),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Column(

                      children: [
                        SizedBox(height:50.0),
                        Container(
                          width:double.infinity,
                          child: Image.asset('images/partener.jpg',
                              height: 220
                          ),
                        ),]
                  ),
                ),
              ],
            ),



            Text(
              'Devenir Partenaire',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(

                  'Nous croyons en la valeur concrète et durable générée par un partenariat stratégique. C’est pourquoi nous voulons vous connaître et bâtir avec vous.',
               textAlign: TextAlign.center,
                  style: TextStyle(

                    color: Colors.grey[800],
                    fontSize: 12,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextFormField(
                        controller:societyController,
                        validator:(String value) {
                          if (value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Nom de la société',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextFormField(
                          controller:emailController,
                        validator:(String value) {
                          if (value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),

                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextFormField(
                          controller:telephoneController,
                        validator:(String value) {
                          if (value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Téléphone',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextFormField(
                        controller:messageController,
                        maxLines:10,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Message',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      child: ElevatedButton(
                        style:ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blue)
                              )
                          ),
                        ),





                        onPressed: () {
                          if (formKey.currentState.validate())
                          {
                            sendEmail(society: societyController.text,tel: telephoneController.text,part: messageController.text).then((value) {ScaffoldMessenger.of(context).showSnackBar(snackBar);} ).catchError((error){print(error.toString());});
                          }
                        },
                        child: Text(
                          'Envoyer',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Future sendEmail({String society,String tel,String part}) async {
  final user = await GoogleAuthApi.signIn() ;
  if(user==null) return ;
  final email =user.email;
  final auth = await user.authentication;
  final token=auth.accessToken;
  final smtpServer = gmailSaslXoauth2(email, token);
  society = society == null? '':society;
  tel = tel == null? '':tel;
  part = part == null? '':part;

  final message = Message()
    ..from = Address(email,user.displayName)
    ..recipients.add('ik_mehar@esi.dz')
  //  ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //  ..bccRecipients.add(Address('bccAddress@example.com'))
   ..subject ='Demande de partenariat'
    ..text = 'Societé :  ${society} \nTéléphone : ${tel} \n${part} ';



  await send(message,smtpServer) ;


}
}




