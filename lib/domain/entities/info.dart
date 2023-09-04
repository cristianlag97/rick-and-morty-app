part of domain.entities;

class Info {
  final int count;
  final int pages;
  final String next;
  final String? prev;

  const Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
}
