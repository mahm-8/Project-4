import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_set.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<FindSearchEvent>((event, emit) {
      List<Map<String, dynamic>> searchResults = dataSets;
      searchResults = dataSets
          .where((product) => product["name"]
              .toString()
              .toLowerCase()
              .contains(event.search.toLowerCase()))
          .toList();
      emit(SearchFindState(searchResults));
    });
  }
}
