part of presentation.views.detail;

class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({
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
            _BodyDetailLocation(
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

class _BodyDetailLocation extends StatelessWidget {
  const _BodyDetailLocation({
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
        padding: paddingHorizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('- PROPERTIES -', style: textStyle.titleSmall),
            gap16,
            _DataTableLocation(
              size: size,
              detailResult: detailResult.name,
              type: 'Name',
            ),
            gap16,
            _DataTableLocation(
              size: size,
              detailResult: detailResult.type,
              type: 'Type',
            ),
            gap16,
            _DataTableLocation(
              size: size,
              detailResult: detailResult.dimension!,
              type: 'Dimension',
            ),
            gap16,
            _DataTableLocation(
              detailResult: detailResult.residents!.length.toString(),
              size: size,
              type: 'Residents',
            ),
          ],
        ),
      ),
    );
  }
}

class _DataTableLocation extends StatelessWidget {
  const _DataTableLocation({
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
          padding: padding8,
          decoration: BoxDecoration(
              color: lightGrey, borderRadius: BorderRadius.circular(10)),
          child: Text(type),
        ),
        Container(
          width: size.width * 0.6,
          padding: padding8,
          decoration: BoxDecoration(
              color: lightGrey, borderRadius: BorderRadius.circular(10)),
          child: Text(detailResult),
        ),
      ],
    );
  }
}
