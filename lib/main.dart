import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_bank/views/home/home_screen.dart';
import 'package:mobile_bank/views/launcher/splash_screen.dart';
import 'package:mobile_bank/views/login/login_veiw_model.dart';
import 'package:provider/provider.dart';
import 'data/repositories/auth_repository.dart';
import 'views/login/login_screen.dart';
import 'data/data_sources/remote/login_remote_data_source.dart';

void main() {
  // Set up remote data source and repository
  final loginDataSource = LoginRemoteDataSource(
    baseUrl: 'https://reqres.in/api', // 🔁 Replace with your real API base URL
  );
  final authRepository = AuthRepository(remote: loginDataSource);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(repository: authRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'موبایل بانک ملل',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'IRANSans', // If you're using RTL fonts like Persian
        ),
        home: const SplashScreen(),
        // home:  TransferSection(),
        onGenerateRoute: AppRoutes.generateRoute, // Optional if using named routes
      ),
    );
  }
}

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/login':
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}