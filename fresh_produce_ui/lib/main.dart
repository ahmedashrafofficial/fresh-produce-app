import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/theme/app_theme.dart';
import 'presentation/providers/ui_providers.dart';
import 'presentation/screens/checkout_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/my_orders_screen.dart';
import 'presentation/screens/neighborhood_selection_screen.dart';
import 'presentation/screens/order_success_screen.dart';
import 'presentation/screens/register_screen.dart';
import 'presentation/screens/round_details_screen.dart';

void main() {
  runApp(const ProviderScope(child: FreshProduceApp()));
}

class FreshProduceApp extends ConsumerWidget {
  const FreshProduceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    final GoRouter router = GoRouter(
      initialLocation: '/select-neighborhood',
      routes: [
        GoRoute(
          path: '/select-neighborhood',
          builder: (context, state) => const NeighborhoodSelectionScreen(),
        ),
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/login',
          builder: (context, state) =>
              LoginScreen(redirectTo: state.uri.queryParameters['redirect_to']),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/round/:id',
          builder: (context, state) =>
              RoundDetailsScreen(roundId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: '/checkout/:roundId',
          builder: (context, state) =>
              CheckoutScreen(roundId: state.pathParameters['roundId']!),
          redirect: (context, state) {
            if (auth == null) {
              return Uri(
                path: '/login',
                queryParameters: {'redirect_to': state.uri.toString()},
              ).toString();
            }
            return null;
          },
        ),
        GoRoute(
          path: '/order-success',
          builder: (context, state) => const OrderSuccessScreen(),
        ),
        GoRoute(
          path: '/my-orders',
          builder: (context, state) => const MyOrdersScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      locale: const Locale('ar'),
    );
  }
}
