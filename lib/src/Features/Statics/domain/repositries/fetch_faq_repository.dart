

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_faq_api_service.dart';
import '../../data/models/question_model.dart';
import '../entities/question.dart';

class FetchFaqRepository extends RepoInterface<List<Question>>{
  FetchFaqRepository._();
  static  final FetchFaqRepository instance = FetchFaqRepository._();
  @override
  // TODO: implement onParse
  List<Question> Function(dynamic data) get onParse => (data){
    List<QuestionModel> faqList =[];
    data.forEach((element) {
      faqList.add(QuestionModel.fromJson(element));
    });
    return faqList ;
  };

  @override
  // TODO: implement serviceInstance
  ServicesInterface get serviceInstance => FetchFaqApiService.instance;

}