class BitolaHelper {
  static double bitola110(double corrente, double distancia) =>
      (2 * corrente * distancia) / 294.64;

  static double bitola220(double corrente, double distancia) =>
      (2 * corrente * distancia) / 510.4;
}