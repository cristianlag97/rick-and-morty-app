part of presentation.views.detail;

class EpisodeDetailsScreen extends StatelessWidget {
  const EpisodeDetailsScreen({
    super.key,
    required this.detailResult,
    required this.size,
    required this.textStyle,
  });

  final Result? detailResult;
  final Size size;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            gapy16,
            IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
            ),
            _BodyDetailEpisode(
              size: size,
              textStyle: textStyle,
              detailResult: detailResult!,
            )
          ],
        ),
        childCount: 1,
      ),
    );
  }
}

class _BodyDetailEpisode extends StatelessWidget {
  const _BodyDetailEpisode({
    required this.size,
    required this.textStyle,
    required this.detailResult,
  });

  final Size size;
  final TextTheme textStyle;
  final Result detailResult;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: px16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('- PROPERTIES -', style: textStyle.titleSmall),
            gap16,
            _DataTableEpisode(
              size: size,
              detailResult: detailResult.name,
              type: 'Name',
            ),
            gap16,
            _DataTableEpisode(
              size: size,
              detailResult: detailResult.airDate!,
              type: 'Air date',
            ),
            gap16,
            _DataTableEpisode(
              size: size,
              detailResult: detailResult.episode!,
              type: 'Episode',
            ),
            gap16,
            _DataTableEpisode(
              size: size,
              detailResult: detailResult.characters!.length.toString(),
              type: 'Characters',
            ),
          ],
        ),
      ),
    );
  }
}

class _DataTableEpisode extends StatelessWidget {
  const _DataTableEpisode({
    required this.size,
    required this.detailResult,
    required this.type,
  });

  final Size size;
  final String detailResult;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: p8,
          decoration: BoxDecoration(
              color: colorGreyLight, borderRadius: BorderRadius.circular(10)),
          child: Text(type),
        ),
        Container(
          width: size.width * 0.6,
          padding: p8,
          decoration: BoxDecoration(
              color: colorGreyLight, borderRadius: BorderRadius.circular(10)),
          child: Text(detailResult),
        ),
      ],
    );
  }
}
