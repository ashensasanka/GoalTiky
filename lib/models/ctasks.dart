class Ctasks {
  final int ctaskId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String title;
  final String plantName;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Ctasks(
      {required this.ctaskId,
        required this.price,
        required this.title,
        required this.plantName,
        required this.size,
        required this.rating,
        required this.humidity,
        required this.temperature,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Ctasks> plantList = [
    Ctasks(
        ctaskId: 0,
        price: 22,
        title: 'Submit Project Proposal',
        plantName: 'Sanseviera',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        isFavorated: true,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Ctasks(
        ctaskId: 1,
        price: 11,
        title: 'Mobile App Design',
        plantName: 'Philodendron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Ctasks(
        ctaskId: 2,
        price: 18,
        title: 'Submit Project Proposal',
        plantName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Ctasks(
        ctaskId: 3,
        price: 30,
        title: 'Mobile App Design',
        plantName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Ctasks> getFavoritedPlants(){
    List<Ctasks> _travelList = Ctasks.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Ctasks> addedToCartPlants(){
    List<Ctasks> _selectedPlants = Ctasks.plantList;
    return _selectedPlants.where((element) => element.isSelected == true).toList();
  }
}
