
part of 'imports_data_builder.dart';



class BottomRequestStatusBuilder extends StatelessWidget {
  final DataState status;
  final Widget bottomWidget;

  const BottomRequestStatusBuilder({
    Key? key,
    required this.status,
    required this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    if (status is DataInitial) {
      widget = bottomWidget;
     } else if (status is DataLoading) {
       widget =const AppLoader();
    } else if (status is DataFailed) {
       printDM("status.error!.errorType is ${status.error!.type}");
      if (status.error!.type == ErrorType.networkConnection) {
        /// change Later
        widget = bottomWidget;
         ClientSnacks.connectionError();
      } else if (status.error!.type == ErrorType.dirtyData) {
         widget = bottomWidget;
        ClientSnacks.requestError(error: status.error!.title);
      } else {
        widget = bottomWidget;
      }
    } else {
      widget = bottomWidget;
    }
    return widget;
  }
}

