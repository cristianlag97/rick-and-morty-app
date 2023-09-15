part of presentation.widgets;

class ItemsVerticalView extends StatefulWidget {
  const ItemsVerticalView({
    super.key,
    required this.characterState,
    required this.nameListView,
    this.loadLastPage,
    this.loadNextPage,
  });

  final List<dynamic> characterState;
  final String nameListView;
  final VoidCallback? loadLastPage;
  final VoidCallback? loadNextPage;

  @override
  State<ItemsVerticalView> createState() => _ItemsVerticalViewState();
}

class _ItemsVerticalViewState extends State<ItemsVerticalView> {
  final scrollController = ScrollController();
  bool isActiveScroll = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
        widget.loadLastPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.79,
      child: ListView.separated(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => FadeInDown(
          child: CardItem(
            nameListView: widget.nameListView,
            result: widget.characterState[index],
            child: selectListView(
              value: widget.nameListView,
              result: widget.characterState[index],
              size: size,
              textStyles: textStyle,
            ),
          ),
        ),
        itemCount: widget.characterState.length,
        separatorBuilder: (_, __) => gapy16,
      ),
    );
  }
}
