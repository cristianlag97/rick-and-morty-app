part of presentation.widgets.bottomshhet;

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key, required this.deleteFilter});

  final VoidCallback deleteFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      child: ElevatedButton(
          onPressed: () {
            context.pop();
            deleteFilter();
          },
          child: const Text('Quitar filtro')),
    );
  }
}
