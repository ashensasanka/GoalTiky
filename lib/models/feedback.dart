class FeedBack {
  final int ctaskId;
  final String profimg;
  final String title;
  final String duedate;
  final String decription;

  FeedBack(
      {required this.ctaskId,
        required this.title,
        required this.duedate,
        required this.profimg,
        required this.decription,});

  //List of Plants data
  static List<FeedBack> feedbackList = [
    FeedBack(
        ctaskId: 0,
        title: 'Submit Project Proposal',
        duedate: '20 June',
        profimg: 'assets/images/image4.png',
        decription:
        'Congratulations You got Golden Reward '),
    FeedBack(
        ctaskId: 1,
        title: 'Mobile App Design',
        duedate: '21 March',
        profimg: 'assets/images/image4.png',
        decription:
        'Congratulations You got Golden Trophy ',),
    FeedBack(
        ctaskId: 2,
        title: 'Submit Project Proposal',
        duedate: '21 March',
        profimg: 'assets/images/image4.png',
        decription:
        'Congratulations You got Silver Reward '),
    FeedBack(
        ctaskId: 3,
        title: 'Submit Project Proposal',
        duedate: '21 March',
        profimg: 'assets/images/image4.png',
        decription:
        'Congratulations You got Silver Reward '),
  ];
}
