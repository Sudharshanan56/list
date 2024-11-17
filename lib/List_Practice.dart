import 'package:flutter/material.dart';

class ListTest extends StatefulWidget {
  const ListTest({super.key});

  @override
  State<ListTest> createState() => _ListTestState();
}

class _ListTestState extends State<ListTest> {
  List<int> x = [];
  int m = 0;
  int MAX = 0;
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();

  void push() {
    setState(() {
      if (a.text.isNotEmpty) {
        x.add(int.parse(a.text));
        b.text = x.toString();
      }
    });
  }

  void Min() {
    if (x.isNotEmpty) {
      setState(() {
        m = x.reduce((a, b) => a < b ? a : b);
      });
    }
  }

  void Max() {
    if (x.isNotEmpty) {
      setState(() {
        MAX = x.reduce((a, b) => a > b ? a : b);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            " List Operations",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Input Section
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: a,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter a number",
                          border: OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.edit, color: Colors.deepPurple),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          push();
                          a.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        ),
                        child: const Text(
                          "Add to List",
                          style: TextStyle(fontSize: 18,color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Button Section
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: Min,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text("Find Min",style: TextStyle(color: Colors.white),),
                          ),
                          ElevatedButton(
                            onPressed: Max,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text("Find Max",style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              x.sort();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Sorted in Ascending",style: TextStyle(color: Colors.white),),
                                  content: Text(x.toString()),
                                ),
                              );
                            },
                            child: const Text("Sort ASC"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              x.sort((a, b) => b.compareTo(a));
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                    child: Text(
                                      x.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: const Text("Sort DESC"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Display List Section
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: x.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          x[index].toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Update Number"),
                                content: TextFormField(
                                  controller: c,
                                  decoration: const InputDecoration(hintText: "New Value"),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (c.text.isNotEmpty) {
                                          x[index] = int.parse(c.text);
                                          c.clear();
                                        }
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Update"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Min and Max Display
              Text(
                "Minimum: $m",
                style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Maximum: $MAX",
                style: const TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
