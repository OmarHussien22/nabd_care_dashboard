//
// import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
// import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
//  import '../../data/data_sources/fetch_services_api_services.dart';
//
// class FetchServicesRepository extends RepoInterface<List<Service>> {
//   FetchServicesRepository._();
//   static final FetchServicesRepository instance = FetchServicesRepository._();
//   @override
//   // TODO: implement onParse
//   List<Service> Function(dynamic data) get onParse => (data) {
//         return List<Service>.from(
//             data.map((e) => ServiceModel.fromJson(e)));
//       };
//
//   @override
//   // TODO: implement serviceInstance
//   ServicesInterface get serviceInstance => FetchServicesApiService.instance;
// }
