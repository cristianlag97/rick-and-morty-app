part of presentation.widgets;

class CardLocationItem extends StatelessWidget {
  const CardLocationItem({
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
      padding: p8,
      child: Row(
        children: <Widget>[
          Expanded(
            child: _BodyCardLocation(result: result, textStyles: textStyles),
          )
        ],
      ),
    );
  }
}

class _BodyCardLocation extends StatelessWidget {
  const _BodyCardLocation({
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
          result.type,
          style: const TextStyle(fontSize: size16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
