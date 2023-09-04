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

class _BodyDetail extends StatelessWidget {
  const _BodyDetail({
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
            _DataTable(
              size: size,
              detailResult: detailResult.name,
              type: 'Name',
            ),
            gap16,
            _DataTable(
              size: size,
              detailResult: detailResult.gender.name,
              type: 'Gender',
            ),
            gap16,
            _DataTable(
              size: size,
              detailResult: detailResult.species,
              type: 'Specie',
            ),
            gap16,
            _DataTable(
              size: size,
              detailResult: detailResult.status.name,
              type: 'Status',
            ),
            gap16,
            Text('- WHEREABOUTS -', style: textStyle.titleSmall),
            gap16,
            _DataTable(
              size: size,
              detailResult: detailResult.origin.name,
              type: 'Origin',
            ),
            gap16,
            _DataTable(
              size: size,
              detailResult: detailResult.location.name,
              type: 'Location',
            ),
            gap16,
            Text('- FEATURED CHAPTERS -', style: textStyle.titleSmall),
            gap16,
            _DataTable(
              size: size,
              detailResult: '${detailResult.episodes!.length}',
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
    required this.size,
    required this.detailResult,
  });

  final Size size;
  final Result? detailResult;

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
