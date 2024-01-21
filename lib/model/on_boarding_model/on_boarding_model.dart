class OnBoarding{
  final String image;
  final String text;
  final String subText;
  final String textAnotherColor;
  final String textFirstColor;

  const OnBoarding({
    required this.image,
    required this.text,
    required this.subText,
    required this.textAnotherColor,
    required this.textFirstColor
  });
}

List<OnBoarding> itemOnBoarding = [
  const OnBoarding(image: ('assets/images/Background--1.png'), text: ('Find a job, and '), subText: ('Explore over 25,924 available job roles and upgrade your operator now.'), textAnotherColor: 'start building', textFirstColor: ' your career from now on'),
  const OnBoarding(image: ('assets/images/Background--2.png'), text: ('Hundreds of jobs are waiting for you to '), subText: ('Immediately join us and start applying for the job you are interested in.'), textAnotherColor: 'join together', textFirstColor: ''),
  const OnBoarding(image: ('assets/images/Background--3.png'), text: ('Get the best '), subText: ('The better the skills you have, the greater the good job opportunities for you.'), textAnotherColor: 'choice for the job ', textFirstColor: 'you have always dreamed of'),

];
