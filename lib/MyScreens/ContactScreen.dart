import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../GoogleAuth.dart';
import '../components.dart';




class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);


  @override
  _ContactScreen createState() => _ContactScreen();
}

class _ContactScreen extends State<ContactScreen> {
  final snackBar = SnackBar(content: Text('Message envoyé avec succes'),backgroundColor: Colors.green,);
 var nameController = TextEditingController() ;
 var emailController = TextEditingController() ;
 var societyController = TextEditingController() ;
 var objectController = TextEditingController() ;
 var messageController = TextEditingController() ;
  int group =1;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('images/2.png',
                height: 220
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row
                (
                  children : [
                    Expanded(
                      child: InkWell(
                        onTap: ()
                        {
                        makingPhoneCall() ;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children:[
                                Icon(Icons.phone,color:Colors.blueAccent,),
                                Text('Téléphone',  style: TextStyle(
                                  color:Colors.blueAccent,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                              mainAxisAlignment:MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:15.0),
                    Expanded(
                      child: InkWell(

                        onTap: ()
                        {
                     launchEmail();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children:[
                                Icon(Icons.mail,color:Colors.blueAccent,),
                                Text('Email',  style: TextStyle(
                                  color:Colors.blueAccent,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                                       ],
                              mainAxisAlignment:MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:15.0),
                    Expanded(
                      child: InkWell(
                        onTap: ()
                        {

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children:[
                                Icon(Icons.contact_phone_rounded,color:Colors.blueAccent,),
                                Text('Fax',  style: TextStyle(
                                  color:Colors.blueAccent,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                              mainAxisAlignment:MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),

            Text(
              'Contactez-nous',
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
                        controller: societyController,

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
                        controller: objectController,
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
                          hintText: 'Objet de votre message',
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
                        controller: messageController,

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
                                    side: BorderSide(color: Colors.blueAccent)
                                )
                            ),
                          ),





                          onPressed: () {
                            if (formKey.currentState.validate())
                            {
                              sendEmail(society: societyController.text,mess: messageController.text,object: objectController.text,name: nameController.text).then((value) {ScaffoldMessenger.of(context).showSnackBar(snackBar);} ).catchError((error){print(error.toString());});
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
 Future sendEmail({String society,String mess,String name,String object,}) async {
   GoogleAuthApi.signOut();
   final user = await GoogleAuthApi.signIn() ;
   if(user==null) return ;
   final email =user.email;
   final auth = await user.authentication;
   final token=auth.accessToken;
   final smtpServer = gmailSaslXoauth2(email, token);
   society = society == null? '':society;
   mess = mess == null? '':mess;


   final message = Message()
     ..from = Address(email,user.displayName)
     ..recipients.add('ik_mehar@esi.dz')

     ..subject =object
     ..text = 'Nom Complet :${name}\nSocieté :  ${society}  \n\n${mess} ';



   await send(message,smtpServer) ;



 }
}
