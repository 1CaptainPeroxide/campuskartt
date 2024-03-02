import 'package:campuskartt/Models/BookModel.dart';

var categoryData = [
  {
    "icon": "Assets/Icons/digital.png",
    "lebel": "Electronics",
    "color": "Colors.white"
  },
  {
    "icon": "Assets/Icons/bike.png",
    "lebel": "Bikes",
  },
  {
    "icon": "Assets/Icons/book.png",
    "lebel": "Books",
  },
  {
    "icon": "Assets/Icons/cloth.png",
    "lebel": "Lab Coats",
  },
  {
    "icon": "Assets/Icons/other.png",
    "lebel": "Others",
  },
];

var bookData = [
  ProductData(
      id: "1",
      title:
          "ND Bhatt Book",
      description:
          "A book for Engineering graphics for 1st year student. The book in its fifty-fourth edition provides all aspects and detailed study of Engineering Graphics or Engineering Drawing — Plane and Solid Geometry, a core subject for all branches of Engineering study, presented in a lucid manner and easy-to-follow style.",
      author: "Mohit Kumar",
      coverUrl: "Assets/Icons/02.jpg",
      category: "Books",
      usedFor: "12 Months",
      price: "500",
      phoneNumber: "+918541805152",
  ),
  ProductData(
      id: "2",
      title:
          "Chem Lab Coat ",
      description:
          "Lab coat for chemistry lab",
      author: "Neer Jain",
      coverUrl: "Assets/Icons/labcoat.jpg",
      category: "Lab Coats",
      usedFor: "1 Month",
      price: "500",
      phoneNumber: "+918541805152",
  ),

  ProductData(
      id: "3",
      title:
          "Firefox Cycle",
      description:
          "Firefox Cycle: Firefox Bikes Private Limited is an Indian Non-Government Company, incorporated on 25 Oct, 2004. It's a private unlisted company and is classified as'company limited by shares'. Company's authorized capital stands at Rs 100.0 lakhs and has 80.0% paid-up capital which is Rs 80.0 lakhs.",
      author: "Mohit Kumar",
      coverUrl: "Assets/Icons/cycle.jpg",
      category: "Bikes",
      usedFor: "4 Months",
      price: "500",
      phoneNumber: "+918541805152",
  ),
 ProductData(
      id: "4",
      title:
          "Hp Laptop",
      description:
          "2 months old Laptop",
      author: "Mohit Kumar",
      coverUrl: "Assets/Icons/laptop.png",
      category: "Electronics",
      usedFor: "6 Months",
      price: "100000",
      phoneNumber: "+918541805152",
  ),
];
