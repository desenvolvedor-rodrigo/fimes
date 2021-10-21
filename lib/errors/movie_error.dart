/*
  Personalização das mensagens de erro
*/

abstract class MovieError implements Exception {
  String message = '';

  MovieError(this.message);

  @override
  String toString() {
    return message;
  }
}

class MovieRepositoryError extends MovieError {
  MovieRepositoryError(String message) : super('') {
    this.message = message;
  }
}