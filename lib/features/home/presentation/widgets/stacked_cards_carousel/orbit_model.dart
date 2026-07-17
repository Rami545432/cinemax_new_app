class OrbitSlot {
  final int offset; // -half..half
  final double x;
  final double y;
  final double rotation;
  final double scale;
  final double opacity;
  final double z;

  const OrbitSlot({
    required this.offset,
    required this.x,
    required this.y,
    required this.rotation,
    required this.scale,
    required this.opacity,
    required this.z,
  });
}
