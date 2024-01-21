class TypeWorkModel {
  String text;
  String subtext;
  bool isSelected;

  TypeWorkModel({
    required this.text,
    required this.subtext,
    this.isSelected = false,
  });
}
List<TypeWorkModel> itemTypeWorkModel = [
  TypeWorkModel(text: 'Senior UX Designer', subtext: 'CV.pdf - Portfolio.pdf'),
  TypeWorkModel(text: 'Senior UI Designer', subtext: 'CV.pdf - Portfolio.pdf'),
  TypeWorkModel(text: 'Graphik Designer', subtext: 'CV.pdf - Portfolio.pdf'),
  TypeWorkModel(text: 'Front-End Developer',subtext: 'CV.pdf - Portfolio.pdf'),
];