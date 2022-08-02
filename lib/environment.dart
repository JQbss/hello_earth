enum Environment {
  dev(
    value: "dev",
  ),
  prod(
    value: "prod",
  );

  final String value;

  const Environment({
    required this.value,
  });
}
