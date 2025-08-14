class GitLabLocation {
  final String path;
  final int beginLine;

  GitLabLocation({
    required this.path,
    required this.beginLine,
  });

  Map<String, dynamic> toJson() => {
        'path': path,
        'lines': {
          'begin': beginLine,
        },
      };
}
