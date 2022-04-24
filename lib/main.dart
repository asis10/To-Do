import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ToDo App",
    home: todoapp(),
  ));
}
class todoapp extends StatefulWidget {
  const todoapp({ Key? key }) : super(key: key);

  @override
  State<todoapp> createState() => _todoappState();
}

class _todoappState extends State<todoapp> {
  String value ="";
  var listToDo = [''];
  addToDo(String item)
  {
    setState(() {
      listToDo.add(item);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("ToDo App"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          addToDo(value);
        } ,
      ),
      body: 
      ListView.builder(
        itemCount: listToDo.length,
        itemBuilder: (context,index){
        return index==0? Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "add item"
            ),
            onChanged: (val){
              value = val;
            },
          ),
        ) : ListTile(
        leading: Icon(Icons.circle),
        title: Text('${listToDo[index]}',style: TextStyle(fontSize: 20),),
       ); 
      })

      
      
      // ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(30.0),
      //       child: TextFormField(),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.circle),
      //       title: Text('Get Up'),
      //     ),
      //      ListTile(
      //       leading: Icon(Icons.circle),
      //       title: Text('Code'),
      //     ),
      //      ListTile(
      //       leading: Icon(Icons.circle),
      //       title: Text('Sleep'),
      //     )

      //   ],
      // ),      
    );
  }
}