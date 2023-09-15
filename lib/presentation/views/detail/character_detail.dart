part of presentation.views.detail;

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({
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
            if (detailResult!.image.isNotEmpty) ...<Widget>[
              gapy16,
              _ImageDetaild(size: size, detailResult: detailResult)
            ],
            _BodyDetail(
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

class _BodyDetail extends StatelessWidget {
  const _BodyDetail({
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
            _DataTable(
              detailResult: detailResult.name,
              size: size,
              type: 'Name',
            ),
            gap16,
            _DataTable(
              detailResult: detailResult.gender.name,
              size: size,
              type: 'Gender',
            ),
            gap16,
            _DataTable(
              detailResult: detailResult.species,
              size: size,
              type: 'Specie',
            ),
            gap16,
            _DataTable(
              detailResult: detailResult.status.name,
              size: size,
              type: 'Status',
            ),
            gap16,
            Text('- WHEREABOUTS -', style: textStyle.titleSmall),
            gap16,
            _DataTable(
              detailResult: detailResult.origin.name,
              size: size,
              type: 'Origin',
            ),
            gap16,
            _DataTable(
              detailResult: detailResult.location.name,
              size: size,
              type: 'Location',
            ),
            gap16,
            Text('- FEATURED CHAPTERS -', style: textStyle.titleSmall),
            gap16,
            _DataTable(
              detailResult: '${detailResult.episodes!.length}',
              size: size,
              type: 'Episodes',
            ),
          ],
        ),
      ),
    );
  }
}

class _DataTable extends StatelessWidget {
  const _DataTable({
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
          width: size.width * 0.65,
          padding: p8,
          decoration: BoxDecoration(
              color: colorGreyLight, borderRadius: BorderRadius.circular(10)),
          child: Text(detailResult),
        ),
      ],
    );
  }
}

class _ImageDetaild extends StatelessWidget {
  const _ImageDetaild({
    required this.detailResult,
    required this.size,
  });

  final Result? detailResult;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.15,
            child: Stack(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: statusColor(detailResult!.status),
                      width: 4.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(detailResult!.image),
                  ),
                ),
                Positioned(
                  top: 85,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: statusColor(detailResult!.status),
                    ),
                    child: Text(
                      detailResult!.status.name.toUpperCase(),
                      style: const TextStyle(color: colorWhite),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
