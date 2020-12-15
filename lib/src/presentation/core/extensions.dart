import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../application/auth/sign_in_handler/sign_in_handler_state.dart';
import '../../application/auth/sign_in_handler/sign_in_handler_state_notifier.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';

extension AuthContext on BuildContext {
  /// Reset the sign in handler form. Clears the email and password from the
  /// state and restores the form to its initial value.
  void resetSignInForm() {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false).reset();
  }

  /// Signs out the current user. Also signs out Google Sign-In.
  Future<void> signOut() async {
    Provider.of<AuthFacade>(this, listen: false).signOut();
  }

  /// Registers the user with email specified by [EmailTextFormField]
  /// and password specified by [PasswordTextFormField].
  ///
  /// Should only ever be used if you're creating your own custom sign-in
  /// form
  Future<void> registerWithEmailAndPassword() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .registerWithEmailAndPassword();
  }

  /// Sign-in the user with email specified by [EmailTextFormField]
  /// and password specified by [PasswordTextFormField].
  ///
  /// Should only ever be used if you're creating your own custom sign-in
  /// form
  Future<void> signInWithEmailAndPassword() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInWithEmailAndPassword();
  }

  /// Perform sign-in with Google.
  ///
  /// Should only be used if you're creating your own custom sign-in form
  Future<void> signInWithGoogle() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInWithGoogle();
  }

  /// Perform sign-in with Apple.
  ///
  /// Should only be used if you're creating your own custom sign-in form
  Future<void> signInWithApple() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInWithApple();
  }

  /// Perform sign-in with Github.
  ///
  /// Should only be used if you're creating your own custom sign-in form
  Future<void> signInWithGithub() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInWithGithub();
  }

  /// Perform sign-in with Twitter.
  ///
  /// Should only be used if you're creating your own custom sign-in form
  Future<void> signInWithTwitter() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInWithTwitter();
  }

  /// Perform sign-in with Microsoft.
  ///
  /// Should only be used if you're creating your own custom sign-in form
  Future<void> signInWithMicrosoft() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInWithMicrosoft();
  }

  /// Sign in with Credentials
  ///
  /// Should only be used if your implementing your own third party sign-in
  Future<void> signInWithCredential(AuthCredential credential) async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInWithCredential(credential);
  }

  /// Perform Firebase anonymous sign-in
  ///
  /// Should only be used if you're creating your own custom sign-in form
  Future<void> signInAnonymously() async {
    Provider.of<SignInHandlerStateNotifier>(this, listen: false)
        .signInAnonymously();
  }

  /// Wether Lit Firebase is currently attempting to authenticate. Can be used
  /// to show a loading indicator.
  ///
  /// Should only be used in the build method. For example:
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   final isSubmitting = context.isSubmitting();
  ///   return Visibility(
  ///     visible: isSubmitting,
  ///     child: CircularProgressIndicator(),
  ///   );
  /// }
  /// ```
  bool isSubmitting() {
    // return Provider.of<SignInHandlerState>(this).isSubmitting;
    return select((SignInHandlerState state) => state.isSubmitting);
  }

  /// Retrieves the currently signed in user
  LitUser getSignedInUser() {
    return Provider.of<LitUser>(this, listen: false);
  }

  LitUser watchSignedInUser() {
    return Provider.of<LitUser>(this);
  }
}
