// Mocks generated by Mockito 5.3.2 from annotations
// in product/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i24;
import 'dart:typed_data' as _i25;

import 'package:core/core.dart' as _i13;
import 'package:dartz/dartz.dart' as _i3;
import 'package:http/io_client.dart' as _i4;
import 'package:http/src/base_request.dart' as _i23;
import 'package:http/src/response.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:product/data/datasources/product_remote_data_source.dart'
    as _i6;
import 'package:product/data/models/category_model.dart' as _i9;
import 'package:product/data/models/checkout_body_model.dart' as _i11;
import 'package:product/data/models/checkout_response.dart' as _i2;
import 'package:product/data/models/product_model.dart' as _i8;
import 'package:product/data/models/transaction_model.dart' as _i10;
import 'package:product/domain/entities/category.dart' as _i15;
import 'package:product/domain/entities/checkout_body.dart' as _i17;
import 'package:product/domain/entities/product.dart' as _i14;
import 'package:product/domain/entities/transaction.dart' as _i16;
import 'package:product/domain/repositories/product_repository.dart' as _i12;
import 'package:product/domain/usecases/checkout.dart' as _i22;
import 'package:product/domain/usecases/get_categories.dart' as _i20;
import 'package:product/domain/usecases/get_products.dart' as _i18;
import 'package:product/domain/usecases/get_products_by_category.dart' as _i19;
import 'package:product/domain/usecases/get_transactions.dart' as _i21;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCheckoutResponse_0 extends _i1.SmartFake
    implements _i2.CheckoutResponse {
  _FakeCheckoutResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_2 extends _i1.SmartFake
    implements _i4.IOStreamedResponse {
  _FakeIOStreamedResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemoteDataSource extends _i1.Mock
    implements _i6.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i8.ProductModel>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i7.Future<List<_i8.ProductModel>>.value(<_i8.ProductModel>[]),
      ) as _i7.Future<List<_i8.ProductModel>>);
  @override
  _i7.Future<List<_i8.ProductModel>> getProductsByCategory(int? categoryId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductsByCategory,
          [categoryId],
        ),
        returnValue:
            _i7.Future<List<_i8.ProductModel>>.value(<_i8.ProductModel>[]),
      ) as _i7.Future<List<_i8.ProductModel>>);
  @override
  _i7.Future<List<_i9.CategoryModel>> getProductCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductCategories,
          [],
        ),
        returnValue:
            _i7.Future<List<_i9.CategoryModel>>.value(<_i9.CategoryModel>[]),
      ) as _i7.Future<List<_i9.CategoryModel>>);
  @override
  _i7.Future<List<_i10.TransactionModel>> getTransactions(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTransactions,
          [token],
        ),
        returnValue: _i7.Future<List<_i10.TransactionModel>>.value(
            <_i10.TransactionModel>[]),
      ) as _i7.Future<List<_i10.TransactionModel>>);
  @override
  _i7.Future<_i2.CheckoutResponse> checkout(
    String? token,
    _i11.CheckoutBodyModel? checkoutData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkout,
          [
            token,
            checkoutData,
          ],
        ),
        returnValue:
            _i7.Future<_i2.CheckoutResponse>.value(_FakeCheckoutResponse_0(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i7.Future<_i2.CheckoutResponse>);
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i12.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>> getProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>.value(
                _FakeEither_1<_i13.Failure, List<_i14.Product>>(
          this,
          Invocation.method(
            #getProducts,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>);
  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>
      getProductsByCategory(int? categoryId) => (super.noSuchMethod(
            Invocation.method(
              #getProductsByCategory,
              [categoryId],
            ),
            returnValue:
                _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>.value(
                    _FakeEither_1<_i13.Failure, List<_i14.Product>>(
              this,
              Invocation.method(
                #getProductsByCategory,
                [categoryId],
              ),
            )),
          ) as _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>);
  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i15.Category>>>
      getProductCategories() => (super.noSuchMethod(
            Invocation.method(
              #getProductCategories,
              [],
            ),
            returnValue:
                _i7.Future<_i3.Either<_i13.Failure, List<_i15.Category>>>.value(
                    _FakeEither_1<_i13.Failure, List<_i15.Category>>(
              this,
              Invocation.method(
                #getProductCategories,
                [],
              ),
            )),
          ) as _i7.Future<_i3.Either<_i13.Failure, List<_i15.Category>>>);
  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i16.Transaction>>> getTransactions(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTransactions,
          [token],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i13.Failure, List<_i16.Transaction>>>.value(
                _FakeEither_1<_i13.Failure, List<_i16.Transaction>>(
          this,
          Invocation.method(
            #getTransactions,
            [token],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, List<_i16.Transaction>>>);
  @override
  _i7.Future<_i3.Either<_i13.Failure, String>> checkout(
    String? token,
    _i17.CheckoutBody? checkoutData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkout,
          [
            token,
            checkoutData,
          ],
        ),
        returnValue: _i7.Future<_i3.Either<_i13.Failure, String>>.value(
            _FakeEither_1<_i13.Failure, String>(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, String>>);
}

/// A class which mocks [GetProducts].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProducts extends _i1.Mock implements _i18.GetProducts {
  MockGetProducts() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>.value(
                _FakeEither_1<_i13.Failure, List<_i14.Product>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>);
}

/// A class which mocks [GetProductsByCategory].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProductsByCategory extends _i1.Mock
    implements _i19.GetProductsByCategory {
  MockGetProductsByCategory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>> execute(
          int? categoryId) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [categoryId],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>.value(
                _FakeEither_1<_i13.Failure, List<_i14.Product>>(
          this,
          Invocation.method(
            #execute,
            [categoryId],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, List<_i14.Product>>>);
}

/// A class which mocks [GetCategories].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCategories extends _i1.Mock implements _i20.GetCategories {
  MockGetCategories() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i15.Category>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i13.Failure, List<_i15.Category>>>.value(
                _FakeEither_1<_i13.Failure, List<_i15.Category>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, List<_i15.Category>>>);
}

/// A class which mocks [GetTransactions].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTransactions extends _i1.Mock implements _i21.GetTransactions {
  MockGetTransactions() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i13.Failure, List<_i16.Transaction>>> execute(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [token],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i13.Failure, List<_i16.Transaction>>>.value(
                _FakeEither_1<_i13.Failure, List<_i16.Transaction>>(
          this,
          Invocation.method(
            #execute,
            [token],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, List<_i16.Transaction>>>);
}

/// A class which mocks [Checkout].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckout extends _i1.Mock implements _i22.Checkout {
  MockCheckout() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i13.Failure, String>> execute(
    String? token,
    _i17.CheckoutBody? checkoutData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            token,
            checkoutData,
          ],
        ),
        returnValue: _i7.Future<_i3.Either<_i13.Failure, String>>.value(
            _FakeEither_1<_i13.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i13.Failure, String>>);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i4.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i4.IOStreamedResponse> send(_i23.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i7.Future<_i4.IOStreamedResponse>.value(_FakeIOStreamedResponse_2(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i7.Future<_i4.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i25.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i25.Uint8List>.value(_i25.Uint8List(0)),
      ) as _i7.Future<_i25.Uint8List>);
}
