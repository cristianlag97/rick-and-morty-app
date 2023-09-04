part of presentation.widgets.bottomshhet;

class LocationBottomSheet extends ConsumerWidget {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> types = [
      'planet',
      'space station',
      'microverse',
      'tv',
      'fantasy town'
    ];
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorTransparent,
      bottomNavigationBar: BottomNavigation(
        deleteFilter: () =>
            ref.read(locationsProvider.notifier).handleDeleteFilter(),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height * 0.4,
        child: Padding(
          padding: p16,
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
                    color: colorGreyLight,
                  ),
                ],
              ),
              gapx8,
              Text('Types', style: textStyle.titleSmall),
              Wrap(
                spacing: size8,
                children: types
                    .map((type) => ElevatedButton(
                        onPressed: () {
                          ref
                              .read(locationsProvider.notifier)
                              .loadLocationsFilter(
                                filter: 'type',
                                query: type,
                              );
                          context.pop();
                        },
                        child: Text(type)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
