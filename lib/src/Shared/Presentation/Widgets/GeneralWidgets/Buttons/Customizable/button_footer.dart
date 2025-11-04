part of 'imports_customizable.dart';

class ButtonFooter extends StatelessWidget {
  final String? title;
  final bool isDisabled;
  final VoidCallback? onPressed;

  final List<Widget>? children;

  const ButtonFooter({
    super.key,
    this.title,
    this.isDisabled = false,
    this.onPressed,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.toH(),
        horizontal: 16.toW(),
      ),
      decoration: BoxDecoration(
        color: AppColors.get.white,
        borderRadius: BorderRadius.circular(8.toRad()),
        boxShadow: [
          BoxShadow(
            color: AppColors.get.black.withOpacity(0.1),
            blurRadius: 8.toRad(),
            offset: Offset(0, 4.toH()),
          ),
        ],
      ),
      child: Row(
        children: children ??
            [
              Expanded(
                child: ButtonDefault(
                  title: title,
                  height: 54.toH(),
                  isDisabled: isDisabled,
                  onPressed: onPressed,
                ),
              ),
            ],
      ),
    );
  }
}
