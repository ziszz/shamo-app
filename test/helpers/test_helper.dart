import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart';
import 'package:shamo_app/data/datasources/product_remote_data_source.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';

@GenerateMocks([
  ProductRemoteDataSource,
  AuthRemoteDataSource,
  ProductRepository,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
