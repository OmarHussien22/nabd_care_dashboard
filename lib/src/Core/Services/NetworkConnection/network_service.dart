class NetworkConnectionService {
  NetworkConnectionService._();

  static final NetworkConnectionService instance = NetworkConnectionService._();

  /// create an instance to access other attributes
//   static final Connectivity _connectivity = Connectivity();
//   static final InternetConnectionChecker _internetConnectionChecker =
//       InternetConnectionChecker();
//
//   /// package starts here !
//   final _controller = StreamController.broadcast();
//   Stream get myStream => _controller.stream;
//   // 1.This calls for both methods to manually check the internet connection and listen for the connectivity stream.
//   void initialise() async {
//     final results = await _connectivity.checkConnectivity();
//     _checkStatus(results[0]);
//     _connectivity.onConnectivityChanged.listen((results) {
//       printDM("${results[0]}");
//       _checkStatus(results[0]);
//     });
//   }
//
// // 2.This calls for both methods to manually check the internet connection and listen for the connectivity stream.
//   void _checkStatus(ConnectivityResult connectivityResult) async {
//     bool isOnline = false;
//     try {
//       if (connectivityResult != ConnectivityResult.none) {
//         isOnline = await _internetConnectionChecker.hasConnection;
//       }
//       // final connectivityResult = await InternetAddress.lookup('example.com');
//       //  isOnline = connectivityResult.isNotEmpty && connectivityResult[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//     _controller.sink.add({connectivityResult: isOnline});
//   }
//
//   void disposeStream() => _controller.close();

  /// FOR USAGE : see [AppController]
}

/// OLD VERSION depends on [Connectivity] package only
// class NetworkConnectionService {
//   NetworkConnectionService._();
//   static final NetworkConnectionService instance = NetworkConnectionService._();
//   /// create an instance to access other attributes
//   static final Connectivity _connection = Connectivity();
//
//
//
//
//   Future<bool> get isConnected async => (await _connection.checkConnectivity() == ConnectivityResult.none);
//
//   void checkConnection({
//     VoidCallback? onConnection,
//     VoidCallback? onDisconnection,
//   }) async {
//     var connectivityResult = await (_connection.checkConnectivity());
//
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       if (kDebugMode) {
//         print("I am connected to a ${connectivityResult.name}");
//       }
//       onConnection!();
//     } else {
//       if (kDebugMode) {
//         print("I am disConnected from the internet");
//       }
//       onDisconnection!();
//     }
//   }
//
//   /// Listens to the changes in network connections
//   /// Warning : as any Stream you should init when you listen and dispose after using .
//   Stream<ConnectivityResult> onConnectionChange() {
//     return _connection.onConnectivityChanged;
//   }
//
// }
