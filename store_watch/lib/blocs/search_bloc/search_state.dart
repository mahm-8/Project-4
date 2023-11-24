part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchFindState extends SearchState {
  final List<Map<String, dynamic>> searchResults;

  SearchFindState(this.searchResults);
}
