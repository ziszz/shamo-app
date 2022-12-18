import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:product/data/datasources/product_remote_data_source.dart';
import 'package:product/domain/repositories/product_repository.dart';

@GenerateMocks([
  ProductRemoteDataSource,
  ProductRepository,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient),
])
void main() {}
