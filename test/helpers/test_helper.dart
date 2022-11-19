import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:shamo_app/data/datasources/product_remote_data_source.dart';

@GenerateMocks([
  ProductRemoteDataSource,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
