import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Ctasks {
  final int ctaskId;
  final String title;
  final String duedate;
  final String time;
  final String workDetails;
  final String workType;

  Ctasks({
    required this.ctaskId,
    required this.title,
    required this.duedate,
    required this.time,
    required this.workDetails,
    required this.workType,
  });

  // //List of Plants data
  // static List<Ctasks> cTasksList = [
  //   Ctasks(
  //       ctaskId: 0,
  //       title: 'Submit Project Proposal',
  //       duedate: '20 June',
  //       time: '',
  //       workDetails: '',
  //       workType:''),
  //   Ctasks(
  //       ctaskId: 1,
  //       title: 'Mobile App Design',
  //       duedate: '21 March',
  //       time: '',
  //       workDetails: '',
  //       workType:''),
  //   Ctasks(
  //       ctaskId: 2,
  //       title: 'Submit Project Proposal',
  //       duedate: 'Beach Daisy',
  //       time: '',
  //       workDetails:'',
  //       workType:''),
  //   Ctasks(
  //       ctaskId: 3,
  //       title: 'Mobile App Design',
  //       duedate: 'Big Bluestem',
  //       time: '',
  //       workDetails:'',
  //       workType:''),
  // ];

  static Future<List<Ctasks>> getTasksFromFirestore() async {
    List<Ctasks> cTasksList = [];
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('tasks${user?.uid}')
          .get();

      querySnapshot.docs.forEach((doc) {
        cTasksList.add(Ctasks(
            ctaskId: doc['taskIndex'].toInt(),
            title: doc['taskTitle'],
            duedate: doc['date'],
            time: doc['time'],
            workDetails:doc['workDetails'],
            workType:doc['workType'] ));
      });

      print('Claims retrieved successfully: $cTasksList'); // Add a debug print statement
      return cTasksList;
    } catch (error) {
      print('Error retrieving claims: $error'); // Log the error
      return []; // Return an empty list if there's an error
    }
  }
}
