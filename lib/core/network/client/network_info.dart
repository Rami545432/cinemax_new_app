/// Abstract interface for checking network connectivity.
///
/// This interface lives in the core/infrastructure layer so that
/// data-layer classes (e.g. [BaseApiClient]) can depend on an
/// abstraction instead of a presentation-layer Cubit.
abstract class NetworkInfo {
  /// Whether the device currently has an active internet connection.
  bool get isConnected;
}
