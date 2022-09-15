import 'package:daily_quotes/data/model/view_model/bloc/quotes_bloc.dart';
import 'package:daily_quotes/presentation/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => QuotesBloc(),
            )
          ],
          child: const MyHomePage(),
        ));
  }
}
