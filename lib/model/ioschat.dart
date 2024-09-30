class ChatItem {
  final String name;
  final String message;
  final String time;
  final String imagePath;
  final String contactNumber;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.imagePath,
    required this.contactNumber,
  });
}

List<ChatItem> chatItems = [
  ChatItem(
    name: "Yashvi",
    message: "Hey, how are you?",
    time: "2:30 PM",
    imagePath: "assets/download.png",
    contactNumber: "9898569735",
  ),
  ChatItem(
    name: "Foram",
    message: "Let's meet tomorrow.",
    time: "1:15 PM",
    imagePath: "assets/download.png",
    contactNumber: "9081342355",
  ),
  ChatItem(
    name: "Aayushi",
    message: "Do you want to grab lunch?",
    time: "12:45 PM",
    imagePath: "assets/download.png",
    contactNumber: "2345678901",
  ),
  ChatItem(
    name: "Khushi",
    message: "I sent you the files.",
    time: "11:30 AM",
    imagePath: "assets/download.png",
    contactNumber: "3456789012",
  ),
  ChatItem(
    name: "Krupali",
    message: "Check out this link!",
    time: "10:00 AM",
    imagePath: "assets/download.png",
    contactNumber: "4567890123",
  ),
  ChatItem(
    name: "Diya",
    message: "Happy Birthday!",
    time: "9:15 AM",
    imagePath: "assets/download.png",
    contactNumber: "5678901234",
  ),
  ChatItem(
    name: "Divyanshi",
    message: "Are we still on for the meeting?",
    time: "8:00 AM",
    imagePath: "assets/download.png",
    contactNumber: "6789012345",
  ),
  ChatItem(
    name: "Srishti",
    message: "Good to see you yesterday!",
    time: "Yesterday",
    imagePath: "assets/download.png",
    contactNumber: "7890123456",
  ),
  ChatItem(
    name: "Rajiya",
    message: "Let's go for a run this weekend.",
    time: "Last Week",
    imagePath: "assets/download.png",
    contactNumber: "8901234567",
  ),
  ChatItem(
    name: "Jiya",
    message: "Can you send me the details?",
    time: "Last Week",
    imagePath: "assets/download.png",
    contactNumber: "9012345678",
  ),
];
