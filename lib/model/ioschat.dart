final List<ChatItem> chatItems = [
  ChatItem('Bruce Wayne', 'The night is darkest...', '9:15 pm',
      'assets/images/bruce_wayne.jpg'),
  ChatItem('Clark Kent', 'Up, up, and away!', '10:05 am',
      'assets/images/clark_kent.jpg'),
  ChatItem('Diana Prince', 'Truth will always prevail.', '11:30 am',
      'assets/images/diana_prince.jpg'),
  ChatItem('Arthur Curry', 'I control the seas.', '3:45 pm',
      'assets/images/arthur_curry.jpg'),
  ChatItem('Barry Allen', 'Speed is my thing.', '1:20 pm',
      'assets/images/barry_allen.jpg'),
  ChatItem('Victor Stone', 'I am more than just a machine.', '5:00 pm',
      'assets/images/victor_stone.jpg'),
  ChatItem('Lex Luthor', 'Power is everything.', 'Yesterday',
      'assets/images/lex_luthor.jpg'),
  ChatItem('Harley Quinn', 'Let’s cause some chaos!', 'Today',
      'assets/images/harley_quinn.jpg'),
  ChatItem('Joker', 'Why so serious?', 'Now', 'assets/images/joker.jpg'),
  ChatItem('Alfred Pennyworth', 'Always at your service.', 'Now',
      'assets/images/alfred_pennyworth.jpg'),
];

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String imagePath;

  ChatItem(this.name, this.message, this.time, this.imagePath);
}
