part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}


class SearchStartEvent extends SearchEvent{
  String searchtext;
  String method;

  SearchStartEvent({required this.searchtext,required this.method});
}