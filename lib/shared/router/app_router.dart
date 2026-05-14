import 'package:go_router/go_router.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/adhkar_screen.dart';
import '../../presentation/screens/emotional_assistant_screen.dart';
import '../../presentation/screens/recommendation_screen.dart';
import '../../presentation/screens/audio_player_screen.dart';
import '../../presentation/screens/occasion_duas_screen.dart';
import '../../presentation/screens/bab_al_ajr_screen.dart';
import '../../presentation/screens/project_details_screen.dart';
import '../../presentation/screens/athari_screen.dart';
import '../../presentation/screens/financial_reports_screen.dart';
import '../../presentation/screens/more_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, _) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, _) => const HomeScreen()),
    GoRoute(path: '/adhkar', builder: (context, _) => const AdhkarScreen()),
    GoRoute(
      path: '/emotional-assistant',
      builder: (context, _) => const EmotionalAssistantScreen(),
    ),
    GoRoute(
      path: '/recommendation/:mood',
      builder: (context, state) => RecommendationScreen(
        mood: state.pathParameters['mood'] ?? '',
      ),
    ),
    GoRoute(
      path: '/audio-player/:id',
      builder: (context, state) => AudioPlayerScreen(
        trackId: state.pathParameters['id'] ?? '',
      ),
    ),
    GoRoute(
      path: '/occasion-duas',
      builder: (context, _) => const OccasionDuasScreen(),
    ),
    GoRoute(
      path: '/bab-al-ajr',
      builder: (context, _) => const BabAlAjrScreen(),
    ),
    GoRoute(
      path: '/project-details/:id',
      builder: (context, state) => ProjectDetailsScreen(
        projectId: state.pathParameters['id'] ?? '',
      ),
    ),
    GoRoute(path: '/athari', builder: (context, _) => const AthariScreen()),
    GoRoute(
      path: '/financial-reports',
      builder: (context, _) => const FinancialReportsScreen(),
    ),
    GoRoute(path: '/more', builder: (context, _) => const MoreScreen()),
  ],
);
