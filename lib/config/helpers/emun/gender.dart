part of config.helpers.enums;

enum Gender {
  female,
  male,
  genderless,
  unknown,
}

final genderValues = EnumValues({
  "Female": Gender.female,
  "Male": Gender.male,
  "unknown": Gender.unknown,
  "Genderless": Gender.genderless,
});
