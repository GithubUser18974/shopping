class AppModel {
  final String text;
  final int id;

  const AppModel({
    required this.text,
    required this.id,
  });

  @override
    bool operator ==(Object other) {
      return other is AppModel && other.text == text;
    }

    @override
    int get hashCode => text.hashCode;
}
