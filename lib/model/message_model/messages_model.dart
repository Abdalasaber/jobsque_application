class MessageModel{
  String image;
  String name;
  String message;
  String chatMessage;
  String time;
  bool status;


  MessageModel({
    required this.image,
    required this.name,
    required this.message,
    required this.chatMessage,
    required this.time,
    required this.status,
  });
}

List<MessageModel> itemMesaageModel=[
  MessageModel(image: 'assets/logos/Twitter Logo.png', name: 'Twitter', message: 'Ok,here I put this zoom meet link fo later', time: '12.39',status: true, chatMessage: 'Ok,here I put this zoom meet link fo later this afternoon time for you Here is the link: http://zoom.com/abcdeefg'),
  MessageModel(image: 'assets/logos/Gojek Indonesia.png', name: 'Indonesia', message: 'Let’s keep in touch.', time: '12.39', status: true, chatMessage: 'message from me'),
  MessageModel(image: 'assets/logos/Shoope.png', name: 'Shoope', message: 'Thank You David!', time: '9:00',status: false, chatMessage: 'message from other'),
  MessageModel(image: 'assets/logos/Dana.png', name: 'Dana', message: 'Thank you for your attention!', time: 'Yesterday',status: true, chatMessage: 'message from me'),
  MessageModel(image: 'assets/logos/Slack.png', name: 'Slack', message: 'You: I look forward to hearing from you', time: '12/8',status: false, chatMessage: 'message from other'),
  MessageModel(image: 'assets/logos/Facebook.png', name: 'Facebook', message: 'You: What about the interview stage?', time: '12/8',status: false, chatMessage: 'message from other'),
];