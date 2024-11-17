import 'package:flutter/material.dart';
class ListTest2 extends StatefulWidget {
  const ListTest2({super.key});

  @override
  State<ListTest2> createState() => _ListTest2State();
}

class _ListTest2State extends State<ListTest2> {
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  TextEditingController c=TextEditingController();
  TextEditingController d=TextEditingController();
  TextEditingController e=TextEditingController();
  TextEditingController f=TextEditingController();
  List q=[];


  bool _show=false;
  void check()
  {
    setState(() {
      _show=a.text.isNotEmpty&&a.text.isNotEmpty&&b.text.isNotEmpty&&b.text.isNotEmpty&&c.text.isNotEmpty&&c.text.isNotEmpty;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Test 2"),
      ),
      body: Column(
        children: [
          Column(children: [


            Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  border:Border.all()
              ),
              child: TextFormField(
                  controller: a,
                  decoration: InputDecoration(
                    hintText: "Enter name",
                  ),
                  // validator: (user) {
                  //   if (user == null || user.isEmpty) {
                  //      p1=true;
                  //
                  //   };
                  // }
                  onChanged: (a){
                    check();
                  }
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  border:Border.all()
              ),
              child: TextFormField(
                  controller: b,
                  decoration: InputDecoration(
                    hintText: "Enter E-Mail",
                  ),
                  // validator: (user) {
                  //   if (user == null || user.isEmpty) {
                  //     p2=true;
                  //
                  //   };
                  onChanged: (b){
                    check();
                  }

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  border:Border.all()
              ),
              child: TextFormField(
                  controller: c,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                  ),
                  onChanged: (c){
                    check();
                  }

              ),
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: _show,
              child: ElevatedButton(onPressed: (){

                setState(() {
                  q.add({
                    "data1":a.text,//key,value
                    "data2":b.text,
                    "data3":c.text
                  });
                });
                a.clear();
                b.clear();
                c.clear();
              }, child: Text("OK")),
            ),

            Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                child: ListView.builder(
                    itemCount: q.length,
                    itemBuilder: (BuildContext context,int index)
                    {
                      return Container(
                          height: 600,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all()
                          ),
                          child: ListView.builder(
                              itemCount: q.length,
                              itemBuilder: (BuildContext context,int index)
                              {
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(context: context, builder: (BuildContext context)
                                    {
                                      d.text=q[index]["data1"];
                                      e.text=q[index]["data2"];
                                      f.text=q[index]["data3"];

                                      return AlertDialog(
                                        title: Column(
                                          children: [
                                            TextFormField(
                                              //a.text=(q[index][0]);
                                              controller: d,
                                              decoration: InputDecoration(

                                              ),

                                            ),
                                            TextFormField(
                                              controller: e,
                                            ),
                                            TextFormField(
                                              controller: f,
                                            ),
                                            ElevatedButton(onPressed: (){
                                              setState(() {
                                                if(d.text.isNotEmpty&&e.text.isNotEmpty&&f.text.isNotEmpty)
                                                {
                                                  q[index]["data1"]=d.text.toString();
                                                  q[index]["data2"]=e.text.toString();
                                                  q[index]["data3"]=f.text.toString();

                                                }
                                              });
                                              Navigator.of(context).pop();
                                            }, child: Text("Update")
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(q[index]["data1"].toString(),style: TextStyle(fontSize: 20),),
                                      Text(q[index]["data2"].toString(),style: TextStyle(fontSize: 20),),
                                      Text(q[index]["data3"].toString(),style: TextStyle(fontSize: 20),),
                                    ],
                                  ),
                                );
                              })


                      );
                    })

            ),
          ],)
        ],
      ),




    );
    //     ],
    //   ),
    // );
  }
}

