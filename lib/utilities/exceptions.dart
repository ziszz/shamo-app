class ServerException implements Exception {}

class CacheException implements Exception {
  final String message;

  const CacheException(this.message);
}
