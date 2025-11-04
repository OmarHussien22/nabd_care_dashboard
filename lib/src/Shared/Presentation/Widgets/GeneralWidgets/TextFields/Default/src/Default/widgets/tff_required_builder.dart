part of 'imports_widgets_tff.dart';

class  TFFRequiredBuilder extends StatelessWidget {
  const  TFFRequiredBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      "*",
      color:  AppColors.get.tTFIsRequired,
      padding: EdgeInsetsDirectional.only(
        // start: widget.prefixiconImage != null ? 30.0.toW() : 16.toW(),
        start: true? 30.0.toW() : 16.toW(),
        bottom: 16.toH(),

        /// for now
        // bottom: widget.errorText != null ? 40.h : 0,
      ),
    );
  }
}
