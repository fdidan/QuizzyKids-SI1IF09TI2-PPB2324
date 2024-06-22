
class Question{
  final String imageUri;
  final String id;
  final String title;

  final Map<String, dynamic> options;

  Question({
    required this.id,
    required this.imageUri,
    required this.title,
    required this.options
  });

  @override
  String toString(){
    return 'Question(id: $id, imageURI: $imageUri, title: $title, options: $options)';
  }

}