part of config.helpers;

String selectGender(Gender gender) {
  switch (gender) {
    case Gender.female:
      return 'female';
    case Gender.male:
      return 'male';
    case Gender.genderless:
      return 'genderless';
    case Gender.unknown:
    default:
      return 'unknown';
  }
}
