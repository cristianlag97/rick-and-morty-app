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
        context.push('/home/0/result/${result.id}/$nameListView');
      },
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: colorGreyLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
