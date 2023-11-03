part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {}

class GetInitialEvent extends CharactersEvent {
  @override
  List<Object?> get props => [];
}

class GetNextEvent extends CharactersEvent {
  @override
  List<Object?> get props => [];
}

class FilterEvent extends CharactersEvent {
  final String filterValue;

  FilterEvent(this.filterValue);
  @override
  List<Object?> get props => [];
}
