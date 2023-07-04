import 'package:bloodfirebaseapp/project/add_user.dart';
import 'package:bloodfirebaseapp/project/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp( MyApp());
}

// void main(){
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routes: {
        '/':(context) => HomePage(),
        '/add':(context) => AddUser(),
      },
      initialRoute: '/',
    );
  }
}


  