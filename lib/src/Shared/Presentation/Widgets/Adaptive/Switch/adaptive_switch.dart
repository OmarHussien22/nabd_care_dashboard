import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdaptiveSwitch extends StatefulWidget {
  final String ?toolTip ;
  final bool  initialValue ;
  final VoidCallback?  onChanged ;
  // final bool value ;
  const AdaptiveSwitch({super.key, this.toolTip,required this.initialValue, this.onChanged, });

  @override
  State<AdaptiveSwitch> createState() => _AdaptiveSwitchState();
}

class _AdaptiveSwitchState extends State<AdaptiveSwitch> {
 late bool isSwitched  ;

  // void setValue (){
  //   isSwitched = Ui.value;
  // }
  @override
  void initState() {
      setState(() {
        isSwitched = widget.initialValue ;
      });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: (widget.toolTip??"").tr,
      child: Switch.adaptive(
        inactiveThumbColor: AppColors.get.switchDisabled,
        inactiveTrackColor: AppColors.get.switchDisabled.withOpacity(0.5),
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched=value;
            // isSwitched = Ui.initialValue;
            widget.onChanged!();

           });
        },
        activeTrackColor:  AppColors.get.switchEnabled.withOpacity(0.7),
        activeColor:AppColors.get.switchEnabled,
      ),
    );
  }
}
