class Badges {
  final int ctaskId;
  final String image;
  final String title;
  final String duedate;
  final String decription;

  Badges(
      {required this.ctaskId,
        required this.title,
        required this.duedate,
        required this.image,
        required this.decription});

  //List of Plants data
  static List<Badges> badgeList = [
    Badges(
        ctaskId: 0,
        title: 'Submit Project Proposal',
        duedate: '20 June',
        image: 'assets/images/GoldMedal.png',
        decription:
        'Congratulations You got Golden Reward '),
    Badges(
        ctaskId: 1,
        title: 'Mobile App Design',
        duedate: '21 March',
        image: 'assets/images/TrophyCup.png',
        decription:
        'Congratulations You got Golden Trophy '),
    Badges(
        ctaskId: 2,
        title: 'Submit Project Proposal',
        duedate: '21 March',
        image: 'assets/images/SilverMedal.png',
        decription:
        'Congratulations You got Silver Reward '),
    Badges(
        ctaskId: 3,
        title: 'Submit Project Proposal',
        duedate: '21 March',
        image: 'assets/images/SilverMedal.png',
        decription:
        'Congratulations You got Silver Reward '),
  ];
}
