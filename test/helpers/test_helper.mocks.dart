// Mocks generated by Mockito 5.3.2 from annotations
// in shamo_app/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;
import 'dart:convert' as _i27;
import 'dart:typed_data' as _i28;

import 'package:dartz/dartz.dart' as _i4;
import 'package:flutter/src/widgets/navigator.dart' as _i10;
import 'package:flutter_bloc/flutter_bloc.dart' as _i25;
import 'package:http/io_client.dart' as _i8;
import 'package:http/src/base_request.dart' as _i26;
import 'package:http/src/response.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart'
    as _i17;
import 'package:shamo_app/data/datasources/product_remote_data_source.dart'
    as _i11;
import 'package:shamo_app/data/models/category_model.dart' as _i14;
import 'package:shamo_app/data/models/checkout_body_model.dart' as _i16;
import 'package:shamo_app/data/models/checkout_response.dart' as _i2;
import 'package:shamo_app/data/models/product_model.dart' as _i13;
import 'package:shamo_app/data/models/transaction_model.dart' as _i15;
import 'package:shamo_app/data/models/user_model.dart' as _i3;
import 'package:shamo_app/domain/entities/category.dart' as _i21;
import 'package:shamo_app/domain/entities/checkout_body.dart' as _i23;
import 'package:shamo_app/domain/entities/product.dart' as _i20;
import 'package:shamo_app/domain/entities/transaction.dart' as _i22;
import 'package:shamo_app/domain/entities/user.dart' as _i24;
import 'package:shamo_app/domain/repositories/auth_repository.dart' as _i5;
import 'package:shamo_app/domain/repositories/product_repository.dart' as _i18;
import 'package:shamo_app/domain/usecases/user_login.dart' as _i6;
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart' as _i7;
import 'package:shamo_app/utilities/failure.dart' as _i19;

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

class _FakeAuthRepository_3 extends _i1.SmartFake
    implements _i5.AuthRepository {
  _FakeAuthRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserLogin_4 extends _i1.SmartFake implements _i6.UserLogin {
  _FakeUserLogin_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthState_5 extends _i1.SmartFake implements _i7.AuthState {
  _FakeAuthState_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_6 extends _i1.SmartFake
    implements _i8.IOStreamedResponse {
  _FakeIOStreamedResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_7 extends _i1.SmartFake implements _i9.Response {
  _FakeResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i10.NavigatorObserver {
  MockNavigatorObserver() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void didPush(
    _i10.Route<dynamic>? route,
    _i10.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPush,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didPop(
    _i10.Route<dynamic>? route,
    _i10.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPop,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didRemove(
    _i10.Route<dynamic>? route,
    _i10.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didRemove,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didReplace({
    _i10.Route<dynamic>? newRoute,
    _i10.Route<dynamic>? oldRoute,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #didReplace,
          [],
          {
            #newRoute: newRoute,
            #oldRoute: oldRoute,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didStartUserGesture(
    _i10.Route<dynamic>? route,
    _i10.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didStartUserGesture,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didStopUserGesture() => super.noSuchMethod(
        Invocation.method(
          #didStopUserGesture,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ProductRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemoteDataSource extends _i1.Mock
    implements _i11.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<List<_i13.ProductModel>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i12.Future<List<_i13.ProductModel>>.value(<_i13.ProductModel>[]),
      ) as _i12.Future<List<_i13.ProductModel>>);
  @override
  _i12.Future<List<_i14.CategoryModel>> getProductCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductCategories,
          [],
        ),
        returnValue:
            _i12.Future<List<_i14.CategoryModel>>.value(<_i14.CategoryModel>[]),
      ) as _i12.Future<List<_i14.CategoryModel>>);
  @override
  _i12.Future<List<_i15.TransactionModel>> getTransactions(
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
        returnValue: _i12.Future<List<_i15.TransactionModel>>.value(
            <_i15.TransactionModel>[]),
      ) as _i12.Future<List<_i15.TransactionModel>>);
  @override
  _i12.Future<_i2.CheckoutResponse> checkout(
    String? token,
    _i16.CheckoutBodyModel? checkoutData,
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
            _i12.Future<_i2.CheckoutResponse>.value(_FakeCheckoutResponse_0(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i12.Future<_i2.CheckoutResponse>);
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i17.AuthRemoteDataSource {
  MockAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i3.UserModel> getUser(String? token) => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [token],
        ),
        returnValue: _i12.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #getUser,
            [token],
          ),
        )),
      ) as _i12.Future<_i3.UserModel>);
  @override
  _i12.Future<_i3.UserModel> register(
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
        returnValue: _i12.Future<_i3.UserModel>.value(_FakeUserModel_1(
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
      ) as _i12.Future<_i3.UserModel>);
  @override
  _i12.Future<_i3.UserModel> login(
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
        returnValue: _i12.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i12.Future<_i3.UserModel>);
  @override
  _i12.Future<_i3.UserModel> updateProfile(
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
        returnValue: _i12.Future<_i3.UserModel>.value(_FakeUserModel_1(
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
      ) as _i12.Future<_i3.UserModel>);
  @override
  _i12.Future<bool> logout(String? token) => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i18.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i4.Either<_i19.Failure, List<_i20.Product>>> getProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i12.Future<_i4.Either<_i19.Failure, List<_i20.Product>>>.value(
                _FakeEither_2<_i19.Failure, List<_i20.Product>>(
          this,
          Invocation.method(
            #getProducts,
            [],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, List<_i20.Product>>>);
  @override
  _i12.Future<
      _i4
          .Either<_i19.Failure, List<_i21.Category>>> getProductCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductCategories,
          [],
        ),
        returnValue:
            _i12.Future<_i4.Either<_i19.Failure, List<_i21.Category>>>.value(
                _FakeEither_2<_i19.Failure, List<_i21.Category>>(
          this,
          Invocation.method(
            #getProductCategories,
            [],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, List<_i21.Category>>>);
  @override
  _i12.Future<_i4.Either<_i19.Failure, List<_i22.Transaction>>> getTransactions(
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
            _i12.Future<_i4.Either<_i19.Failure, List<_i22.Transaction>>>.value(
                _FakeEither_2<_i19.Failure, List<_i22.Transaction>>(
          this,
          Invocation.method(
            #getTransactions,
            [
              idUser,
              token,
            ],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, List<_i22.Transaction>>>);
  @override
  _i12.Future<_i4.Either<_i19.Failure, String>> checkout(
    String? token,
    _i23.CheckoutBody? checkoutData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkout,
          [
            token,
            checkoutData,
          ],
        ),
        returnValue: _i12.Future<_i4.Either<_i19.Failure, String>>.value(
            _FakeEither_2<_i19.Failure, String>(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, String>>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i5.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i4.Either<_i19.Failure, _i24.User>> getUser(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [token],
        ),
        returnValue: _i12.Future<_i4.Either<_i19.Failure, _i24.User>>.value(
            _FakeEither_2<_i19.Failure, _i24.User>(
          this,
          Invocation.method(
            #getUser,
            [token],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, _i24.User>>);
  @override
  _i12.Future<_i4.Either<_i19.Failure, _i24.User>> register(
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
        returnValue: _i12.Future<_i4.Either<_i19.Failure, _i24.User>>.value(
            _FakeEither_2<_i19.Failure, _i24.User>(
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
      ) as _i12.Future<_i4.Either<_i19.Failure, _i24.User>>);
  @override
  _i12.Future<_i4.Either<_i19.Failure, _i24.User>> login(
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
        returnValue: _i12.Future<_i4.Either<_i19.Failure, _i24.User>>.value(
            _FakeEither_2<_i19.Failure, _i24.User>(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, _i24.User>>);
  @override
  _i12.Future<_i4.Either<_i19.Failure, _i24.User>> updateProfile(
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
        returnValue: _i12.Future<_i4.Either<_i19.Failure, _i24.User>>.value(
            _FakeEither_2<_i19.Failure, _i24.User>(
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
      ) as _i12.Future<_i4.Either<_i19.Failure, _i24.User>>);
  @override
  _i12.Future<_i4.Either<_i19.Failure, bool>> logout(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i12.Future<_i4.Either<_i19.Failure, bool>>.value(
            _FakeEither_2<_i19.Failure, bool>(
          this,
          Invocation.method(
            #logout,
            [token],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, bool>>);
}

/// A class which mocks [UserLogin].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLogin extends _i1.Mock implements _i6.UserLogin {
  MockUserLogin() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.AuthRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeAuthRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.AuthRepository);
  @override
  _i12.Future<_i4.Either<_i19.Failure, _i24.User>> execute(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            email,
            password,
          ],
        ),
        returnValue: _i12.Future<_i4.Either<_i19.Failure, _i24.User>>.value(
            _FakeEither_2<_i19.Failure, _i24.User>(
          this,
          Invocation.method(
            #execute,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i12.Future<_i4.Either<_i19.Failure, _i24.User>>);
}

/// A class which mocks [AuthBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthBloc extends _i1.Mock implements _i7.AuthBloc {
  MockAuthBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.UserLogin get userLogin => (super.noSuchMethod(
        Invocation.getter(#userLogin),
        returnValue: _FakeUserLogin_4(
          this,
          Invocation.getter(#userLogin),
        ),
      ) as _i6.UserLogin);
  @override
  _i7.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_5(
          this,
          Invocation.getter(#state),
        ),
      ) as _i7.AuthState);
  @override
  _i12.Stream<_i7.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i12.Stream<_i7.AuthState>.empty(),
      ) as _i12.Stream<_i7.AuthState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void add(_i7.AuthEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i7.AuthEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i7.AuthState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i7.AuthEvent>(
    _i25.EventHandler<E, _i7.AuthState>? handler, {
    _i25.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i25.Transition<_i7.AuthEvent, _i7.AuthState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i12.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  void onChange(_i25.Change<_i7.AuthState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i8.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i8.IOStreamedResponse> send(_i26.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i12.Future<_i8.IOStreamedResponse>.value(_FakeIOStreamedResponse_6(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i12.Future<_i8.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i12.Future<_i9.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i9.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i12.Future<_i9.Response>);
  @override
  _i12.Future<_i9.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i9.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i12.Future<_i9.Response>);
  @override
  _i12.Future<_i9.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
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
        returnValue: _i12.Future<_i9.Response>.value(_FakeResponse_7(
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
      ) as _i12.Future<_i9.Response>);
  @override
  _i12.Future<_i9.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
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
        returnValue: _i12.Future<_i9.Response>.value(_FakeResponse_7(
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
      ) as _i12.Future<_i9.Response>);
  @override
  _i12.Future<_i9.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
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
        returnValue: _i12.Future<_i9.Response>.value(_FakeResponse_7(
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
      ) as _i12.Future<_i9.Response>);
  @override
  _i12.Future<_i9.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i27.Encoding? encoding,
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
        returnValue: _i12.Future<_i9.Response>.value(_FakeResponse_7(
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
      ) as _i12.Future<_i9.Response>);
  @override
  _i12.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<String>.value(''),
      ) as _i12.Future<String>);
  @override
  _i12.Future<_i28.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i28.Uint8List>.value(_i28.Uint8List(0)),
      ) as _i12.Future<_i28.Uint8List>);
}
