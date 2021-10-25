part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingState extends SearchState {}

class SearchCompletedState extends SearchState {
  Map<String, dynamic> jsonResponse;
  SearchCompletedState({required this.jsonResponse});
}
