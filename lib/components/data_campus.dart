class DataCampus {
  String name;
  String imageUrl;
  String description;
  String address;


  DataCampus({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.address,
  });
}

List<DataCampus> categories = [
  DataCampus(
    name: 'Bachelor Campus',
    imageUrl: 'images/bachelor_campus.png.jpg',
    description:
    '.Faculty of Art and Design\n.Faculty of Engineering and Architecture',
    address: 'Address: Muhtar Sokak No: 3 Kavacık - Beykoz / İstanbul',
  ),

  DataCampus(
    name: 'Rectorate Campus',
    imageUrl: 'images/international_office.png.jpg',
    description:
    '.International Office',
    address: 'Kavacık Mahallesi Orhan Veli Kanık Caddesi No:114, 34810 Beykoz/İstanbul',
  ),

  DataCampus(
    name: 'Labs and Studios',
    imageUrl: 'images/lab_campus.png.jpg',
    description:
    '.Drafting Studio\n.Digital Systems Lab\n.Embedded Systems Lab\n.Physics Lab\n.Production Systems and Robotics Lab\n.Center for Applied Clinical Psychology',
    address: 'Ertürk Sokak No: 6 Kavacık - Beykoz / İstanbul',
  ),

  DataCampus(
    name: 'Foreign Languages\nCampus',
    imageUrl: 'images/language_campus.png.jpg',
    description:
    '.English Preparatory Program\n.Gastronomy and Culinary Arts Bachelor\nProgram\n.Cookery Associate Program',
    address: 'Fatih Sultan Mehmet Caddesi Şehit Er Cengiz Karcıoğlu Sokak No: 7 Kavacık Beykoz İstanbul',
  ),

  DataCampus(
    name: 'Kavacik Campus',
    imageUrl: 'images/main_campus.png.png',
    description:
    '.Institute of Graduate Programs\n.Faculty of Business and Administrative\nSciences\n.Faculty of Social Sciences\n.School of Civil Aviation',
    address: 'Vatan Caddesi No: 69 PK: 34805 Kavacık - Beykoz / İstanbul',
  ),

];
