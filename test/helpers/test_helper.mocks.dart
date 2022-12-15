// Mocks generated by Mockito 5.3.2 from annotations
// in shamo_app/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i17;
import 'dart:convert' as _i33;
import 'dart:typed_data' as _i34;

import 'package:dartz/dartz.dart' as _i4;
import 'package:flutter_bloc/flutter_bloc.dart' as _i31;
import 'package:http/io_client.dart' as _i14;
import 'package:http/src/base_request.dart' as _i32;
import 'package:http/src/response.dart' as _i15;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart'
    as _i29;
import 'package:shamo_app/data/datasources/remote/auth_remote_data_source.dart'
    as _i22;
import 'package:shamo_app/data/datasources/remote/product_remote_data_source.dart'
    as _i16;
import 'package:shamo_app/data/models/category_model.dart' as _i19;
import 'package:shamo_app/data/models/checkout_body_model.dart' as _i21;
import 'package:shamo_app/data/models/checkout_response.dart' as _i2;
import 'package:shamo_app/data/models/product_model.dart' as _i18;
import 'package:shamo_app/data/models/transaction_model.dart' as _i20;
import 'package:shamo_app/data/models/user_model.dart' as _i3;
import 'package:shamo_app/domain/entities/category.dart' as _i26;
import 'package:shamo_app/domain/entities/checkout_body.dart' as _i28;
import 'package:shamo_app/domain/entities/product.dart' as _i25;
import 'package:shamo_app/domain/entities/transaction.dart' as _i27;
import 'package:shamo_app/domain/entities/user.dart' as _i30;
import 'package:shamo_app/domain/repositories/auth_repository.dart' as _i5;
import 'package:shamo_app/domain/repositories/product_repository.dart' as _i23;
import 'package:shamo_app/domain/usecases/get_user.dart' as _i9;
import 'package:shamo_app/domain/usecases/remove_active_user.dart' as _i12;
import 'package:shamo_app/domain/usecases/save_active_user.dart' as _i11;
import 'package:shamo_app/domain/usecases/update_profile.dart' as _i10;
import 'package:shamo_app/domain/usecases/user_login.dart' as _i6;
import 'package:shamo_app/domain/usecases/user_logout.dart' as _i8;
import 'package:shamo_app/domain/usecases/user_register.dart' as _i7;
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart' as _i13;
import 'package:shamo_app/utilities/failure.dart' as _i24;

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

class _FakeUserRegister_5 extends _i1.SmartFake implements _i7.UserRegister {
  _FakeUserRegister_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserLogout_6 extends _i1.SmartFake implements _i8.UserLogout {
  _FakeUserLogout_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetUser_7 extends _i1.SmartFake implements _i9.GetUser {
  _FakeGetUser_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpdateProfile_8 extends _i1.SmartFake implements _i10.UpdateProfile {
  _FakeUpdateProfile_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveActiveUser_9 extends _i1.SmartFake
    implements _i11.SaveActiveUser {
  _FakeSaveActiveUser_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveActiveUser_10 extends _i1.SmartFake
    implements _i12.RemoveActiveUser {
  _FakeRemoveActiveUser_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthState_11 extends _i1.SmartFake implements _i13.AuthState {
  _FakeAuthState_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_12 extends _i1.SmartFake
    implements _i14.IOStreamedResponse {
  _FakeIOStreamedResponse_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_13 extends _i1.SmartFake implements _i15.Response {
  _FakeResponse_13(
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
    implements _i16.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i17.Future<List<_i18.ProductModel>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i17.Future<List<_i18.ProductModel>>.value(<_i18.ProductModel>[]),
      ) as _i17.Future<List<_i18.ProductModel>>);
  @override
  _i17.Future<List<_i19.CategoryModel>> getProductCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductCategories,
          [],
        ),
        returnValue:
            _i17.Future<List<_i19.CategoryModel>>.value(<_i19.CategoryModel>[]),
      ) as _i17.Future<List<_i19.CategoryModel>>);
  @override
  _i17.Future<List<_i20.TransactionModel>> getTransactions(
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
        returnValue: _i17.Future<List<_i20.TransactionModel>>.value(
            <_i20.TransactionModel>[]),
      ) as _i17.Future<List<_i20.TransactionModel>>);
  @override
  _i17.Future<_i2.CheckoutResponse> checkout(
    String? token,
    _i21.CheckoutBodyModel? checkoutData,
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
            _i17.Future<_i2.CheckoutResponse>.value(_FakeCheckoutResponse_0(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i17.Future<_i2.CheckoutResponse>);
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i22.AuthRemoteDataSource {
  MockAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i17.Future<_i3.UserModel> getUser(String? token) => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [token],
        ),
        returnValue: _i17.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #getUser,
            [token],
          ),
        )),
      ) as _i17.Future<_i3.UserModel>);
  @override
  _i17.Future<_i3.UserModel> register(
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
        returnValue: _i17.Future<_i3.UserModel>.value(_FakeUserModel_1(
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
      ) as _i17.Future<_i3.UserModel>);
  @override
  _i17.Future<_i3.UserModel> login(
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
        returnValue: _i17.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i17.Future<_i3.UserModel>);
  @override
  _i17.Future<_i3.UserModel> updateProfile(
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
        returnValue: _i17.Future<_i3.UserModel>.value(_FakeUserModel_1(
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
      ) as _i17.Future<_i3.UserModel>);
  @override
  _i17.Future<bool> logout(String? token) => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i17.Future<bool>.value(false),
      ) as _i17.Future<bool>);
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i23.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i17.Future<_i4.Either<_i24.Failure, List<_i25.Product>>> getProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i17.Future<_i4.Either<_i24.Failure, List<_i25.Product>>>.value(
                _FakeEither_2<_i24.Failure, List<_i25.Product>>(
          this,
          Invocation.method(
            #getProducts,
            [],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, List<_i25.Product>>>);
  @override
  _i17.Future<
      _i4
          .Either<_i24.Failure, List<_i26.Category>>> getProductCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductCategories,
          [],
        ),
        returnValue:
            _i17.Future<_i4.Either<_i24.Failure, List<_i26.Category>>>.value(
                _FakeEither_2<_i24.Failure, List<_i26.Category>>(
          this,
          Invocation.method(
            #getProductCategories,
            [],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, List<_i26.Category>>>);
  @override
  _i17.Future<_i4.Either<_i24.Failure, List<_i27.Transaction>>> getTransactions(
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
            _i17.Future<_i4.Either<_i24.Failure, List<_i27.Transaction>>>.value(
                _FakeEither_2<_i24.Failure, List<_i27.Transaction>>(
          this,
          Invocation.method(
            #getTransactions,
            [
              idUser,
              token,
            ],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, List<_i27.Transaction>>>);
  @override
  _i17.Future<_i4.Either<_i24.Failure, String>> checkout(
    String? token,
    _i28.CheckoutBody? checkoutData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkout,
          [
            token,
            checkoutData,
          ],
        ),
        returnValue: _i17.Future<_i4.Either<_i24.Failure, String>>.value(
            _FakeEither_2<_i24.Failure, String>(
          this,
          Invocation.method(
            #checkout,
            [
              token,
              checkoutData,
            ],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, String>>);
}

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i29.AuthLocalDataSource {
  MockAuthLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i17.Future<bool> cacheToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #cacheToken,
          [token],
        ),
        returnValue: _i17.Future<bool>.value(false),
      ) as _i17.Future<bool>);
  @override
  _i17.Future<bool> clearTokenCache() => (super.noSuchMethod(
        Invocation.method(
          #clearTokenCache,
          [],
        ),
        returnValue: _i17.Future<bool>.value(false),
      ) as _i17.Future<bool>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i5.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> getUser(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [token],
        ),
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
          this,
          Invocation.method(
            #getUser,
            [token],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
  @override
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> register(
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
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
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
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
  @override
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> login(
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
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
  @override
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> updateProfile(
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
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
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
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
  @override
  _i17.Future<_i4.Either<_i24.Failure, bool>> logout(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i17.Future<_i4.Either<_i24.Failure, bool>>.value(
            _FakeEither_2<_i24.Failure, bool>(
          this,
          Invocation.method(
            #logout,
            [token],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, bool>>);
  @override
  _i17.Future<bool> cacheToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #cacheToken,
          [token],
        ),
        returnValue: _i17.Future<bool>.value(false),
      ) as _i17.Future<bool>);
  @override
  _i17.Future<bool> clearTokenCache() => (super.noSuchMethod(
        Invocation.method(
          #clearTokenCache,
          [],
        ),
        returnValue: _i17.Future<bool>.value(false),
      ) as _i17.Future<bool>);
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
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> execute(
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
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
          this,
          Invocation.method(
            #execute,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
}

/// A class which mocks [UserRegister].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRegister extends _i1.Mock implements _i7.UserRegister {
  MockUserRegister() {
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
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> execute(
    String? name,
    String? email,
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            name,
            email,
            username,
            password,
          ],
        ),
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
          this,
          Invocation.method(
            #execute,
            [
              name,
              email,
              username,
              password,
            ],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
}

/// A class which mocks [UserLogout].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLogout extends _i1.Mock implements _i8.UserLogout {
  MockUserLogout() {
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
  _i17.Future<_i4.Either<_i24.Failure, bool>> execute(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [token],
        ),
        returnValue: _i17.Future<_i4.Either<_i24.Failure, bool>>.value(
            _FakeEither_2<_i24.Failure, bool>(
          this,
          Invocation.method(
            #execute,
            [token],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, bool>>);
}

/// A class which mocks [GetUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUser extends _i1.Mock implements _i9.GetUser {
  MockGetUser() {
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
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> execute(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [token],
        ),
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
          this,
          Invocation.method(
            #execute,
            [token],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
}

/// A class which mocks [UpdateProfile].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateProfile extends _i1.Mock implements _i10.UpdateProfile {
  MockUpdateProfile() {
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
  _i17.Future<_i4.Either<_i24.Failure, _i30.User>> execute(
    String? token,
    String? name,
    String? email,
    String? username,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            token,
            name,
            email,
            username,
          ],
        ),
        returnValue: _i17.Future<_i4.Either<_i24.Failure, _i30.User>>.value(
            _FakeEither_2<_i24.Failure, _i30.User>(
          this,
          Invocation.method(
            #execute,
            [
              token,
              name,
              email,
              username,
            ],
          ),
        )),
      ) as _i17.Future<_i4.Either<_i24.Failure, _i30.User>>);
}

/// A class which mocks [SaveActiveUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveActiveUser extends _i1.Mock implements _i11.SaveActiveUser {
  MockSaveActiveUser() {
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
  _i17.Future<bool> execute(String? token) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [token],
        ),
        returnValue: _i17.Future<bool>.value(false),
      ) as _i17.Future<bool>);
}

/// A class which mocks [RemoveActiveUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveActiveUser extends _i1.Mock implements _i12.RemoveActiveUser {
  MockRemoveActiveUser() {
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
  _i17.Future<bool> execute() => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i17.Future<bool>.value(false),
      ) as _i17.Future<bool>);
}

/// A class which mocks [AuthBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthBloc extends _i1.Mock implements _i13.AuthBloc {
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
  _i7.UserRegister get userRegister => (super.noSuchMethod(
        Invocation.getter(#userRegister),
        returnValue: _FakeUserRegister_5(
          this,
          Invocation.getter(#userRegister),
        ),
      ) as _i7.UserRegister);
  @override
  _i8.UserLogout get userLogout => (super.noSuchMethod(
        Invocation.getter(#userLogout),
        returnValue: _FakeUserLogout_6(
          this,
          Invocation.getter(#userLogout),
        ),
      ) as _i8.UserLogout);
  @override
  _i9.GetUser get getUser => (super.noSuchMethod(
        Invocation.getter(#getUser),
        returnValue: _FakeGetUser_7(
          this,
          Invocation.getter(#getUser),
        ),
      ) as _i9.GetUser);
  @override
  _i10.UpdateProfile get updateProfile => (super.noSuchMethod(
        Invocation.getter(#updateProfile),
        returnValue: _FakeUpdateProfile_8(
          this,
          Invocation.getter(#updateProfile),
        ),
      ) as _i10.UpdateProfile);
  @override
  _i11.SaveActiveUser get saveActiveUser => (super.noSuchMethod(
        Invocation.getter(#saveActiveUser),
        returnValue: _FakeSaveActiveUser_9(
          this,
          Invocation.getter(#saveActiveUser),
        ),
      ) as _i11.SaveActiveUser);
  @override
  _i12.RemoveActiveUser get removeActiveUser => (super.noSuchMethod(
        Invocation.getter(#removeActiveUser),
        returnValue: _FakeRemoveActiveUser_10(
          this,
          Invocation.getter(#removeActiveUser),
        ),
      ) as _i12.RemoveActiveUser);
  @override
  _i13.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_11(
          this,
          Invocation.getter(#state),
        ),
      ) as _i13.AuthState);
  @override
  _i17.Stream<_i13.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i17.Stream<_i13.AuthState>.empty(),
      ) as _i17.Stream<_i13.AuthState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void add(_i13.AuthEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i13.AuthEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i13.AuthState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i13.AuthEvent>(
    _i31.EventHandler<E, _i13.AuthState>? handler, {
    _i31.EventTransformer<E>? transformer,
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
          _i31.Transition<_i13.AuthEvent, _i13.AuthState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i17.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i17.Future<void>.value(),
        returnValueForMissingStub: _i17.Future<void>.value(),
      ) as _i17.Future<void>);
  @override
  void onChange(_i31.Change<_i13.AuthState>? change) => super.noSuchMethod(
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
class MockIOClient extends _i1.Mock implements _i14.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i17.Future<_i14.IOStreamedResponse> send(_i32.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue: _i17.Future<_i14.IOStreamedResponse>.value(
            _FakeIOStreamedResponse_12(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i17.Future<_i14.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i17.Future<_i15.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i17.Future<_i15.Response>.value(_FakeResponse_13(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i17.Future<_i15.Response>);
  @override
  _i17.Future<_i15.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i17.Future<_i15.Response>.value(_FakeResponse_13(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i17.Future<_i15.Response>);
  @override
  _i17.Future<_i15.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i33.Encoding? encoding,
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
        returnValue: _i17.Future<_i15.Response>.value(_FakeResponse_13(
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
      ) as _i17.Future<_i15.Response>);
  @override
  _i17.Future<_i15.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i33.Encoding? encoding,
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
        returnValue: _i17.Future<_i15.Response>.value(_FakeResponse_13(
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
      ) as _i17.Future<_i15.Response>);
  @override
  _i17.Future<_i15.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i33.Encoding? encoding,
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
        returnValue: _i17.Future<_i15.Response>.value(_FakeResponse_13(
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
      ) as _i17.Future<_i15.Response>);
  @override
  _i17.Future<_i15.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i33.Encoding? encoding,
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
        returnValue: _i17.Future<_i15.Response>.value(_FakeResponse_13(
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
      ) as _i17.Future<_i15.Response>);
  @override
  _i17.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i17.Future<String>.value(''),
      ) as _i17.Future<String>);
  @override
  _i17.Future<_i34.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i17.Future<_i34.Uint8List>.value(_i34.Uint8List(0)),
      ) as _i17.Future<_i34.Uint8List>);
}
