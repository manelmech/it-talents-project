import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../GoogleAuth.dart';




class ReservationScreen extends StatefulWidget {
  ReservationScreen({Key key}) : super(key: key);


  @override
  _ReservationScreen createState() => _ReservationScreen();
}

class _ReservationScreen extends State<ReservationScreen> {
  final snackBar = SnackBar(content: Text('Message envoyé avec succes'),backgroundColor: Colors.green,);
  int group =1;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController() ;
  var emailController = TextEditingController();
  var telephoneController = TextEditingController() ;
  var societyController = TextEditingController() ;
  var numberController = TextEditingController() ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height:24.0),
                      Image.asset('images/2.png',
                      height: 220
                      ),]
                  ),
                ),
              ],
            ),
            Text(
              'Inscrivez-vous maintenant!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text('',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                      [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value:1,
                                groupValue:  group ,
                                onChanged: (T)
                                {
                                  setState((){
                                    group =T;
                                  }) ;
                                },

                              ),
                              Text('Professionel'),

                            ],

                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [

                              Radio(
                                value:2,
                                groupValue:group,
                                onChanged:   (T)
                                {
                                  setState((){
                                    group =T;
                                  }) ;
                                },
                              ), Text('Particulier'),

                            ],
                          ),
                        ),
                      ],
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextFormField(
                        controller: nameController,
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
                          hintText: 'Nom Complet',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400
                          ),
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
                        controller: emailController,
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
                        controller: telephoneController,
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
                          hintText: 'Numéro de téléphone',
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
                        controller: societyController,
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
                          hintText: "Nom de l'entreprise",
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
                        controller: numberController,
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
                          hintText: "Nombre d'inscrits",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                   ,
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
                            sendEmail(society: societyController.text,name: nameController.text,tel:telephoneController.text,number: numberController.text).then((value) {ScaffoldMessenger.of(context).showSnackBar(snackBar);} ).catchError((error){print(error.toString());});
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
  Future sendEmail({String society,String name,String tel,String number}) async {
    GoogleAuthApi.signOut();
    final user = await GoogleAuthApi.signIn() ;
    if(user==null) return ;
    final email =user.email;
    final auth = await user.authentication;
    final token=auth.accessToken;
    final smtpServer = gmailSaslXoauth2(email, token);
    society = society == null? '':society;



    final message = Message()
      ..from = Address(email,user.displayName)
      ..recipients.add('ik_mehar@esi.dz')

      ..subject ='Inscription'
      ..text = "Nom Complet :${name}\nSocieté :${society}\nNuméro de téléphone :${tel}\nNombres d'inscrits :${number}";



    await send(message,smtpServer) ;



  }
}
