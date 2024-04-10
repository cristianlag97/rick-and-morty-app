part of presentation.widgets.bottomshhet;

class EpisodeBottomSheet extends ConsumerWidget {
  const EpisodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> seasion = ['01', '02', '03', '04', '05'];
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: transparent,
      bottomNavigationBar: BottomNavigation(
        deleteFilter: () =>
            ref.read(episodesProvider.notifier).handleDeleteFilter(),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height * 0.4,
        child: Padding(
          padding: padding16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size30,
                    height: size4,
                    color: lightGrey,
                  ),
                ],
              ),
              gapx8,
              Text('Season', style: textStyle.titleSmall),
              Wrap(
                spacing: size8,
                children: seasion
                    .map((season) => ElevatedButton(
                        onPressed: () {
                          ref
                              .read(episodesProvider.notifier)
                              .loadEpisodesFilter(
                                filter: 'episode',
                                query: 'S$season',
                              );
                          context.pop();
                        },
                        child: Text(season)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
