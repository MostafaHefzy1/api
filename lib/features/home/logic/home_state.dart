part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class GetListSuccessState extends HomeState {}
final class GetListFailedState extends HomeState {}