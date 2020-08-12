
import 'package:docker_task/dockerstatus.dart';
import 'package:docker_task/run.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

web(cmd) async {
  var url= 'http://192.168.43.230/cgi-bin/web.py?x=${cmd}';
  var response = await http.get(url);
  print(response.body);
}


String cmd;

func(){
  print("jk");

}

class MyApp extends StatelessWidget {
  
  
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Docker"),
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            TextField(
              toolbarOptions: ToolbarOptions(copy:true, cut: true, paste: true, selectAll: true ),
              //keyboardType: TextInputType.phone,

            ),
            
            

           
          ]
        )
        
            
          
        ),
        drawer: Builder(builder: (context)=>
        Drawer(
          child: ListView(children: <Widget>[
           

            ListTile(
              subtitle: Text("To see status of docker"),
              leading: Icon(Icons.music_note,size: 30,color: Colors.indigo,),
              title: Row(
                children: <Widget>[
                  Text("Docker Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.indigo,
                    
                    ),
                    ),

                ],
              ),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => DockerStatus()
                )
                );
              },
            ),

            ListTile(
              subtitle: Text("Launching a docker container using your image"),
              leading: Icon(Icons.dock,size: 30,color: Colors.indigo,),
              title: Row(
                children: <Widget>[
                  Text("RUN A DOCKER CONTAINER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.indigo,
                    
                    ),
                    ),

                ],
              ),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => RunDocker()
                )
                );
              },
            ),
            ListTile(
              subtitle: Text("Video from internet"),
              leading: Icon(Icons.music_video,size: 30,color: Colors.indigo,),              
              title: Row(
                children: <Widget>[
                  Text("Network Video",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.indigo,
                    
                    ),
                    ),

                ],
              ),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => func()
                )
                );
              },
            ),
            ListTile(
              subtitle: Text("Video from local disk"),
              leading: Icon(Icons.music_video,size: 30,color: Colors.indigo,),
              title: Row(
                children: <Widget>[
                  Text("Asset Video",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.indigo,
                    
                    ),
                    ),

                ],
              ),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => RunDocker()
                )
                );
              },
            ),
          ],
          ),
        ),
      ),
      ));
  }
}
