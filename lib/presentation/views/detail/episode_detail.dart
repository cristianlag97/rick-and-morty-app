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
              detailResult: detailResult!,
              size: size,
              textStyle: textStyle,
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
    required this.detailResult,
    required this.size,
    required this.textStyle,
  });

  final Result detailResult;
  final Size size;
  final TextTheme textStyle;

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
              detailResult: detailResult.name,
              size: size,
              type: 'Name',
            ),
            gap16,
            _DataTableEpisode(
              detailResult: detailResult.airDate!,
              size: size,
              type: 'Air date',
            ),
            gap16,
            _DataTableEpisode(
              detailResult: detailResult.episode!,
              size: size,
              type: 'Episode',
            ),
            gap16,
            _DataTableEpisode(
              detailResult: detailResult.characters!.length.toString(),
              size: size,
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
    required this.detailResult,
    required this.size,
    required this.type,
  });

  final String detailResult;
  final Size size;
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
