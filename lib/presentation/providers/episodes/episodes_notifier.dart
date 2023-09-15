part of presentation.providers.episodes;

typedef GetEpisodeByIdCallback = Future<Result> Function(String episodeId);
typedef GetEpisodeCallback = Future<List<Result>> Function({int page});
typedef GetIfoEpisodeCallback = Future<Info> Function({int page});
typedef GetEpisodesFilterCallback = Future<List<Result>> Function({
  String filter,
  String query,
});

class EpisodesNotifier extends StateNotifier<EpisodeState> {
  EpisodesNotifier({
    required this.getEpisodeById,
    required this.getEpisodes,
    required this.getEpisodesFilter,
    required this.getInfoEpisodes,
  }) : super(const EpisodeState(
          lastPage: 1000,
          results: [],
        ));

  bool isLoading = false;
  GetEpisodeByIdCallback getEpisodeById;
  GetEpisodeCallback getEpisodes;
  GetEpisodesFilterCallback getEpisodesFilter;
  GetIfoEpisodeCallback getInfoEpisodes;
  int currentPage = 0;

  Future<void> handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info = await getInfoEpisodes(page: currentPage);
      state = state.copyWith(lastPage: info.pages);
    }
  }

  Future<void> loadEpisodes() async {
    if (isLoading) return;
    isLoading = true;
    if ((currentPage != state.lastPage) && !state.isFilter) {
      state.results.isEmpty && currentPage > 0
          ? currentPage = 1
          : currentPage++;
      final List<Result> episodes = await getEpisodes(page: currentPage);
      state = state.copyWith(results: [...state.results, ...episodes]);
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  Future<void> loadEpisodeId(String episodeId) async {
    if (isLoading) return;
    isLoading = true;
    final Result episode = await getEpisodeById(episodeId);
    state = state.copyWith(
      result: episode,
      resultsMap: {
        ...state.resultsMap,
        episodeId: episode,
      },
    );
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

  Future<void> loadEpisodesFilter({
    String filter = '',
    String query = '',
  }) async {
    state = state.copyWith(isLoading: true);
    if (isLoading) return;
    isLoading = true;
    final List<Result> episode = await getEpisodesFilter(
      filter: filter,
      query: query,
    );
    state = state.copyWith(
      results: episode,
      isFilter: true,
    );
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    state = state.copyWith(isLoading: false);
  }

  Future<void> handleDeleteFilter() async {
    state = state.copyWith(isLoading: true);
    if (isLoading) return;
    isLoading = true;
    if (state.isFilter) {
      final List<Result> episodes = await getEpisodes(page: currentPage);
      state = state.copyWith(
        isFilter: false,
        results: [...episodes],
      );
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
      state = state.copyWith(isLoading: false);
    }
  }
}
