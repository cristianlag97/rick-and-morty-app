part of config.helpers;

Widget selectListView({
  required value,
  required Result result,
  required Size size,
  required TextTheme textStyles,
}) {
  switch (value) {
    case 'episode':
      return CardEpisodeItem(
        result: result,
        size: size,
        textStyles: textStyles,
      );
    case 'location':
      return CardLocationItem(
        result: result,
        size: size,
        textStyles: textStyles,
      );
    case 'character':
    default:
      return CardCharacterItem(
        result: result,
        size: size,
        textStyles: textStyles,
      );
  }
}
