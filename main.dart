import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/movies_script.dart';
import 'screens/add_movie.dart';
import 'screens/unknown.dart';
import 'models/movies.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Movies(),
      child: aMyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        // Handle '/' List Screen
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const MovieList());
        }

        var uri = Uri.parse(settings.name!);
        // Handle '/add' and '/edit/:id' Add/Edit screen
        if (uri.pathSegments.length == 1 && uri.pathSegments.first == 'add') {
          // Shows empty movie
          return MaterialPageRoute(
              builder: (context) => const AddEditMovie(id: null));
        } else if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'edit') {
          // Shows an existing movie
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => AddEditMovie(id: id));
        }

        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },
    );
  }
}
