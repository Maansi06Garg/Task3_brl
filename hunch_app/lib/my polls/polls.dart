// // import 'package:flutter/material.dart';

// // class Mypoll extends StatefulWidget {
// //   const Mypoll({super.key});

// //   @override
// //   State<Mypoll> createState() => _MypollState();
// // }

// // class _MypollState extends State<Mypoll> {
// //   List<String> options = ['Option 1', 'Option 2'];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Polling App'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: options.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(options[index]),
// //                 );
// //               },
// //             ),
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: <Widget>[
// //               IconButton(
// //                 icon: const Icon(Icons.add),
// //                 onPressed: () {

// //                   setState(() {
// //                     options.add('Option ${options.length + 1}');
// //                   });
// //                 },
// //               ),
// //               // RaisedButton(
// //               //   onPressed: () {
// //               //     print('Poll Submitted: $options');
// //               //   },
// //               //   child: Text('Submit Poll'),
// //               // ),

// //               ElevatedButton(
// //                 onPressed: () {
// //                   print('Poll Submitted: $options');
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   primary: Colors.blue,
// //                   onPrimary: Colors.white,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8.0),
// //                   ),
// //                 ),
// //                 child: const Text('Submit Poll'),
// //               )
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_polls/flutter_polls.dart';

// class Mypoll extends StatelessWidget {
//   const Mypoll({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   backgroundColor: Colors.transparent,
//       //   foregroundColor: Colors.black,
//       //   // title: const Center(
//       //   //   child: Text(
//       //   //     'Hunch Polls',
//       //   //     style: TextStyle(
//       //   //       color: Colors.black,
//       //   //       fontSize: 25,
//       //   //       fontWeight: FontWeight.bold,
//       //   //     ),
//       //   //   ),
//       //   // ),
//       // ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Create a Poll',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),


//           FlutterPolls(
              
//           )



















//     //       Padding(
//     //         padding: const EdgeInsets.all(20.0),
//     //         child: TextField(
//     //           decoration: InputDecoration(
//     //             enabledBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             focusedBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             hintText: 'Enter your question',
//     //             fillColor: Colors.grey[200],
//     //             filled: true,
//     //           ),
//     //         ),
//     //       ),
//     //       const SizedBox(
//     //         height: 20,
//     //       ),
//     //       Padding(
//     //         padding: const EdgeInsets.all(20.0),
//     //         child: TextField(
//     //           decoration: InputDecoration(
//     //             enabledBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             focusedBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             hintText: 'Option 1',
//     //             fillColor: Colors.grey[200],
//     //             filled: true,
//     //           ),
//     //         ),
//     //       ),
//     //       const SizedBox(
//     //         height: 20,
//     //       ),
//     //       Padding(
//     //         padding: const EdgeInsets.all(20.0),
//     //         child: TextField(
//     //           decoration: InputDecoration(
//     //             enabledBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             focusedBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             hintText: 'Option 2',
//     //             fillColor: Colors.grey[200],
//     //             filled: true,
//     //           ),
//     //         ),
//     //       ),
//     //       const SizedBox(
//     //         height: 20,
//     //       ),
//     //       Padding(
//     //         padding: const EdgeInsets.all(20.0),
//     //         child: TextField(
//     //           decoration: InputDecoration(
//     //             enabledBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             focusedBorder: OutlineInputBorder(
//     //               borderSide: const BorderSide(color: Colors.deepPurpleAccent),
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             hintText: 'Option 3',
//     //             fillColor: Colors.grey[200],
//     //             filled: true,


//     //   ),
//     // ),)
//     ],),);
        
//   }
// }

 // hasVoted: hasVoted.value,
                // userVotedOptionId: userVotedOptionId.value,

// import 'package:flutter/material.dart';
// import 'package:flutter_polls/flutter_polls.dart';

// class MyPoll extends StatefulWidget {
//   @override
//   _MyPollState createState() => _MyPollState();
// }

// class _MyPollState extends State<MyPoll> {
//   Map<String, dynamic> poll = {
//     'title': 'Sample Poll',
//     'options': [
//       {'id': '1', 'title': 'Option A', 'votes': 0},
//       {'id': '2', 'title': 'Option B', 'votes': 0},
//       {'id': '3', 'title': 'Option C', 'votes': 0},
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);

//     List<PollOption> pollOptions = poll['options'].map((option) {
//       return PollOption(
//         id: option['id'],
//         title: Text(
//           option['title'],
//           style: TextStyle(
//             fontSize: 20,
//           ),
//         ),
//         votes: option['votes'],
//       );
//     }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Polling App'),
//       ),
//       body: Center(
//         child: FlutterPolls(
//           pollId: '1',
//           onVoted: (PollOption pollOption, int newTotalVotes) {
//             print('Voted: ${pollOption.id}');
//             return Future.value(true);
//           },
//           pollOptions: pollOptions, // Use the correct property name
//           votedProgressColor: Colors.grey.withOpacity(0.3),
//           votedBackgroundColor: Colors.grey.withOpacity(0.2),
//           votesTextStyle: themeData.textTheme.subtitle1,
//           votedPercentageTextStyle: themeData.textTheme.headline4?.copyWith(
//             color: Colors.black,
//           ),
//           votedCheckmark: const Icon(
//             Icons.check_circle,
//             color: Colors.black,
//             size: 18,
//           ),
//           pollTitle: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               poll['title'],
//               style: const TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           metaWidget: const Row(
//             children: [
//               SizedBox(width: 6),
//               Text(
//                 '•',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(width: 6),
//               Text(
//                 '2 weeks left',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:hunch_app/my%20polls/pollsclass.dart';

class MyPoll extends StatefulWidget {
  const MyPoll({Key? key}) : super(key: key);

  @override
  State<MyPoll> createState() => _MyPollState();
}

class _MyPollState extends State<MyPoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: polls().length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> poll = polls()[index];

            final int days = DateTime(
              poll['end_date'].year,
              poll['end_date'].month,
              poll['end_date'].day,
            )
                .difference(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ))
                .inDays;

            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: FlutterPolls(
                votedProgressColor: Colors.grey.withOpacity(0.3),
                votedBackgroundColor: const Color.fromARGB(255, 193, 192, 192).withOpacity(0.5),
                votesTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                // votedPercentageTextStyle: const TextStyle(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w600,
                // ),

                votedCheckmark: const Icon(
                  Icons.check_circle,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 18,
                ),
                pollOptionsFillColor: Colors.grey,
                voteInProgressColor: Colors.grey,
                pollOptionsSplashColor: Colors.grey,
                leadingVotedProgessColor:Color.fromARGB(255, 238, 186, 123),
                
                pollId: poll['id'].toString(),
               
                onVoted: (PollOption pollOption, int newTotalVotes) async {
                  await Future.delayed(const Duration(seconds: 1));
                  return true;
                },
                pollEnded: days < 0,
                pollTitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    poll['question'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                pollOptions: List<PollOption>.from(
                  poll['options'].map(
                    (option) {
                      var a = PollOption(
                        id: option['id'].toString(),
                        title: Text(
                          option['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            //color: Colors.white,
                          ),
                        ),
                        votes: option['votes'],
                      );
                      return a;
                    },
                  ),
                ),
                votedPercentageTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  
                ),
                metaWidget: Row(
                  children: [
                    const SizedBox(width: 6),
                    const Text(
                      '•',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      days < 0 ? "ended" : "ends $days days",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}