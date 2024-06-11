class Community {
  final int ctaskId;
  final int price;
  final String image;
  final double rating;
  final int humidity;
  final String temperature;
  final String title;
  final String duedate;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Community(
      {required this.ctaskId,
        required this.price,
        required this.title,
        required this.duedate,
        required this.image,
        required this.rating,
        required this.humidity,
        required this.temperature,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Community> communityList = [
    Community(
        ctaskId: 0,
        price: 22,
        title: 'Submit Project Proposal',
        duedate: '20 June',
        image: 'assets/images/Rectangle1092.png',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        isFavorated: true,
        decription:
        'Congratulations You got Golden Reward ',
        isSelected: false),
    Community(
        ctaskId: 1,
        price: 11,
        title: 'Mobile App Design',
        duedate: '21 March',
        image: 'assets/images/TrophyCup.png',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        isFavorated: false,
        decription:
        'Congratulations You got Golden Trophy ',
        isSelected: false),
    Community(
        ctaskId: 2,
        price: 18,
        title: 'Submit Project Proposal',
        duedate: 'Beach Daisy',
        image: 'assets/images/SilverMedal.png',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'Congratulations You got Silver Reward ',
        isSelected: false),
    Community(
        ctaskId: 3,
        price: 18,
        title: 'Submit Project Proposal',
        duedate: 'Beach Daisy',
        image: 'assets/images/SilverMedal.png',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'Congratulations You got Silver Reward ',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Community> getFavoritedPlants(){
    List<Community> _travelList = Community.communityList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Community> addedToCartPlants(){
    List<Community> _selectedPlants = Community.communityList;
    return _selectedPlants.where((element) => element.isSelected == true).toList();
  }
}
