import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference dbname=FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation App'),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: (){
        Navigator.pushNamed(context, '/add');
      }, 
      backgroundColor: Colors.red,
      label: Icon(Icons.add,size: 40,)
      // Text('Add User'),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: StreamBuilder(
      stream: dbname.snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
         return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,index){
            final DocumentSnapshot donorSnap=snapshot.data.docs[index];
            // return Text(donorSnap['name']);
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20),
                   boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 194, 193, 193),
                      blurRadius:10 ,
                      spreadRadius: 15,
                    )
                   ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red,
                          child:Text(donorSnap['group'],
                          style: TextStyle(fontSize: 25),)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Text(donorSnap['name'],
                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       Text(donorSnap['phone'].toString(),
                       style: TextStyle(fontSize: 18),)
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: (){},
                         icon: Icon(Icons.edit),
                         iconSize: 30,
                         color: Colors.blue,),
                        IconButton(onPressed: (){},
                         icon: Icon(Icons.delete),
                         iconSize: 30,
                         color: Colors.red,),
            
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        }
        return Container();

    }),
    );
  }
}