part of presentation.widgets;

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.result,
    required this.child,
    required this.nameListView,
  });

  final Result result;
  final Widget child;
  final String nameListView;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/result/${result.id}/$nameListView');
      },
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
