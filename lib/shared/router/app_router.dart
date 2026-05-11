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
    GoRoute(path: '/', builder: (_, _) => const SplashScreen()),
    GoRoute(path: '/home', builder: (_, _) => const HomeScreen()),
    GoRoute(path: '/adhkar', builder: (_, _) => const AdhkarScreen()),
    GoRoute(
      path: '/emotional-assistant',
      builder: (_, _) => const EmotionalAssistantScreen(),
    ),
    GoRoute(
      path: '/recommendation/:mood',
      builder: (_, state) => RecommendationScreen(
        mood: state.pathParameters['mood'] ?? '',
      ),
    ),
    GoRoute(
      path: '/audio-player/:id',
      builder: (_, state) => AudioPlayerScreen(
        trackId: state.pathParameters['id'] ?? '',
      ),
    ),
    GoRoute(
      path: '/occasion-duas',
      builder: (_, _) => const OccasionDuasScreen(),
    ),
    GoRoute(
      path: '/bab-al-ajr',
      builder: (_, _) => const BabAlAjrScreen(),
    ),
    GoRoute(
      path: '/project-details/:id',
      builder: (_, state) => ProjectDetailsScreen(
        projectId: state.pathParameters['id'] ?? '',
      ),
    ),
    GoRoute(path: '/athari', builder: (_, _) => const AthariScreen()),
    GoRoute(
      path: '/financial-reports',
      builder: (_, _) => const FinancialReportsScreen(),
    ),
    GoRoute(path: '/more', builder: (_, _) => const MoreScreen()),
  ],
);
