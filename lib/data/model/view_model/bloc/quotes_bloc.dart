import 'package:bloc/bloc.dart';
import 'package:daily_quotes/data/model/quote_model.dart';
import 'package:daily_quotes/data/repositories/quotes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  QuotesBloc() : super(QuotesInitial()) {
    on<QuotesEvent>((event, emit) {});
    on<GetRandomQuotes>(_getRandomEventToState);
  }

  _getRandomEventToState(
      GetRandomQuotes event, Emitter<QuotesState> emit) async {
    try {
      final quote = await QuotesRepository().fetchQuotes();
      emit(QuoteSucces(quote));
    } catch (e) {
      print(e.toString());
      emit(QuoteError(e.toString()));
    }
  }
}
