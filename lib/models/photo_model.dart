class Photo {
  final int id;
  final int sol;
  final String camera;
  final String imgSrc;

  Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      sol: json['sol'],
      camera: json['camera']['name'],
      imgSrc: json['img_src'],
    );
  }
}
