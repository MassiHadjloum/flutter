class Dikr {
  final String id;
  final String? istiada;
  final String? basmala;
  final String name;
  final String? faida;
  int tikrar;
  int? total;

  Dikr({
    required this.id,
    this.istiada,
    this.basmala,
    required this.name,
    this.faida,
    required this.tikrar,
    this.total
  });

  /* @override
  String toString() {
    return name + faida!;
  } */
  @override
  String toString() {
    return "{id: $id, name: $name, tikrar: $tikrar}";
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'tikrar': tikrar,
      'total': total!,
    };
  }

  factory Dikr.fromMap(Map<String, dynamic> data) {
    return Dikr(
      id: data['_id'].toString(),
      name: data['name'],
      tikrar: data['tikrar'] as int,
      total: data['total'] as int
    );
  }
}

