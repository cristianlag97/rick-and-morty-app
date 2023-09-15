part of config.helpers.enums;

enum Status {
  alive,
  dead,
  unknown,
}

final statusValues = EnumValues({
  "Alive": Status.alive,
  "Dead": Status.dead,
  "unknown": Status.unknown,
});
