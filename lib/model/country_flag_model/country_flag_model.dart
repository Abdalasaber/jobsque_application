// class CountryFlagModel{
//   String flagImage;
//   String flagName;
//
//   CountryFlagModel({
//     required this.flagImage,
//     required this.flagName,
//   });
// }
//
// List<CountryFlagModel> itemCountryFlagModel=[
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
//   CountryFlagModel(flagImage: '', flagName: ''),
// ];

class CountryFlagModel {
  final String flagName;
  final String flagImage;
  const CountryFlagModel(this.flagName, this.flagImage);
}

List<CountryFlagModel> countries = const [
  CountryFlagModel(
    "Egypt",
    "https://cdn-icons-png.flaticon.com/256/323/323324.png",
  ),
  CountryFlagModel(
    "Saudi Arabia",
    "https://cdn-icons-png.flaticon.com/128/5111/5111777.png",
  ),
  CountryFlagModel(
    "Qatar",
    "https://cdn-icons-png.flaticon.com/512/5372/5372985.png",
  ),
  CountryFlagModel(
    "United States",
    "https://cdn-icons-png.flaticon.com/128/197/197484.png",
  ),
  CountryFlagModel(
    "Malaysia",
    "https://cdn-icons-png.flaticon.com/128/197/197581.png",
  ),
  CountryFlagModel(
    "Polandia",
    "https://cdn-icons-png.flaticon.com/128/197/197529.png",
  ),
  CountryFlagModel(
    "India",
    "https://cdn-icons-png.flaticon.com/128/10576/10576638.png",
  ),
  CountryFlagModel(
    "Vietnam",
    "https://cdn-icons-png.flaticon.com/128/197/197473.png",
  ),
  CountryFlagModel(
    "China",
    "https://cdn-icons-png.flaticon.com/128/5372/5372696.png",
  ),
  CountryFlagModel(
    "Canada",
    "https://cdn-icons-png.flaticon.com/128/197/197430.png",
  ),
  CountryFlagModel(
    "Argentina",
    "https://cdn-icons-png.flaticon.com/128/197/197573.png",
  ),
  CountryFlagModel(
    "Brazil",
    "https://cdn-icons-png.flaticon.com/128/9906/9906449.png",
  ),
];