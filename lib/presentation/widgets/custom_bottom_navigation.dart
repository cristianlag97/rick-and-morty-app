part of presentation.widgets;

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({required this.currentIndex, super.key});

  final int currentIndex;

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final appNotifier = ref.read(appProviderState.notifier);

    return BottomNavigationBar(
        onTap: (int index) => appNotifier
            .handleCurrentPage(index)
            .then((_) => onItemTapped(context, index)),
        elevation: 0,
        currentIndex: currentIndex,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.primary.withOpacity(0.3),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Character',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: 'Episode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Location',
          ),
        ]);
  }
}
