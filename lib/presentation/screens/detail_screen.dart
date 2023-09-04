part of presentation.screen;

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({
    super.key,
    required this.resultId,
    required this.provider,
  });

  final String resultId;
  final String provider;

  static const name = 'detail-screen';

  @override
  ConsumerState<DetailsScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    detailResultRead(ref: ref, detail: widget.provider, id: widget.resultId);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    final Result? detailResult = detailResultWatch(
      ref,
      widget.provider,
      widget.resultId,
    )![widget.resultId];

    if (detailResult == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            detailView(
              detailResult: detailResult,
              size: size,
              textStyle: textStyle,
              detail: widget.provider,
            ),
          ],
        ),
      ),
    );
  }
}
