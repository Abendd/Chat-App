Map<String, UserInfo> chats = {
  'Rishabh The Jaypee': UserInfo(messages: [
    {'sentByMe': 'false', 'text': 'bro zomentum mein hua tera?'},
    {'sentByMe': ' true', 'text': 'haa bhai mera ho gya!'},
    {'sentByMe': 'true', 'text': 'mast job hai ekdum!'}
  ], dp: 'https://cdn.sharechat.com/cccbcdd8-38e6-45f5-ad88-dcf7c5dc2b38-d8e1f3f0-8489-417e-898b-219d8a6eede0.jpeg'),
  'Ankit The Bathla': UserInfo(messages: [
    {'sentByMe': 'true', 'text': 'kya haal?'},
    {'sentByMe': 'true', 'text': 'sab sahi?'},
    {'sentByMe': 'false', 'text': 'bss'},
    {'sentByMe': 'false', 'text': 'aapki dua se!'}
  ], dp: 'https://images.pexels.com/photos/1315741/pexels-photo-1315741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  'Shobhit bhai': UserInfo(messages: [
    {'sentByMe': 'true', 'text': 'yo!'},
    {'sentByMe': 'true', 'text': 'wassup?'},
    {'sentByMe': 'false', 'text': 'hi'},
    {'sentByMe': 'false', 'text': 'nothing much!'}
  ], dp: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/01/326507_2200-732x549.jpg'),
};

class UserInfo {
  final List<Map<String, String>> messages;
  final String dp;

  UserInfo({this.messages, this.dp});

  addMessage(String val) {
    messages.add({'sentByMe': 'true', 'text': val});
  }
}
