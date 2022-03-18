class Environment {
  static const clientId = String.fromEnvironment('CLIENT_ID');
  static const redirectUri = String.fromEnvironment('REDIRECT_URI');
  static const state = String.fromEnvironment('STATE');
  static const nonce = String.fromEnvironment('NONCE');
}
