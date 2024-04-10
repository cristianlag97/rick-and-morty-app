part of config.helpers;

Color statusColor(Status status) {
  switch (status) {
    case Status.alive:
      return aliveColor;
    case Status.dead:
      return deadColor;
    case Status.unknown:
    default:
      return greyColor;
  }
}
