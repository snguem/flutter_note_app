import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_notes_app_2/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutter_native_splash/flutter_native_splash.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();  
  runApp(const MyApp());
}

// whenever your initialization is completed, remove the splash screen:
// FlutterNativeSplash.remove();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(Color.fromARGB(255, 255, 255, 255)),
            iconSize: WidgetStatePropertyAll(30),
          )
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.robotoMono(
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
          titleLarge: const TextStyle(
            color: Colors.white,
          )
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 3, 45, 80)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home() ,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
 

  @override
  Widget build(BuildContext context) {
     
     List<Map<String,dynamic>> myIcons=[
          {
          "color":Colors.black12,
          "icon":  Icons.add_alert
         },
         {
          "color":Colors.green,
          "icon":  Icons.cancel
         },
         {
          "color":Colors.amber,
          "icon":  Icons.shop
         }
     ];
 
    return Scaffold(
       appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.grey,
          actions: [
            
            for( dynamic val in myIcons)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
              icon: Icon(val['icon'],color: val['color'],),
              tooltip: 'Show Snackbar',
              onPressed:() {
                // print("Bonjour");
              },
              ),
            )
          ],
          elevation: 0,
       ),
       drawer: Drawer(
        child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Item 1'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: const Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),

       ),
       body: ListView(
        scrollDirection: Axis.horizontal,
         children: [
           for(int j=1;j<=10;j++)
                          Row(
                mainAxisAlignment: MainAxisAlignment.end,
                
                children: [
                 for(int i=1;i<=3;i++)
                     Padding(
                      padding: const EdgeInsets.all(4.0),
                     child: Container(
                             height: 100,
                              width: 100,
                           margin: const EdgeInsets.all(10),
                           padding: const EdgeInsets.only(top: 20,left: 10),
                           decoration: const BoxDecoration(
                             color: Colors.amber,
                             borderRadius: BorderRadius.all(Radius.circular(20)),
                             border: Border(top:BorderSide(
                               color: Colors.black,
                               width: 1
                             ))
                           ),
                           child: Center(child: Text("Hello word $i",style:const TextStyle(color: Colors.white,
                           fontFamily:"Arial",
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                          
                           ))),
                 ),
               ),
                ],
              
               ),
         ],
       ),

       bottomNavigationBar:BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home")
        ],
        
       )

    );
  }
}

