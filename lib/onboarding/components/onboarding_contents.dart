class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Wheather is Cloudy",
    image: "assets/images/rainy.png",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  OnboardingContents(
    title: "Wheather is Thunder",
    image: "assets/images/thunder.png",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  OnboardingContents(
    title: "Wheather is Snow",
    image: "assets/images/snow.png",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
];
