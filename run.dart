import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;





class RunDocker extends StatefulWidget {
  @override
  _RunDockerState createState() => _RunDockerState();
}

String osname;
String imagename;

launch(osname,imagename) async {
  var url= 'http://192.168.43.230/cgi-bin/launch.py?x=${osname},y={$imagename}';
  var response = await http.get(url);
  print(response.body);
}




class _RunDockerState extends State<RunDocker> {
  final List<String> items = <String>['centos', 'httpd', 'wordpress','ubuntu'];
  String selectedItem = 'centos';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        
        title: Text(
          'Launch a docker',
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
            Text("Enter the Conatiner name"),
            SizedBox(height: 10,width: 10,),
            TextField(
              onChanged: (value) {
                osname = value;
              },
              textAlign: TextAlign.center,
             ),
            SizedBox(width: 20,height: 20,),
            Text("Enter the image name"),

            DropdownButton<String>(
        value: selectedItem,
        onChanged: (String string) => setState(() => selectedItem = string),
        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((String item) {
            return Text(item);
          }).toList();
        },
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            child: Text('$item'),
            value: item,
          );
        }).toList(),
        onTap: () {
                imagename = selectedItem;
              }, 
      ),
            
            SizedBox(width: 20,height: 20,),
            
            FlatButton(
              onPressed: () {
                launch(osname, imagename);
                final snackBar = SnackBar(
                  content: Text('Yay! A SnackBar!'),
                  action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
      
          },
             ),
           );

              }, 
              child: Text("Launch"),
              color: Colors.blue,
            ),

            
          ]
        ),
        
      ),
    )
    );
  }
}


