import 'package:equatable/equatable.dart';

abstract class ServerRespond extends Equatable {
  const ServerRespond([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends ServerRespond {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerSuccess extends ServerRespond {
  @override
  List<Object?> get props => throw UnimplementedError();
}


// enum failiourType{existedRecord,}