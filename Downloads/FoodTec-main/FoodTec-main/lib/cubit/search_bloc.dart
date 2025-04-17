import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/event/search_event.dart';
import 'package:foodtek/state/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchTextChanged) {
      yield SearchLoading();
      try {
        // Simulated search result (Replace with real API/database call)
        List<String> allItems = ["Burger", "Pizza", "Sandwich", "Date"];
        List<String> filteredItems = allItems
            .where((item) => item.toLowerCase().contains(event.query.toLowerCase()))
            .toList();

        await Future.delayed(Duration(milliseconds: 500)); // Simulate delay
        yield SearchLoaded(filteredItems);
      } catch (e) {
        yield SearchError();
      }
    }
  }
}
