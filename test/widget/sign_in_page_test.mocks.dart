// Mocks generated by Mockito 5.3.2 from annotations
// in hello_earth/test/widget/sign_in_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:firebase_database/firebase_database.dart' as _i3;
import 'package:hello_earth/networking/models/base_response.dart' as _i4;
import 'package:hello_earth/networking/models/user_networking.dart' as _i9;
import 'package:hello_earth/networking/requests/credential_request.dart' as _i7;
import 'package:hello_earth/networking/requests/user_request.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

import 'sign_in_page_test.dart' as _i5;

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

class _FakeFirebaseAuth_0 extends _i1.SmartFake implements _i2.FirebaseAuth {
  _FakeFirebaseAuth_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserCredential_1 extends _i1.SmartFake
    implements _i2.UserCredential {
  _FakeUserCredential_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDatabaseReference_2 extends _i1.SmartFake
    implements _i3.DatabaseReference {
  _FakeDatabaseReference_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseResponse_3<T> extends _i1.SmartFake
    implements _i4.BaseResponse<T> {
  _FakeBaseResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CredentialRepositoryTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCredentialRepositoryTest extends _i1.Mock
    implements _i5.CredentialRepositoryTest {
  MockCredentialRepositoryTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get auth => (super.noSuchMethod(
        Invocation.getter(#auth),
        returnValue: _FakeFirebaseAuth_0(
          this,
          Invocation.getter(#auth),
        ),
      ) as _i2.FirebaseAuth);
  @override
  _i6.Future<_i2.UserCredential> createUser(
          _i7.CredentialRequest? credentialRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [credentialRequest],
        ),
        returnValue: _i6.Future<_i2.UserCredential>.value(_FakeUserCredential_1(
          this,
          Invocation.method(
            #createUser,
            [credentialRequest],
          ),
        )),
      ) as _i6.Future<_i2.UserCredential>);
  @override
  _i6.Future<_i2.UserCredential> signInUser(
          _i7.CredentialRequest? credentialRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInUser,
          [credentialRequest],
        ),
        returnValue: _i6.Future<_i2.UserCredential>.value(_FakeUserCredential_1(
          this,
          Invocation.method(
            #signInUser,
            [credentialRequest],
          ),
        )),
      ) as _i6.Future<_i2.UserCredential>);
  @override
  _i6.Future<void> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [UserRepositoryTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepositoryTest extends _i1.Mock
    implements _i5.UserRepositoryTest {
  MockUserRepositoryTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.DatabaseReference get reference => (super.noSuchMethod(
        Invocation.getter(#reference),
        returnValue: _FakeDatabaseReference_2(
          this,
          Invocation.getter(#reference),
        ),
      ) as _i3.DatabaseReference);
  @override
  _i6.Future<void> addUser({
    required _i8.UserRequest? user,
    required String? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addUser,
          [],
          {
            #user: user,
            #userId: userId,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i4.BaseResponse<_i9.UserNetworking>> me(
          {required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #me,
          [],
          {#userId: userId},
        ),
        returnValue: _i6.Future<_i4.BaseResponse<_i9.UserNetworking>>.value(
            _FakeBaseResponse_3<_i9.UserNetworking>(
          this,
          Invocation.method(
            #me,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i6.Future<_i4.BaseResponse<_i9.UserNetworking>>);
}
