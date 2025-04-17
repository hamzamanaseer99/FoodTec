abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<String> results;
  SearchLoaded(this.results);
}

class SearchError extends SearchState {}
