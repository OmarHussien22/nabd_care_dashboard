import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';

abstract class LocalUseCase<T, P> {
  Future<DataState<T>>? call({P? params});
}
