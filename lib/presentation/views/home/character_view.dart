part of presentation.views.home;

class CharacterView extends ConsumerStatefulWidget {
  const CharacterView({super.key});

  @override
  ConsumerState<CharacterView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<CharacterView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(charactersProvider.notifier).handleAddInfo();
    ref.read(charactersProvider.notifier).loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Result> characterState = ref.watch(charactersProvider).results;
    final bool isLoading = ref.watch(charactersProvider).isLoading;
    if (characterState.isEmpty || isLoading) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton.icon(
                      onPressed: () {
                        final searchQuery = ref.read(searchQueryProvider);
                        final searchedResult =
                            ref.read(searchCharacterResultProvider);
                        showSearch<Result?>(
                          query: searchQuery,
                          context: context,
                          delegate: SearchResultDelegate(
                            initialResults: searchedResult,
                            searchResults: ref
                                .read(searchCharacterResultProvider.notifier)
                                .searchResultByQuery,
                          ),
                        ).then((result) {
                          if (result == null) return;
                          context.push('/result/${result.id}/character');
                        });
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('Search')),
                  ElevatedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) =>
                              const CharacterBottomSheet(),
                        );
                      },
                      icon: const Icon(Icons.list_rounded),
                      label: const Text('Filter'))
                ],
              ),
              ItemsVerticalView(
                nameListView: 'character',
                characterState: characterState,
                loadNextPage: () =>
                    ref.read(charactersProvider.notifier).loadCharacters(),
                loadLastPage: () =>
                    ref.read(charactersProvider.notifier).handleAddInfo(),
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
