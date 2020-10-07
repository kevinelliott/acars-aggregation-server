class Icao {
  Icao();

  static String uintShiftAndHex(value) =>
      value == null ? null : (value & 0xffffff).toRadixString(16);
}
