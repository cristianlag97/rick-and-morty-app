part of presentation.views.home;

class LocationView extends ConsumerStatefulWidget {
  const LocationView({super.key});

  @override
  ConsumerState<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends ConsumerState<LocationView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(locationsProvider.notifier).handleAddInfo();
    ref.read(locationsProvider.notifier).loadLocations();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Result> locationsState = ref.watch(locationsProvider).results;
    final bool isLoading = ref.watch(locationsProvider).isLoading;
    if (locationsState.isEmpty || isLoading) {
      return const FullScreenLoading();
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: paddingHorizontal16,
          child: Column(
            children: <Widget>[
              gapy16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton.icon(
                      onPressed: () {
                        ref.read(locationsProvider.notifier).cleanResults;
                        final searchQuery = ref.read(searchQueryProvider);
                        final searchedResult =
                            ref.read(searchLocationResultProvider);
                        showSearch<Result?>(
                          query: searchQuery,
                          context: context,
                          delegate: SearchResultDelegate(
                            initialResults: searchedResult,
                            searchResults: ref
                                .read(searchLocationResultProvider.notifier)
                                .searchResultByQuery,
                          ),
                        ).then((result) {
                          if (result == null) return;
                          context.push('/result/${result.id}/location');
                        });
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('Search')),
                  ElevatedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) =>
                              const LocationBottomSheet(),
                        );
                      },
                      icon: const Icon(Icons.list_rounded),
                      label: const Text('Filter'))
                ],
              ),
              ItemsVerticalView(
                characterState: locationsState,
                loadLastPage: () =>
                    ref.read(locationsProvider.notifier).handleAddInfo(),
                loadNextPage: () =>
                    ref.read(locationsProvider.notifier).loadLocations(),
                nameListView: 'location',
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
