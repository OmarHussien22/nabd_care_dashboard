import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/sub_category/data/data_sources/get_sub_category_local_service.dart';
import 'package:getx_base_code/src/Features/sub_category/data/models/sub_category_model.dart';

class GetSubCategoryLocalRepo
    extends LocalRepoInterface<List<SubCategoryModel>> {
  GetSubCategoryLocalRepo._();
  static final instance = GetSubCategoryLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      GetSubCategoryLocalService.instance;

  @override
  ResponseType get responseType => ResponseType.withData;

  @override
  List<SubCategoryModel> Function(dynamic data) get onParse => (data) {
        List<SubCategoryModel> subCategories = [];
        data.forEach((element) {
          subCategories.add(SubCategoryModel.fromJson(element));
        });
        return subCategories;
      };
}
