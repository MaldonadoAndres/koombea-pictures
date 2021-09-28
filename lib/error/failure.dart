import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;

  const Failure({this.msg = 'Something went wrong'});
  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({String msg = 'Network Failure'}) : super(msg: msg);
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure({String msg = 'Local Storage Failure'}) : super(msg: msg);
}
