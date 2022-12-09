class ServerException implements Exception {}

class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});
}

class DatabaseException implements Exception {
  final String message;

  const DatabaseException({required this.message});
}
