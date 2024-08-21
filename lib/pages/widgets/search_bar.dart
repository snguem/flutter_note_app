import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key, required this.filterBar});

  final Function(String) filterBar;

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.all(8.0),
          // ignore: avoid_unnecessary_containers
          child: SizedBox(
            height: 45,
              child: SearchBar(
                          onChanged: (value) => widget.filterBar(value),
                          
                          padding:  const WidgetStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          hintText: "Rechercher des notes",
                          hintStyle: const WidgetStatePropertyAll(TextStyle(
                                fontSize: 18,color: Colors.grey,
                          )),

                          textStyle: const WidgetStatePropertyAll(TextStyle(
                            color: Colors.grey,
                                        fontSize: 18,
                          )),
                          leading: const Icon(Icons.search,
                                        color: Colors.grey,),
                          backgroundColor: const WidgetStatePropertyAll(Color(0xFF191919)),
                          elevation: const WidgetStatePropertyAll(10),
                        ),
          )
      );
  }
  
}

