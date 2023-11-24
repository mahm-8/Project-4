part of 'search_bloc.dart';

abstract class SearchEvent {}

class FindSearchEvent extends SearchEvent {
  final String search;

  FindSearchEvent(this.search);
}
