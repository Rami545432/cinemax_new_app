import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/use_cases/facebook_sign_in_use_case.dart';
import '../../features/auth/domain/use_cases/google_sign_in_use_case.dart';
import '../../features/auth/domain/use_cases/register_account_use_case.dart';
import '../../features/auth/domain/use_cases/sign_in_use_case.dart';
import '../../features/auth/domain/use_cases/update_email_use_case.dart';
import '../../features/auth/domain/use_cases/update_name_use_case.dart';
import '../../features/auth/presentaion/views_models/manger/firebase_opreations_cubit/firebase_opreations_cubit.dart';
import '../../features/auth/presentaion/views_models/manger/sign_in_cubit/sign_in_cubit.dart';
import '../../features/auth/presentaion/views_models/manger/sign_up_cubit/sign_up_cubit.dart';
import '../../features/auth/presentaion/views_models/manger/social_media_sign_up_cubit/social_media_sign_up_cubit.dart';
import '../../features/auth/presentaion/views_models/views/email_reset_passoword_view.dart';
import '../../features/auth/presentaion/views_models/views/initial_auth_view.dart';
import '../../features/auth/presentaion/views_models/views/new_password_view.dart';
import '../../features/auth/presentaion/views_models/views/reset_password_view.dart';
import '../../features/auth/presentaion/views_models/views/sign_in_view.dart';
import '../../features/auth/presentaion/views_models/views/sign_up_view.dart';
import '../../features/auth/presentaion/views_models/views/verify_account_view.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/domian/entites/movie_details_entity.dart';
import '../../features/home/domian/uses_cases/fetch_movie_details.dart';
import '../../features/home/domian/uses_cases/fetch_recommended_use_case.dart';
import '../../features/home/presentaion/manger/fetch_movie_details_cubit/fetch_movie_details_cubit.dart';
import '../../features/home/presentaion/manger/see_all_cubit/see_all_cubit.dart';
import '../../features/home/presentaion/views_models/views/details_view.dart';
import '../../features/home/presentaion/views_models/views/see_all_view.dart';
import '../../features/home/presentaion/views_models/widgets/details_widgets/season_view_argument.dart';
import '../../features/home/presentaion/views_models/widgets/youtube_player.dart';
import '../../features/onboarding/presentaion/view_models/widgets/page_view.dart';
import '../../features/profile/presentaion/views/edit_profile_view.dart';
import '../../features/profile/presentaion/views/profile_view.dart';
import '../../features/search/data/repos/search_repo_impl.dart';

import '../../features/search/domain/use_case/search_actor_use_case.dart';
import '../../features/home/presentaion/manger/recommended_movies_cubit/recommended_cubit.dart';
import '../../features/search/presentaion/view_models/manger/search_actor_cubit/seach_actor_cubit.dart';
import '../../features/series/data/repos/series_repo_impl.dart';
import '../../features/series/domain/use_cases/fetch_series_season_details.dart';
import '../../features/series/domain/use_cases/fetch_tv_show_details_use_case.dart';
import '../../features/series/presentaion/manger/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import '../../features/series/presentaion/views/season_view.dart';
import '../../models/base_card_model.dart';
import '../../models/see_all_arguments_model.dart';
import 'bloc_provieders_views/home_view_provieder.dart';
import 'bloc_provieders_views/search_provider.dart';
import 'bloc_provieders_views/seires_tv_shows_providers.dart';
import 'bloc_provieders_views/favorite_bloc_provider.dart';
import 'get_it.dart';
import 'helper/guest_mode_service.dart';
import 'in_app_view.dart';
import 'navigation_views.dart';
import 'use_case/use_case.dart';

abstract class AppRouter {
  static const String kOnBoarding1 = '/onboarding1';
  static const String kSpalshView = '/splashview';
  static const String kInitialAuth = '/initailauth';
  static const String kSignUpView = '/signupview';
  static const String kSignInView = '/signInview';
  static const String kResetPasswordView = '/resetpasswordview';
  static const String kNewPasswordView = '/newpasswordview';
  static const String kVerficationView = '/verificationview';
  static const String kSearchView = '/searchview';
  static const String kHomeview = '/homeview';
  static const String kMovieDetailView = '/detailview';
  static const String kWishListView = '/wishlistview';
  static const String kYoutubePlayer = '/youtubePlayerVideo';
  static const String kSeeAllView = '/seeAllview';
  static const String kActorSearchView = '/actorSearchview';
  static const String kRecommendedSeeAllview = '/recomseeAll';
  static const String kVerficationPasswordEmailView = '/verficationPassword';
  static const String kProfileView = '/profileView';
  static const String kEditProfileView = '/editProfileView';
  static const String kCustomWebView = '/customWebView';
  static const String kSerirsView = '/seriesView';
  static const String kNavigationView = '/navigationView';
  static const String kTvDetailsView = '/detailsTvView';
  static const String kTvSeeAllPopularView = '/seeAllTvPopularView';
  static const String kTopRatedSeeAll = '/topRatedSeeAll';
  static const String kSeasonView = '/seasonView';
  static const String kEpisodeView = '/episodeView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return FutureBuilder(
            future: GuestModeService.getGuestMode(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              final User? user = FirebaseAuth.instance.currentUser;
              final bool isGuestMode = snapshot.data ?? false;

              if (user != null || isGuestMode) {
                return NavigationViews();
              } else {
                return OnBoardingTransistion();
              }
            },
          );
        },
      ),
      GoRoute(
        path: kHomeview,
        builder: (context, state) => const HomeViewProviders(),
      ),
      GoRoute(
        path: kOnBoarding1,
        builder: (context, state) => const OnBoardingTransistion(),
      ),
      GoRoute(
        path: kInitialAuth,
        builder: (context, state) => BlocProvider(
          create: (context) => SocialMediaSignUpCubit(
            GoogleSignInUseCase(authRepo: AuthRepoImpl()),
            FacebookSignInUseCase(authRepo: AuthRepoImpl()),
          ),
          child: const InitialAuthView(),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SignUpCubit(SignUpUseCase(authRepo: AuthRepoImpl())),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: kSignInView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SignInCubit(SignInUseCase(authRepo: AuthRepoImpl())),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kNewPasswordView,
        builder: (context, state) => const NewPasswordView(),
      ),
      GoRoute(
        path: kVerficationView,
        builder: (context, state) => const VerifyAccountView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchMultiProviders(),
      ),
      GoRoute(
        path: kMovieDetailView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FetchDetailsCubit(
                FetchMovieDetailsUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
                FetchTvShowDetailsUseCase(
                  seriesRepo: getIt.get<SeriesRepoImpl>(),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => FetchRecommendedCubit(
                FetchRecommendedUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
            ),
          ],
          child: DetailsView(
            cardModel: state.extra as BaseCardModel,
            fromRoute: state.uri.queryParameters['from'] ?? 'home',
          ),
        ),
      ),
      GoRoute(
        path: kWishListView,
        builder: (context, state) => FavoriteBlocProviders(),
      ),
      GoRoute(
        path: kYoutubePlayer,
        builder: (context, state) => YoutubeVideoPlayer(
          movieDetailsEntity: state.extra as MovieDetailsEntity,
        ),
      ),
      GoRoute(
        path: kSeeAllView,
        builder: (context, state) => BlocProvider(
          create: (context) => SeeAllCubit(
            seeAllArgumentsModel: state.extra as SeeAllArgumentsModel,
          )..fetchInitialData(params: NoParam()),
          child: SeeAllView(
            seeAllArgumentsModel: state.extra as SeeAllArgumentsModel,
          ),
        ),
      ),
      GoRoute(
        path: kActorSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchActorCubit(
            SearchActorUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
          ),
          child: Container(),
        ),
      ),
      GoRoute(
        path: kVerficationPasswordEmailView,
        builder: (context, state) =>
            EmailResetPassowordView(email: state.extra as String),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => BlocProvider(
          create: (context) => FirebaseOpreationsCubit(
            updateEmailUseCase: UpdateEmailUseCase(
              authRepo: getIt.get<AuthRepoImpl>(),
            ),
            updateNameUseCase: UpdateNameUseCase(
              authRepo: getIt.get<AuthRepoImpl>(),
            ),
          ),
          child: ProfileView(),
        ),
      ),
      GoRoute(
        path: kSerirsView,
        builder: (context, state) => const SeiresTvShowsProviders(),
      ),
      GoRoute(
        path: kNavigationView,
        builder: (context, state) => const NavigationViews(),
      ),

      GoRoute(
        path: kCustomWebView,
        builder: (context, state) =>
            CustomInappView(movieOrTvUrl: state.extra as String),
      ),
      GoRoute(
        path: kSeasonView,
        builder: (context, state) => BlocProvider(
          create: (context) => FetchSeriesSeasonDetailsCubit(
            FetchSeriesSeasonDetailsUseCase(
              seriesRepo: getIt.get<SeriesRepoImpl>(),
            ),
          ),
          child: SeasonView(
            seasonViewArgument: state.extra as SeasonViewArgument,
          ),
        ),
      ),
    ],
  );
}
