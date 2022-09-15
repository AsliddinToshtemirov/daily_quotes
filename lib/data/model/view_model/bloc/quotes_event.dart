part of 'quotes_bloc.dart';

@immutable
abstract class QuotesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetRandomQuotes extends QuotesEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetQuotesList extends QuotesEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAuthorList extends QuotesEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
