

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_sara/Repo/SearchRepo.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepo? searchRepo;
  SearchBloc(this.searchRepo) : super(SearchInitial());

  Stream<SearchState> mapEventToState(
      SearchEvent event,
      ) async* {

    if(event is SearchStartEvent){
      yield LoadingState();
      Map<String, dynamic>? jsonResponse=await searchRepo!.SearchMusic(event.searchtext,event.method);

      if(jsonResponse!=null){
        yield SearchCompletedState(jsonResponse: jsonResponse);
      }
      else{
        yield SearchInitial();
      }
    }
  }
}
