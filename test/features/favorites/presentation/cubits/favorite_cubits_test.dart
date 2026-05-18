// import 'dart:async';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:movify/core/auth/auth_status_provider.dart';
// import 'package:movify/features/favorite/domain/use_cases/add_favorite_use_case.dart';
// import 'package:movify/features/favorite/domain/use_cases/get_favorite_use_case.dart';
// import 'package:movify/features/favorite/domain/use_cases/merge_guest_favorites_use_case.dart';
// import 'package:movify/features/favorite/domain/use_cases/pull_cloud_favorites_use_case.dart';
// import 'package:movify/features/favorite/domain/use_cases/remove_favorite_use_case.dart';
// import 'package:movify/features/favorite/presentation/cubits/favorite_cubit.dart';

// class MockMergeGuestFavoritesUseCase extends Mock
//     implements MergeGuestFavoritesUseCase {}

// class MockPullCloudFavouritesUseCase extends Mock
//     implements PullCloudFavoritesUseCase {}

// class MockAddFavouritesUseCase extends Mock implements AddFavoriteUseCase {}

// class MockRemoveFavouritesUseCase extends Mock
//     implements RemoveFavoriteUseCase {}

// class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

// class MockAuthStatusProvider extends Mock implements AuthStatusProvider {}

// late final StreamController<AuthStatusEvent> authStreamController;
// void main() {
//   late FavoriteCubit favoriteCubit;
//   late MockAuthStatusProvider mockAuthStatusProvider;
//   late MockMergeGuestFavoritesUseCase mockMergeUseCase;
//   late MockGetFavoritesUseCase mockGetFavoritesUseCase;
//   late MockPullCloudFavouritesUseCase mockPullCloudFavoritesUseCase;
//   late MockAddFavouritesUseCase mockAddFavouritesUseCase;
//   late MockRemoveFavouritesUseCase mockRemoveFavouritesUseCase;

//   setUp(() {
//     mockAuthStatusProvider = MockAuthStatusProvider();
//     mockMergeUseCase = MockMergeGuestFavoritesUseCase();
//     mockGetFavoritesUseCase = MockGetFavoritesUseCase();
//     mockPullCloudFavoritesUseCase = MockPullCloudFavouritesUseCase();
//     mockAddFavouritesUseCase = MockAddFavouritesUseCase();
//     mockRemoveFavouritesUseCase = MockRemoveFavouritesUseCase();
//     authStreamController = StreamController<AuthStatusEvent>.broadcast();
//     mockAuthStatusProvider = MockAuthStatusProvider();

//     when(
//       () => mockAuthStatusProvider.authStatusStream,
//     ).thenAnswer((_) => authStreamController.stream);

//     when(
//       () => mockAuthStatusProvider.currentAuthStatus,
//     ).thenAnswer((_) async => const AuthStatusEvent(status: AuthStatus.guest));
//     favoriteCubit = FavoriteCubit(
//       authStatusProvider: mockAuthStatusProvider,
//       getFavoritesUseCase: mockGetFavoritesUseCase,
//       mergeGuestFavoritesUseCase: mockMergeUseCase,
//       pullCloudFavoritesUseCase: mockPullCloudFavoritesUseCase,
//       addFavoriteUseCase: mockAddFavouritesUseCase,
//       removeFavoriteUseCase: mockRemoveFavouritesUseCase,
//     );
//   });
//   tearDown(() {
//     authStreamController.close();
//     favoriteCubit.close();
//   });
// }
