class ChatImageModel{

  String image;
  String text;


  ChatImageModel({
    required this.image,
    required this.text,
  });
}

List<ChatImageModel> itemChatImageModel=[
  // MessageModel(image: 'assets/logos/Twitter Logo.png', name: 'Twitter', message: 'Here is the link: http://zoom.com/abcdeefg', time: '12.39'),
  ChatImageModel(image: 'assets/logos/Gojek Indonesia.png', text: 'Gojek'),
  ChatImageModel(image: 'assets/logos/Shoope.png', text: 'Shoope'),
  ChatImageModel(image: 'assets/logos/Dana.png', text: 'Dana'),
  ChatImageModel(image: 'assets/logos/Slack.png', text: 'Slack'),
  ChatImageModel(image: 'assets/logos/Facebook.png', text: 'Facebook'),
];