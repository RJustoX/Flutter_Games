import 'package:flutter_games/components/shared/single_button.component.dart';
import 'package:flutter_games/utils/app_colors.dart';

class MemoryGameButton extends SingleButton {
  const MemoryGameButton(String text, Function()? onTap, {super.key, bool invertColors = false})
      : super(
            onTap: onTap,
            text: text,
            mainColor: invertColors ? AppColors.secondaryColor : AppColors.neutral,
            buttonColor: invertColors ? AppColors.neutral : AppColors.secondaryColor,
            toUperCase: true);
}
