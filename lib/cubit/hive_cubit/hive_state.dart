part of 'hive_cubit.dart';

@immutable
sealed class HiveState {}

final class HiveInitial extends HiveState {}

final class HiveChangeFavouriteState extends HiveState {}

final class HiveChangeState extends HiveState {}
