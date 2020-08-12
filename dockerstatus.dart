
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;






class DockerStatus extends StatefulWidget {
  @override
  _DockerStatusState createState() => _DockerStatusState();
}

class _DockerStatusState extends State<DockerStatus> {
  

String cmd;
String cmd1;
var webdata;
var webdata1;
var webdata2;



  web() async {
  var url= 'http://192.168.43.230/cgi-bin/docker.py';
  var response = await http.get(url);
  setState(() {
    webdata = response.body;

  });
  print(webdata);

}

web1(name) async {
  var url= 'http://192.168.43.230/cgi-bin/docker1.py?x=$name';
  var response = await http.get(url);
  setState(() {
    webdata1 = response.body;

  });
  print(webdata1);
}
web2(name) async {
  var url= 'http://192.168.43.230/cgi-bin/docker2.py?x=$name';
  var response = await http.get(url);
  setState(() {
    webdata2 = response.body;

  });
  print(webdata2);
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        
        title: Text(
          'status of docker',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Column(
          
          children: <Widget>[
            Text("To see the list of docker container",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,

            ),
            ),
           SizedBox(width: 10,height: 15,),

             FlatButton(
              onPressed: () { 
                web();
                },
              child: Text("click here",
              style: TextStyle(
                fontSize: 20,
              ),
              ),


            ),
            SizedBox(width: 10,height: 40,),

            Text(webdata ?? "output is coming .."),
            Container(
            
            ),
            
            SizedBox(width: 20,height: 60,),
            Text("To start a container",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,

            ),
            ),
            SizedBox(width: 10,height: 20,),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter the container name or id"
              ),
              onChanged: (value) {
                cmd = value;

              },
              

            ),
            FlatButton(
              onPressed: () { 
                web1(cmd);
                },
              child: Text("click here",
              style: TextStyle(
                fontSize: 20,
                
              ),),

            ),
            
            SizedBox(width: 20,height: 60,),
            Text("To stop a container",
            style: TextStyle(
              fontSize: 20,
              color:Colors.blue,
            ),),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter the container name or id"
              ),
              onChanged: (value) {
                cmd1 = value;

              },
              

            ),
            
              
            FlatButton(
              onPressed: () { 
                web2(cmd1);
                },
              child: Text("click here",
              style: TextStyle(
                fontSize: 20
              ),),

            ),
            
          ]
        ),
        
      ),
    )
    );
  }
}

