part of presentation.views.home;

class EpisodeView extends ConsumerStatefulWidget {
  const EpisodeView({super.key});

  @override
  ConsumerState<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends ConsumerState<EpisodeView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(episodesProvider.notifier).handleAddInfo();
    ref.read(episodesProvider.notifier).loadEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Result> episodeState = ref.watch(episodesProvider).results;
    final bool isLoading = ref.watch(episodesProvider).isLoading;
    if (episodeState.isEmpty || isLoading) {
      return const FullScreenLoading();
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: p16,
          child: Column(
            children: <Widget>[
              gapy16,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) =>
                              const EpisodeBottomSheet(),
                        );
                      },
                      icon: const Icon(Icons.list_rounded),
                      label: const Text('Filter'))
                ],
              ),
              ItemsVerticalView(
                characterState: episodeState,
                loadLastPage: () =>
                    ref.read(episodesProvider.notifier).handleAddInfo(),
                loadNextPage: () =>
                    ref.read(episodesProvider.notifier).loadEpisodes(),
                nameListView: 'episode',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
