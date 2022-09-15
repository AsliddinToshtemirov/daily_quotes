import 'package:daily_quotes/data/model/view_model/bloc/quotes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    fetchrandom();
  }

  void fetchrandom() {
    context.read<QuotesBloc>().add(GetRandomQuotes());
  }

  int counter = 0;
  var _imageurl = 'https://source.unsplash.com/random/';
  NetworkImage imageprovider() {
    return NetworkImage(
      _imageurl,
    );
  }

  void _newImage() {
    setState(() {
      _imageurl = 'https://source.unsplash.com/random/$counter';
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: imageprovider(), fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            BlocBuilder<QuotesBloc, QuotesState>(builder: (context, state) {
              if (state is QuoteLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is QuoteError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is QuoteSucces) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.blueAccent)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          state.quote.content!,
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Container();
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            fetchrandom();
            _newImage();
          },
          label: const Text("New quote")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
