import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:demo/src/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableLevels = [
    LevelMessages.error,
    LevelMessages.warning,
  ];
  Provider.debugCheckInvalidValueType = null;

  DioService.getInstance()
    ..initInterceptors()
    ..options = BaseOptions(baseUrl: baseApi)
    ..debugMode = true
    ..onRegularError = (title, body, error) {
      BotToast.showSimpleNotification(title: title ?? '', subTitle: body ?? '');
    }
    ..onUnauthenticated = () {
      BotToast.showText(text: 'غير مصرح لك الوصول لهذا الرابط');
    };

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        home: ChangeNotifierProvider(
          create: (_) => SplashProvider(),
          child: SplashScreen(),
        ),
      ),
    );
  }
}
