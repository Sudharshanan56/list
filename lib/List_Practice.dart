import 'dart:math';
import 'package:flutter/material.dart';

class ListTest extends StatefulWidget {
  const ListTest({super.key});

  @override
  State<ListTest> createState() => _ListTestState();
}

class _ListTestState extends State<ListTest> {
  List<int> x = []; // List of integers
  int m = 0; // To hold the minimum value
  int MAX = 0; // To hold the maximum value
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();


  void push() {
    // var tt=x.sort();
    setState(() {
      if (a.text.isNotEmpty) {
        x.add(int.parse(a.text)); // Parse string input to integer
        b.text = x.toString(); // Display the list in text field b
      }
    });
  }

  void Min() {
    if (x.isNotEmpty) {
      setState(() {
        m = x.reduce((a, b) => a < b ? a : b); // Find minimum
      });
    }
  }

  void Max() {
    if (x.isNotEmpty) {
      setState(() {
        MAX = x.reduce((a, b) => a > b ? a : b); // Find maximum
      });
    }
  }

  void ASC() {
    var t = x.sort();
    setState(() {
      x.sort(); // Sort the list in ascending order
    });
  }

  void DESC() {
    setState(() {
      x.sort((a, b) => b.compareTo(a)); // Sort the list in descending order
    });
  }

  // void dispose()
  // {
  //   a.clear();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "LIST",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          // TextFormField
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: TextFormField(
              controller: a,
              keyboardType:
              TextInputType.number, // Ensure only numbers can be input
              decoration: const InputDecoration(hintText: "Enter value..."),
            ),
          ),
          const SizedBox(height: 20),

          // OK button
          Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      push();
                      // dispose();
                      a.clear();
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),

                  // Min button
                  ElevatedButton(
                    onPressed: () {
                      Min();
                    },
                    child: const Text("MIN"),
                  ),

                  // Max button
                  ElevatedButton(
                    onPressed: () {
                      Max();
                    },
                    child: const Text("MAX"),
                  ),
                ],
              ),

              // Ascending sort button

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          // int f = 10;
                          x.sort();
                          return AlertDialog(
                            title: Text('$x'),
                            // content: const Text('AlertDialog description'),

                          );
                        },
                      );
                    },
                    child: const Text("ASC: "),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          x.sort((a, b) => b.compareTo(a));
                          return Container(
                            height: 200,
                            color: Colors.amber,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '$x',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  // ElevatedButton(
                                  //   child: const Text(''),
                                  //   onPressed: () => Navigator.pop(context),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      // DESC();
                    },
                    child: const Text("DESC: "),
                  ),
                  ElevatedButton(onPressed: (){
                    showDialog(context: context, builder: (BuildContext context)
                    {
                      x.sort();
                      List<int> numbersLessThan5 = x.where((number) => number < 5).toList();
                      return AlertDialog(
                        title: Text("$numbersLessThan5"),
                      );
                    }
                    );
                  }, child: Text("<5")),

                  ElevatedButton(onPressed: (){
                    showModalBottomSheet(context:  context, builder: (BuildContext context)
                    {
                      x.sort();
                      List<int> numbersGreaterThan5 = x.where((number) => number > 5).toList();
                      return Container(
                        height: 200,
                        width: 400,
                        color: Colors.red,
                        child: Column(
                          children: [
                            Text("$numbersGreaterThan5")
                          ],
                        ),
                      );
                    },);
                  }, child: Text(">5")),
                ],
              ),
            ],
          ),


          // Display list
          SizedBox(height: 29,),
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: ListView.builder(
              itemCount: x.length,
              itemBuilder: (context, index) {
                return TextButton(onPressed: (){
                  showDialog(context: context, builder: (BuildContext context)
                  {
                    return AlertDialog(

                      title: TextFormField(
                        controller: c,
                      ),
                      actions: [ElevatedButton(onPressed: (){
                        // Text(c.text);
                        // x.insert(1,int.parse(c.text));
                        setState(() {
                          if (c.text.isNotEmpty) {
                            x[index] =
                                int.parse(c.text);
                            c.clear();
                          }
                        },
                        );

                      }, child: Text("UPDATE"))],


                    );
                  },);

                }, child:  Text(x[index].toString()));
                // ListTile(
                //   title:
                // Text(x[index].toString(),),
                // );
              },
            ),
          ),
          SizedBox(height: 29,),




          // Display minimum, maximum, and sorted list
          Text(
            "Minimum: $m",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "Maximum: $MAX",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}