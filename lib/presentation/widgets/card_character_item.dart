part of presentation.widgets;

class CardCharacterItem extends ConsumerWidget {
  const CardCharacterItem({
    super.key,
    required this.result,
    required this.size,
    required this.textStyles,
  });

  final Result result;
  final Size size;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: p8,
      child: Row(
        children: <Widget>[
          if (result.image.isNotEmpty) ...<Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                result.image,
                width: size.width * 0.25,
              ),
            ),
            gapx12,
          ],
          Expanded(
            child: _BodyCardCharacter(result: result, textStyles: textStyles),
          )
        ],
      ),
    );
  }
}

class _BodyCardCharacter extends StatelessWidget {
  const _BodyCardCharacter({
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
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          result.species,
          style: const TextStyle(fontSize: size16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: statusColor(result.status),
                ),
                gapx4,
                Text(result.status.name)
              ],
            ),
            Row(
              children: [
                Icon(genderCharacter(result.gender)),
                Text(result.gender.name),
              ],
            )
          ],
        )
      ],
    );
  }
}
