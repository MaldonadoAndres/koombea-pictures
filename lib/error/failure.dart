import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;

  const Failure({this.msg = ''});
  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String msg}) : super(msg: msg);
}

class HiveFailure extends Failure {
  const HiveFailure({required String msg}) : super(msg: msg);
}