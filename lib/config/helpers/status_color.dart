part of config.helpers;

Color statusColor(Status status) {
  switch (status) {
    case Status.alive:
      return colorAlive;
    case Status.dead:
      return colorDead;
    case Status.unknown:
    default:
      return colorGray;
  }
}
