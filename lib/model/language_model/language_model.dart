class LanguageModel {
  String text;
  String flag;
  bool isSelected;

  LanguageModel({
    required this.text,
    required this.flag,
    this.isSelected = false,
  });
}
List<LanguageModel> itemLanguageModel = [
  // LanguageModel(text: 'Flag',subtext:'English'), //https://cdn-icons-png.flaticon.com/128/330/330425.png
  // LanguageModel(text: 'Flag',subtext:'Indonesia'),
  // LanguageModel(text: 'Flag',subtext:'Arabic'),
  // LanguageModel(text: 'Flag',subtext:'Dutch'),
  // LanguageModel(text: 'Flag',subtext:'German'),
  // LanguageModel(text: 'Flag',subtext:'Japanese'),
  // LanguageModel(text: 'Flag',subtext:'Korean'),
  // LanguageModel(text: 'Flag',subtext:'Portuguese'),


LanguageModel(
      text: 'English',
    flag:
    'https://cdn-icons-png.flaticon.com/128/330/330425.png'),
LanguageModel(
    text: 'Indonesia', flag: 'https://cdn-icons-png.flaticon.com/128/330/330476.png'),
LanguageModel(
    text: 'Arabic', flag: 'https://cdn-icons-png.flaticon.com/128/330/330552.png'),
LanguageModel(
    text: 'Chinese', flag: 'https://cdn-icons-png.flaticon.com/128/206/206818.png'),
LanguageModel(
    text: 'Dutch', flag: 'https://cdn-icons-png.flaticon.com/128/3013/3013898.png'),
LanguageModel(
    text: 'French', flag: 'https://img.icons8.com/?size=1x&id=pzp5DPl1IvyP&format=png'),
LanguageModel(
    text: 'German', flag: 'https://cdn-icons-png.flaticon.com/128/3014/3014029.png'),
LanguageModel(
    text: 'Japanese', flag: 'https://cdn-icons-png.flaticon.com/128/330/330622.png'),
LanguageModel(
    text: 'Korean', flag: 'https://cdn-icons-png.flaticon.com/128/299/299854.png'),
LanguageModel(
    text: 'Portuguese', flag: 'https://cdn-icons-png.flaticon.com/128/206/206628.png'),
];