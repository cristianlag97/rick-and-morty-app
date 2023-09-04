part of config.helpers;

Widget detailView({
  required Result detailResult,
  required Size size,
  required TextTheme textStyle,
  required String detail,
}) {
  switch (detail) {
    case 'episode':
      return EpisodeDetailsScreen(
        detailResult: detailResult,
        size: size,
        textStyle: textStyle,
      );
    case 'location':
      return LocationDetailsScreen(
        detailResult: detailResult,
        size: size,
        textStyle: textStyle,
      );
    case 'character':
    default:
      return CharacterDetailsScreen(
        detailResult: detailResult,
        size: size,
        textStyle: textStyle,
      );
  }
}
