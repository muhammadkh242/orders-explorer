enum ErrorType {
  fileNotFound,
  invalidJson,
  unknown;

  String get message {
    switch (this) {
      case ErrorType.fileNotFound:
        return "JSON file not found in assets";
      case ErrorType.invalidJson:
        return "Invalid JSON format";
      case ErrorType.unknown:
        return "Something went wrong";
    }
  }
}
