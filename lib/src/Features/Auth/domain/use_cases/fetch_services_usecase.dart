// //<editor-fold desc="Usecase">
// import '../../../../Core/NetworkStructure/Params/null_params.dart';
// import '../../../Booking/domain/entities/service.dart';
//
// import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
// import '../../../../Super/UseCase/user_case.dart';
// import '../../../Booking/data/models/service_model.dart';
// import '../repositories/fetch_services_repository.dart';
//
// class FetchServicesUseCase extends UseCase<List<Service>, NullParams> {
//   factory FetchServicesUseCase() => _instance;
//   static final FetchServicesUseCase _instance = FetchServicesUseCase._();
//
//   FetchServicesUseCase._();
//
//   @override
//   Future<DataState<List<Service>>>? call({NullParams? params}) {
//    return FetchServicesRepository.instance.fromSource(fakeData: FakeData(data: ServiceModel.majorExample));
//   }
//
// }
// //</editor-fold>
