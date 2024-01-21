class NotificationModel {
  final String img;
  final String company;
  final String subtitle;
  final String datetime;
  final bool status;

  NotificationModel({
    required this.company,
    required this.img,
    required this.subtitle,
    required this.datetime,
    required this.status,
  });
}

List<NotificationModel> itemNotifications = [
  NotificationModel(
    company: 'Dana',
    img: 'assets/logos/Dana.png',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: false,
  ),
  NotificationModel(
    company: 'Shoope',
    img: 'assets/logos/Shoope.png',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: false,
  ),
  NotificationModel(
    company: 'Slack',
    // img: 'assets/logos/Slack.png',
    img: 'assets/logos/Slack.png',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: false,
  ),
  NotificationModel(
    company: 'Facebook',
    img: 'assets/logos/Facebook.png',
    // img:     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR82yd3z3FYgoKtPhHd8sdgXjHgxAn58OgblVy53FqgohTRHRKF',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: false,
  ),
];
//
List<NotificationModel> itemYesterdayNotifications = [
  NotificationModel(
    company: 'Email setup successful',
    // img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKoDW0Vrgi_Iuxlfytz4nSR9OZQzyS7mB3sA&usqp=CAU',
    img:'assets/logos/sms.png',
    subtitle:
    'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
    datetime: '10.00AM',
    status: false,
  ),
  NotificationModel(
    company: 'Welcome to Jobsque',
    // img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfBX_LSwaArfKtnzSouf0REDz2OeWg9_XYgQ&usqp=CAU',
    img:'assets/logos/search-status.png',
    subtitle:
    'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
    datetime: '08.00AM',
    status: true,
  ),
];

