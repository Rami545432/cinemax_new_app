import '../../../../../../constants/assets.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    imageBackGround: Assets.imagesOnBoardingOne,
    title: 'Endless Entertainment at Your Fingertips',
    description:
        'Discover a vast collection of movies and TV series from every genre. Stream anytime, anywhere!',
    buttonImage: Assets.imagesButtonOne,
  ),
  OnBoardingModel(
    imageBackGround: Assets.imagesOnBoardingTwo,
    title: 'Find Your Next Favorite Movie',
    description:
        'earch effortlessly for movies, TV shows, and actors. Explore trending and top-rated content with ease',
    buttonImage: Assets.imagesButtonTwo,
  ),
  OnBoardingModel(
    imageBackGround: Assets.imagesOnBoardingThree,
    title: 'Save & Organize Your Must-Watch List',
    description:
        'Add movies to your favorites and watchlist so you never miss a great film again!',
    buttonImage: Assets.imagesButtonThree,
  ),
];

class OnBoardingModel {
  final String imageBackGround;
  final String title;
  final String description;
  final String buttonImage;

  OnBoardingModel({
    required this.imageBackGround,
    required this.title,
    required this.description,
    required this.buttonImage,
  });
}
