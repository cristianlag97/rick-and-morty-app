part of infraestructure.models;

class ModelInfo {
  final int count;
  final int pages;
  final String next;
  final String prev;

  ModelInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  ModelInfo.fromJson(Map<String, dynamic> json)
      : count = json["count"] ?? '',
        pages = json["pages"] ?? '',
        next = json["next"] ?? '',
        prev = json["prev"] ?? '';
}
