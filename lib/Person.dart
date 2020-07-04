class Person {
  String firstname;
  String lastname;
  String imgUrl;
  String lastMsg;
  String time;

  Person({this.firstname, this.lastname, this.imgUrl, this.lastMsg, this.time});

  static List<Person> getPeople(){
    return [
      Person(firstname: 'Plisi', lastname: 'Livi', imgUrl: 'https://i.imgur.com/5voBLf4.png', lastMsg: 'the word bed, look like a bed', time: "16:32"),
      Person(firstname: 'Alike', lastname: 'Andy', imgUrl: 'https://i.imgur.com/1P8y9N8.png', lastMsg: 'Omg! Code Minute is really nice', time: "13:00"),
      Person(firstname: 'Sub', lastname: 'Iscribe', imgUrl: 'https://i.imgur.com/prZceZF.png', lastMsg: 'Should leave a like', time: "12:30"),
      Person(firstname: 'Maybe', lastname: 'Leave', imgUrl: 'https://i.imgur.com/7YZ26Uu.png', lastMsg: 'Send Nudes', time: "08:00"),
      Person(firstname: 'Acomment', lastname: 'Tohelp', imgUrl: 'https://i.imgur.com/H9yLoeD.png', lastMsg: 'Velcro? What a Rip off', time: "07:22"),
      Person(firstname: 'Thechannel', lastname: 'Grow', imgUrl: 'https://i.imgur.com/tYa12bD.png', lastMsg: 'Russian dolls are full of themselfs', time: "Yesterday"),

    ];    
  }
}