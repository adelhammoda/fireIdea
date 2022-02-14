class Project {
  final String id;
  final String name;
  final String type;
  final String imageURL;
  final String description;
  final List subImage;

  const Project({
    required this.id,
    required this.subImage,
    required this.type,
    required this.name,
    required this.imageURL,
    required this.description,
  });

  factory Project.formJSON(Map<String, dynamic> data, String id){
    return Project(
        id: id,
        subImage: data['subImage'],
        type: data['type'],
        name: data['name'],
        imageURL: data['imageURL'],
        description: data['description'] );
  }

  //TODO:Create TO JSON function


}