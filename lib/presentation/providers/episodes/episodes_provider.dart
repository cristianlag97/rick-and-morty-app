part of presentation.providers.episodes;

final episodesRepositoryProvider = Provider((ref) {
  return EpisodeRepositoryImpl(EpisodeDatasourceImpl());
});

final StateNotifierProvider<EpisodesNotifier, EpisodeState> episodesProvider =
    StateNotifierProvider<EpisodesNotifier, EpisodeState>((ref) {
  final fetchEpisodeById = ref.watch(episodesRepositoryProvider).getEpisodeById;
  final fetchInfoEpisode = ref.watch(episodesRepositoryProvider).getInfoEpisode;
  final fetchMoreEpisodes = ref.watch(episodesRepositoryProvider).getAllEpisode;
  final fetchEpisodeFilter =
      ref.watch(episodesRepositoryProvider).getEpisodeByFilter;
  return EpisodesNotifier(
    getEpisodeById: fetchEpisodeById,
    getEpisodes: fetchMoreEpisodes,
    getEpisodesFilter: fetchEpisodeFilter,
    getInfoEpisodes: fetchInfoEpisode,
  );
});
