part of presentation.widgets;

class CardEpisodeItem extends StatelessWidget {
  const CardEpisodeItem({
    super.key,
    required this.result,
    required this.size,
    required this.textStyles,
  });

  final Result result;
  final Size size;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: Row(
        children: <Widget>[
          Expanded(
            child: _BodyCardEpisode(result: result, textStyles: textStyles),
          )
        ],
      ),
    );
  }
}

class _BodyCardEpisode extends StatelessWidget {
  const _BodyCardEpisode({
    required this.result,
    required this.textStyles,
  });

  final Result result;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          result.name,
          style: textStyles.titleSmall?.copyWith(
            fontSize: size18,
            decoration: TextDecoration.underline,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'Episode: ${result.episode!.substring(result.episode!.length - 2)}',
          style: const TextStyle(fontSize: size16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'Season: ${result.episode!.substring(0, 3).replaceAll('S', '')}',
          style: const TextStyle(fontSize: size16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
