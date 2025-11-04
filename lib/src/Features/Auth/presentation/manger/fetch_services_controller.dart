//
//
// import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
// import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
//
// class FetchServicesController extends GetControllerInterface<List<Service>> {
//
//   void fetchServices() async {
//     emit(const DataLoading());
//     final state = await FetchServicesUseCase().call()!;
//     emit(state);
//     if (state is DataSuccess) {
//     } else {}
//   }
//
//   @override
//   void onInit() {
//     fetchServices();
//     super.onInit();
//   }
//
// }
