import 'package:equatable/equatable.dart';

abstract class Entity with EquatableMixin {


  Map<String, dynamic> toJson(){
    return {};
  }


  @override
  List<Object?> get props;

  List<Entity> get example => [];
}

class NoData extends Entity {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
