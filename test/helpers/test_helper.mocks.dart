// Mocks generated by Mockito 5.3.2 from annotations
// in shamo_app/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i23;
import 'dart:typed_data' as _i24;

import 'package:dartz/dartz.dart' as _i4;
import 'package:http/io_client.dart' as _i5;
import 'package:http/src/base_request.dart' as _i22;
import 'package:http/src/response.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart'
    as _i13;
import 'package:shamo_app/data/datasources/product_remote_data_source.dart'
    as _i7;
import 'package:shamo_app/data/models/category_model.dart' as _i10;
import 'package:shamo_app/data/models/checkout_body_model.dart' as _i12;
import 'package:shamo_app/data/models/checkout_response.dart' as _i2;
import 'package:shamo_app/data/models/product_model.dart' as _i9;
import 'package:shamo_app/data/models/transaction_model.dart' as _i11;
import 'package:shamo_app/data/models/user_model.dart' as _i3;
import 'package:shamo_app/domain/entities/category.dart' as _i17;
import 'package:shamo_app/domain/entities/checkout_body.dart' as _i19;
import 'package:shamo_app/domain/entities/product.dart' as _i16;
import 'package:shamo_app/domain/entities/transaction.dart' as _i18;
import 'package:shamo_app/domain/entities/user.dart' as _i21;
import 'package:shamo_app/domain/repositories/auth_repository.dart' as _i20;
import 'package:shamo_app/domain/repositories/product_repository.dart' as _i14;
import 'package:shamo_app/utilities/failure.dart' as _i15;

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

class _FakeUserModel_1 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_3 extends _i1.SmartFake
    implements _i5.IOStreamedResponse {
  _FakeIOStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
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
    implements _i7.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i9.ProductModel>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i8.Future<List<_i9.ProductModel>>.value(<_i9.ProductModel>[]),
      ) as _i8.Future<List<_i9.ProductModel>>);
  @override
  _i8.Future<List<_i10.CategoryModel>> getProductCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductCategories,
          [],
        ),
        returnValue:
            _i8.Future<List<_i10.CategoryModel>>.value(<_i10.CategoryModel>[]),
      ) as _i8.Future<List<_i10.CategoryModel>>);
  @override
  _i8.Future<List<_i11.TransactionModel>> getTransactions(
    int? idUser,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTransactions,
          [
            idUser,
            token,
          ],
        ),
        returnValue: _i8.Future<List<_i11.TransactionModel>>.value(
            <_i11.TransactionModel>[]),
      ) as _i8.Future<List<_i11.TransactionModel>>);
  @override
  _i8.Future<_i2.CheckoutResponse> checkout(
    String? token,
    _i12.CheckoutBodyModel? checkoutData,
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
            _i8.Future<_i2.CheckoutResponse>.value(_FakeCheckoutResponse_0(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i8.Future<_i2.CheckoutResponse>);
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i13.AuthRemoteDataSource {
  MockAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i3.UserModel> getUser(String? token) => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [token],
        ),
        returnValue: _i8.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #getUser,
            [token],
          ),
        )),
      ) as _i8.Future<_i3.UserModel>);
  @override
  _i8.Future<_i3.UserModel> register(
    String? name,
    String? email,
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [
            name,
            email,
            username,
            password,
          ],
        ),
        returnValue: _i8.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #register,
            [
              name,
              email,
              username,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i3.UserModel>);
  @override
  _i8.Future<_i3.UserModel> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i3.UserModel>);
  @override
  _i8.Future<_i3.UserModel> updateProfile(
    String? token,
    String? name,
    String? email,
    String? username,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProfile,
          [
            token,
            name,
            email,
            username,
          ],
        ),
        returnValue: _i8.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #updateProfile,
            [
              token,
              name,
              email,
              username,
            ],
          ),
        )),
      ) as _i8.Future<_i3.UserModel>);
  @override
  _i8.Future<bool> logout(String? token) => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i14.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i4.Either<_i15.Failure, List<_i16.Product>>> getProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i8.Future<_i4.Either<_i15.Failure, List<_i16.Product>>>.value(
                _FakeEither_2<_i15.Failure, List<_i16.Product>>(
          this,
          Invocation.method(
            #getProducts,
            [],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, List<_i16.Product>>>);
  @override
  _i8.Future<_i4.Either<_i15.Failure, List<_i17.Category>>>
      getProductCategories() => (super.noSuchMethod(
            Invocation.method(
              #getProductCategories,
              [],
            ),
            returnValue:
                _i8.Future<_i4.Either<_i15.Failure, List<_i17.Category>>>.value(
                    _FakeEither_2<_i15.Failure, List<_i17.Category>>(
              this,
              Invocation.method(
                #getProductCategories,
                [],
              ),
            )),
          ) as _i8.Future<_i4.Either<_i15.Failure, List<_i17.Category>>>);
  @override
  _i8.Future<_i4.Either<_i15.Failure, List<_i18.Transaction>>> getTransactions(
    int? idUser,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTransactions,
          [
            idUser,
            token,
          ],
        ),
        returnValue:
            _i8.Future<_i4.Either<_i15.Failure, List<_i18.Transaction>>>.value(
                _FakeEither_2<_i15.Failure, List<_i18.Transaction>>(
          this,
          Invocation.method(
            #getTransactions,
            [
              idUser,
              token,
            ],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, List<_i18.Transaction>>>);
  @override
  _i8.Future<_i4.Either<_i15.Failure, String>> checkout(
    String? token,
    _i19.CheckoutBody? checkoutData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkout,
          [
            token,
            checkoutData,
          ],
        ),
        returnValue: _i8.Future<_i4.Either<_i15.Failure, String>>.value(
            _FakeEither_2<_i15.Failure, String>(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, String>>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i20.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i4.Either<_i15.Failure, _i21.User>> getUser(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [token],
        ),
        returnValue: _i8.Future<_i4.Either<_i15.Failure, _i21.User>>.value(
            _FakeEither_2<_i15.Failure, _i21.User>(
          this,
          Invocation.method(
            #getUser,
            [token],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, _i21.User>>);
  @override
  _i8.Future<_i4.Either<_i15.Failure, _i21.User>> register(
    String? name,
    String? email,
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [
            name,
            email,
            username,
            password,
          ],
        ),
        returnValue: _i8.Future<_i4.Either<_i15.Failure, _i21.User>>.value(
            _FakeEither_2<_i15.Failure, _i21.User>(
          this,
          Invocation.method(
            #register,
            [
              name,
              email,
              username,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, _i21.User>>);
  @override
  _i8.Future<_i4.Either<_i15.Failure, _i21.User>> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<_i4.Either<_i15.Failure, _i21.User>>.value(
            _FakeEither_2<_i15.Failure, _i21.User>(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, _i21.User>>);
  @override
  _i8.Future<_i4.Either<_i15.Failure, _i21.User>> updateProfile(
    String? token,
    String? name,
    String? email,
    String? username,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProfile,
          [
            token,
            name,
            email,
            username,
          ],
        ),
        returnValue: _i8.Future<_i4.Either<_i15.Failure, _i21.User>>.value(
            _FakeEither_2<_i15.Failure, _i21.User>(
          this,
          Invocation.method(
            #updateProfile,
            [
              token,
              name,
              email,
              username,
            ],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, _i21.User>>);
  @override
  _i8.Future<_i4.Either<_i15.Failure, bool>> logout(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i8.Future<_i4.Either<_i15.Failure, bool>>.value(
            _FakeEither_2<_i15.Failure, bool>(
          this,
          Invocation.method(
            #logout,
            [token],
          ),
        )),
      ) as _i8.Future<_i4.Either<_i15.Failure, bool>>);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i5.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.IOStreamedResponse> send(_i22.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i5.IOStreamedResponse>.value(_FakeIOStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i5.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
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
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
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
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
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
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
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
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i24.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i24.Uint8List>.value(_i24.Uint8List(0)),
      ) as _i8.Future<_i24.Uint8List>);
}
