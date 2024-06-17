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
        title: 'Alex Linderson',
        duedate: '20 June',
        image: 'assets/images/Rectangle1092.png',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        isFavorated: true,
        decription:
        'I feel like I’m not doing enough...',
        isSelected: false),
    Community(
        ctaskId: 1,
        price: 11,
        title: 'John Ahraham',
        duedate: '21 March',
        image: 'assets/images/Rectangle1093.png',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        isFavorated: false,
        decription:
        'Everyone has their own journey and pace and you rly shouldn’t  measure yourself to the standards of others ! Personally !',
        isSelected: false),
    Community(
        ctaskId: 2,
        price: 18,
        title: 'Sabila Sayma',
        duedate: 'Beach Daisy',
        image: 'assets/images/Rectangle1094.png',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'This is kind a weird but having a more clear work/life balance? I find that helps me make time for hobbies i care about.',
        isSelected: false),
    Community(
        ctaskId: 3,
        price: 18,
        title: 'John Borino',
        duedate: 'Beach Daisy',
        image: 'assets/images/Ellipse308.png',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'Don’t worry about what others say !',
        isSelected: false),
    Community(
        ctaskId: 4,
        price: 18,
        title: 'John Borino',
        duedate: 'Beach Daisy',
        image: 'assets/images/Ellipse308.png',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'Don’t worry about what others say !',
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
