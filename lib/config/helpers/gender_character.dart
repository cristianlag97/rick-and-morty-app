part of config.helpers;

IconData genderCharacter(Gender gender) {
  switch (gender) {
    case Gender.female:
      return Icons.female_outlined;
    case Gender.male:
      return Icons.male_outlined;
    case Gender.unknown:
    default:
      return Icons.not_interested_sharp;
  }
}
