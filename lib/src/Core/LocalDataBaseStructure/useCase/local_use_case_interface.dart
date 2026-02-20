
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';

abstract class LocalUseCase<T, P> {
  Future<DataState<T>>? call({P? params});
}
