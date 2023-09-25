part of presentation.providers.episodes;

class EpisodesNotifier extends StateNotifier<EpisodeState> {
  EpisodesNotifier({
    required this.episodeRepository,
  }) : super(const EpisodeState(
          lastPage: 1000,
          results: [],
        ));

  bool isLoading = false;
  EpisodeRepository episodeRepository;
  int currentPage = 0;

  Future<void> handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info = await episodeRepository.getInfoEpisode(page: currentPage);
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
      final List<Result> episodes =
          await episodeRepository.getAllEpisode(page: currentPage);
      state = state.copyWith(results: [...state.results, ...episodes]);
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  Future<void> loadEpisodeId(String episodeId) async {
    if (isLoading) return;
    isLoading = true;
    final Result episode = await episodeRepository.getEpisodeById(episodeId);
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
    final List<Result> episode = await episodeRepository.getEpisodeByFilter(
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
      final List<Result> episodes =
          await episodeRepository.getAllEpisode(page: currentPage);
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
