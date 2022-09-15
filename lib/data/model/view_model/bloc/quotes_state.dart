// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quotes_bloc.dart';

@immutable
abstract class QuotesState extends Equatable {}

class QuotesInitial extends QuotesState {
  @override
  List<Object?> get props => [];
}

class QuoteSucces extends QuotesState {
  Quotes quote;
  QuoteSucces(this.quote);

  @override
  List<Object?> get props => [quote];
}

class QuoteError extends QuotesState {
  @override
  List<Object?> get props => [message];

  String message;
  QuoteError(
    this.message,
  );
}

class QuoteLoading extends QuotesState {
  QuoteLoading();
  @override
  List<Object?> get props => [];
}
