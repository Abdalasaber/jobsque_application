class NotificationProfileModel{
  final String title;
   bool status;

  NotificationProfileModel({
    required this.title,
    required this.status,
  });
}

List<NotificationProfileModel> itemNotificationProfileModel = [
NotificationProfileModel(title: 'Your Job Search Alert', status: false,),
NotificationProfileModel(title: 'Job Application Update', status: false,),
NotificationProfileModel(title: 'Job Application Reminders', status: false,),
NotificationProfileModel(title: 'Jobs You May Be Interested In', status: false,),
NotificationProfileModel(title: 'Job Seeker Updates', status: false,),
];

List<NotificationProfileModel> itemNotificationProfileOthers = [
NotificationProfileModel(title: 'Show Profile', status: false,),
NotificationProfileModel(title: 'All Message', status: false,),
NotificationProfileModel(title: 'Message Nudges', status: false,),
];

