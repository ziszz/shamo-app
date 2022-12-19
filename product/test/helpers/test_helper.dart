import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:product/data/datasources/product_remote_data_source.dart';
import 'package:product/domain/repositories/product_repository.dart';
import 'package:product/domain/usecases/checkout.dart';
import 'package:product/domain/usecases/get_product_categories.dart';
import 'package:product/domain/usecases/get_products.dart';
import 'package:product/domain/usecases/get_transactions.dart';

@GenerateMocks([
  ProductRemoteDataSource,
  ProductRepository,
  GetProducts,
  GetProductCategories,
  GetTransactions,
  Checkout,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient),
])
void main() {}
