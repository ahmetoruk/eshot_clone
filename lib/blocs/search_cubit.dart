import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:eshot_clone/data/repositories/route_repository.dart';
import 'package:eshot_clone/domain/entities/search_result.dart';

part 'search_cubit.freezed.dart';

enum SearchStatus { initial, loading, loadad }

@freezed
class SearchState with _$SearchState {
  factory SearchState(
      {required SearchStatus status,
      required List<SearchResult> searchResults}) = _SearchState;
}

class SearchTextEvent {
  final String text;

  SearchTextEvent(this.text);
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

class SearchBloc extends Bloc<SearchTextEvent, SearchState> {
  SearchBloc({required this.routeRepository})
      : super(SearchState(status: SearchStatus.initial, searchResults: [])) {
    on<SearchTextEvent>(
      (event, emit) async {
        emit(state.copyWith(status: SearchStatus.loading));
        try {
          final results = await routeRepository.getSearchResults(event.text);
          emit(
              SearchState(status: SearchStatus.loadad, searchResults: results));
        } catch (_) {}
      },
      transformer: debounce(const Duration(milliseconds: 400)),
    );
  }

  final RouteRepository routeRepository;
}
