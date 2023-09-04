part of presentation.providers.episodes;

final episodesRepositoryProvider = Provider((ref) {
  return EpisodeRepositoryImpl(EpisodeDatasourceImpl());
});

final StateNotifierProvider<EpisodesNotifier, EpisodeState> episodesProvider =
    StateNotifierProvider<EpisodesNotifier, EpisodeState>((ref) {
  final fetchMoreEpisodes = ref.watch(episodesRepositoryProvider).getAllEpisode;
  final fetchInfoEpisode = ref.watch(episodesRepositoryProvider).getInfoEpisode;
  final fetchEpisodeById = ref.watch(episodesRepositoryProvider).getEpisodeById;
  final fetchEpisodeFilter =
      ref.watch(episodesRepositoryProvider).getEpisodeByFilter;
  return EpisodesNotifier(
    getEpisodes: fetchMoreEpisodes,
    getInfoEpisodes: fetchInfoEpisode,
    getEpisodeById: fetchEpisodeById,
    getEpisodesFilter: fetchEpisodeFilter,
  );
});
