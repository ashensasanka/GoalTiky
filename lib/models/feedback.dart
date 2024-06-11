class FeedBack {
  final int ctaskId;
  final int price;
  final String profimg;
  final double rating;
  final int humidity;
  final String temperature;
  final String title;
  final String duedate;
  bool isFavorated;
  final String decription;
  bool isSelected;

  FeedBack(
      {required this.ctaskId,
        required this.price,
        required this.title,
        required this.duedate,
        required this.profimg,
        required this.rating,
        required this.humidity,
        required this.temperature,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<FeedBack> feedbackList = [
    FeedBack(
        ctaskId: 0,
        price: 22,
        title: 'Submit Project Proposal',
        duedate: '20 June',
        profimg: 'assets/images/image4.png',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        isFavorated: true,
        decription:
        'Congratulations You got Golden Reward ',
        isSelected: false),
    FeedBack(
        ctaskId: 1,
        price: 11,
        title: 'Mobile App Design',
        duedate: '21 March',
        profimg: 'assets/images/image4.png',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        isFavorated: false,
        decription:
        'Congratulations You got Golden Trophy ',
        isSelected: false),
    FeedBack(
        ctaskId: 2,
        price: 18,
        title: 'Submit Project Proposal',
        duedate: 'Beach Daisy',
        profimg: 'assets/images/image4.png',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'Congratulations You got Silver Reward ',
        isSelected: false),
    FeedBack(
        ctaskId: 3,
        price: 18,
        title: 'Submit Project Proposal',
        duedate: 'Beach Daisy',
        profimg: 'assets/images/image4.png',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'Congratulations You got Silver Reward ',
        isSelected: false),
  ];

  //Get the favorated items
  static List<FeedBack> getFavoritedPlants(){
    List<FeedBack> _travelList = FeedBack.feedbackList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<FeedBack> addedToCartPlants(){
    List<FeedBack> _selectedPlants = FeedBack.feedbackList;
    return _selectedPlants.where((element) => element.isSelected == true).toList();
  }
}
