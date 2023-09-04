part of infraestructure.models;

class ModelCharacters {
  final ModelInfo info;
  final List<ModelResult> results;

  ModelCharacters({
    required this.info,
    required this.results,
  });

  ModelCharacters.fromJson(Map<String, dynamic> json)
      : info = ModelInfo.fromJson(json["info"]),
        results = List<ModelResult>.from(
            json["results"].map((x) => ModelResult.fromJson(x)));
}
