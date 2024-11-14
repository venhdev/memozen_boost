abstract class RemoteConfig {
  static Duration fetchTimeout = const Duration(minutes: 1);
  static Duration minimumFetchInterval = const Duration(minutes: 10);

  // remote config keys
  static String isDev = 'isDev';

  // remote config default values
  static Map<String, dynamic> defaultValues = {
    isDev: false,
  };
}
