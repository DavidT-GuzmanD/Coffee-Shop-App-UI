class Coffee {
  final String id;
  final String nombre;
  final String categoria;
  final String tipo;
  final String ingredientes;
  final String descripcion;
  final double precio;
  final double rating;
  final int reviewCount;
  final List<String> tamanos;
  final String imagen;

  Coffee({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.tipo,
    required this.ingredientes,
    required this.descripcion,
    required this.precio,
    required this.rating,
    required this.reviewCount,
    required this.tamanos,
    required this.imagen,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      categoria: json['categoria'] as String,
      tipo: json['tipo'] as String,
      ingredientes: json['ingredientes'] as String,
      descripcion: json['descripcion'] as String,
      precio: (json['precio'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['review_count'] as int,
      tamanos: List<String>.from(json['tamanos']),
      imagen: json['imagen'] as String,
    );
  }
}
