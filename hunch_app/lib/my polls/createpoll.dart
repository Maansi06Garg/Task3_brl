// import 'package:flutter/material.dart';

// class CreatePollPage extends StatefulWidget {
//   @override
//   _CreatePollPageState createState() => _CreatePollPageState();
// }

// class _CreatePollPageState extends State<CreatePollPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Poll'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Add UI elements for creating a poll, including text fields for question and options.
//             // You can use TextFormFields or other widgets to collect user input.
//             // For example:
//             const TextField(
//               decoration: InputDecoration(labelText: 'Poll Question'),
//             ),
//             const TextField(
//               decoration: InputDecoration(labelText: 'Option 1'),
//             ),
//             const TextField(
//               decoration: InputDecoration(labelText: 'Option 2'),
//             ),
//             const TextField(
//               decoration: InputDecoration(labelText: 'Option 3'),
//             ),
//             // Add more option text fields as needed.

//             // Add a button to submit the poll to Firestore.
//             ElevatedButton(
//               onPressed: () {
//                 // Implement code to save the poll to Firestore.
//                 // You'll need to use Firestore to save the poll question and options.
//               },
//               child: const Text('Create Poll'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class PollingApp extends StatefulWidget {
//   @override
//   _PollingAppState createState() => _PollingAppState();
// }

// class _PollingAppState extends State<PollingApp> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Polling App'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CreatePollPage()),
//               );
//             },
//             child: Text('Create Poll'),
//           ),
//           PollList(),
//         ],
//       ),
//     );
//   }
// }

// class PollList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('polls').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const CircularProgressIndicator();
//         }
//         final polls = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: polls.length,
//           itemBuilder: (context, index) {
//             final pollData = polls[index].data() as Map<String, dynamic>;
//             return ListTile(
//               title: Text(pollData['question']),
//               subtitle: Text('Options: ${pollData['options'].length}'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PollDetails(pollData),
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }


class PollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('polls').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final polls = snapshot.data!.docs;

        return ListView.builder(
          itemCount: polls.length,
          itemBuilder: (context, index) {
            final pollData = polls[index].data() as Map<String, dynamic>;
            final optionsLength = pollData['options']?.length ?? 0;

            return ListTile(
              title: Text(pollData['question']),
              subtitle: Text('Options: $optionsLength'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PollDetails(pollData),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}


class CreatePollPage extends StatefulWidget {
  @override
  _CreatePollPageState createState() => _CreatePollPageState();
}

class _CreatePollPageState extends State<CreatePollPage> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController optionController = TextEditingController();
  final List<String> options = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Poll'),
      ),
      body: Column(
        children: [
          TextField(
            controller: questionController,
            decoration: const InputDecoration(labelText: 'Poll Question'),
          ),
          TextField(
            controller: optionController,
            decoration: const InputDecoration(labelText: 'Option'),
          ),
          ElevatedButton(
            onPressed: () {
              if (optionController.text.isNotEmpty) {
                options.add(optionController.text);
                optionController.clear();
                setState(() {}); 
              }
            },
            child: const Text('Add Option'),
          ),
          ElevatedButton(
            onPressed: createPoll,
            child: const Text('Create Poll'),
          ),
          Text('Options: $options'),
        ],
      ),
    );
  }

  void createPoll() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;

      
      final pollDoc = await FirebaseFirestore.instance.collection('polls').add({
        'userId': userId,
        'question': questionController.text,
        'options': options,
      });

      Navigator.pop(context); 
    }
  }
}

// class PollDetails extends StatelessWidget {
//   final Map<String, dynamic> pollData;

//   PollDetails(this.pollData);

//   @override
//   Widget build(BuildContext context) {
//     // Implement UI to display poll details and handle voting
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Poll Details'),
//       ),
//       body: Column(
//         children: [
//           Text(pollData['question']),
//           // Display options and handle voting
//           // Implement the logic for voting and updating Firestore
//         ],
//       ),
//     );
//   }
// }





class PollDetails extends StatefulWidget {
  final Map<String, dynamic> pollData;

  PollDetails(this.pollData);

  @override
  _PollDetailsState createState() => _PollDetailsState();
}

class _PollDetailsState extends State<PollDetails> {
  String? selectedOption;
  int totalVotes = 0;
  String userId = "tdf0aAuP4aWAFjRaKnR5SrgduBx1"; // Replace with the actual user ID
  bool hasVoted = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getTotalVotes() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('polls')
        .doc(widget.pollData['documentID'])
        .collection('votes')
        .get();

    int total = 0;
    snapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final votes = data['votes'] ?? 0;

      if (votes is int) {
        total += votes;
      } else if (votes is double) {
        total += votes.toInt();
      }
    });

    setState(() {
      totalVotes = total;
    });
  }

  Future<void> submitVote() async {
    if (selectedOption != null && userId != null && !hasVoted) {
      // Check if the user has already voted
      QuerySnapshot userVoteSnapshot = await FirebaseFirestore.instance
          .collection('polls')
          .doc(widget.pollData['documentID'])
          .collection('votes')
          .where('userId', isEqualTo: userId)
          .get();

      if (userVoteSnapshot.docs.isEmpty) {
        // User hasn't voted yet, allow them to vote
        await FirebaseFirestore.instance
            .collection('polls')
            .doc(widget.pollData['documentID'])
            .collection('votes')
            .add({
          'option': selectedOption,
          'votes': 1,
          'userId': userId,
        });

        setState(() {
          totalVotes++;
          hasVoted = true;
        });
      } else {
        // User has already voted
        // You can show an error message or handle this case as needed
        print('User has already voted for this poll.');
      }
    } else {
      // Handle the case where userId is null or selectedOption is empty
      print('Error: userId is null, selectedOption is empty, or user has already voted.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poll Details'),
      ),
      body: Column(
        children: [
          Text(
            widget.pollData['question'],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: widget.pollData['options'].map<Widget>((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: hasVoted
                    ? null
                    : (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              submitVote();
            },
            child: const Text('Submit Vote'),
          ),
          const SizedBox(height: 10),
          Text('Total Votes: $totalVotes'),
        ],
      ),
    );
  }
}




// class PollDetails extends StatefulWidget {
//   final Map<String, dynamic> pollData;

//   PollDetails(this.pollData);

//   @override
//   _PollDetailsState createState() => _PollDetailsState();
// }

// class _PollDetailsState extends State<PollDetails> {
//   String selectedOption = ''; 
//   int totalVotes = 0;

//   @override
//   void initState() {
//     super.initState();
    
//   }

//   Future<void> getTotalVotes() async {
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('polls')
//         .doc(widget.pollData['documentID']) 
//         .collection('votes')
//         .get();

//     // int total = 0;
//     // snapshot.docs.forEach((doc) {
//     //  final data = doc.data() as Map<String, dynamic>; 
//     //  total += (data['votes'] ?? 0).toInt();
//     // });
//     int total = 0;
//     snapshot.docs.forEach((doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     final votes = data['votes'] ?? 0;

//   if (votes is int) {
//     total += votes; 
//   } else if (votes is double) {
//     total += votes.toInt(); 
//   }
// });

//     setState(() {
//       totalVotes = total;
//     });
//   }

//   Future<void> submitVote() async {
//     if (selectedOption.isNotEmpty) {
     
//       await FirebaseFirestore.instance
//           .collection('polls')
//           .doc(widget.pollData['documentID']) 
//           .collection('votes')
//           .add({
//         'option': selectedOption,
//         'votes': 1,
//       });

     
//       setState(() {
//         totalVotes++;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Poll Details'),
//       ),
//       body: Column(
//         children: [
//           Text(
//             widget.pollData['question'],
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Column(
//             children: widget.pollData['options'].map<Widget>((option) {
//               return RadioListTile<String>(
//                 title: Text(option),
//                 value: option,
//                 groupValue: selectedOption,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedOption = value!;
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               submitVote(); 
//             },
//             child: const Text('Submit Vote'),
//           ),
//           const SizedBox(height: 10),
//           Text('Total Votes: $totalVotes'),
//         ],
//       ),
//     );
//   }
// }




// class PollDetails extends StatefulWidget {
//   final Map<String, dynamic> pollData;

//   PollDetails(this.pollData);

//   @override
//   _PollDetailsState createState() => _PollDetailsState();
// }

// class _PollDetailsState extends State<PollDetails> {
//   String selectedOption = '';
//   int totalVotes = 0;
//   String userId = "tdf0aAuP4aWAFjRaKnR5SrgduBx1"; 

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> getTotalVotes() async {
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('polls')
//         .doc(widget.pollData['documentID'])
//         .collection('votes')
//         .get();

//     int total = 0;
//     snapshot.docs.forEach((doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       final votes = data['votes'] ?? 0;

//       if (votes is int) {
//         total += votes;
//       } else if (votes is double) {
//         total += votes.toInt();
//       }
//     });

//     setState(() {
//       totalVotes = total;
//     });
//   }

//   // Future<void> submitVote() async {
//   //   if (selectedOption.isNotEmpty) {
//   //     // Check if the user has already voted
//   //     QuerySnapshot userVoteSnapshot = await FirebaseFirestore.instance
//   //         .collection('polls')
//   //         .doc(widget.pollData['documentID'])
//   //         .collection('votes')
//   //         .where('tdf0aAuP4aWAFjRaKnR5SrgduBx1', isEqualTo: userId)
//   //         .get();

//   //     if (userVoteSnapshot.docs.isEmpty) {
//   //       // User hasn't voted yet, allow them to vote
//   //       await FirebaseFirestore.instance
//   //           .collection('polls')
//   //           .doc(widget.pollData['documentID'])
//   //           .collection('votes')
//   //           .add({
//   //         'option': selectedOption,
//   //         'votes': 1,
//   //         'userId': userId,
//   //       });

//   //       setState(() {
//   //         totalVotes++;
//   //       });
//   //     } else {
//   //       // User has already voted
//   //       // You can show an error message or handle this case as needed
//   //       print('User has already voted for this poll.');
//   //     }
//   //   }
//   // }
// Future<void> submitVote() async {
//   if (selectedOption.isNotEmpty && userId != null) {
//     // Check if the user has already voted
//     QuerySnapshot userVoteSnapshot = await FirebaseFirestore.instance
//         .collection('polls')
//         .doc(widget.pollData['documentID'])
//         .collection('votes')
//         .where('userId', isEqualTo: userId)
//         .get();

//     if (userVoteSnapshot.docs.isEmpty) {
//       // User hasn't voted yet, allow them to vote
//       await FirebaseFirestore.instance
//           .collection('polls')
//           .doc(widget.pollData['documentID'])
//           .collection('votes')
//           .add({
//         'option': selectedOption,
//         'votes': 1,
//         'userId': userId,
//       });

//       setState(() {
//         totalVotes++;
//       });
//     } else {
//       // User has already voted
//       // You can show an error message or handle this case as needed
//       print('User has already voted for this poll.');
//     }
//   } else {
//     // Handle the case where userId is null or selectedOption is empty
//     print('Error: userId is null or selectedOption is empty.');
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Poll Details'),
//       ),
//       body: Column(
//         children: [
//           Text(
//             widget.pollData['question'],
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Column(
//             children: widget.pollData['options'].map<Widget>((option) {
//               return RadioListTile<String>(
//                 title: Text(option),
//                 value: option,
//                 groupValue: selectedOption,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedOption = value!;
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               submitVote();
//             },
//             child: const Text('Submit Vote'),
//           ),
//           const SizedBox(height: 10),
//           Text('Total Votes: $totalVotes'),
//         ],
//       ),
//     );
//   }
// }
