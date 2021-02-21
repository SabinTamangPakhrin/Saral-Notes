class Forum {
  String forumId;
  String title;
  String post;
  String creator;
  String creatorImg;
  String timestamp;
  String likeCount;

  Forum({
    this.forumId,
    this.title,
    this.post,
    this.creator,
    this.creatorImg,
    this.timestamp,
    this.likeCount,
  });

  List<Forum> getForum() {
    return [
      Forum(
        forumId: '1',
        title: 'Expenses on material',
        post:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit at ipsum quis lobortis. Proin feugiat tortor leo, vel tincidunt ex blandit ut. Sed varius tellus nec tellus dapibus molestie. ',
        creator: 'Jodie Steph',
        creatorImg:
            'https://i.pinimg.com/564x/1d/04/16/1d04161aafc4483949bc341582d37764.jpg',
        timestamp: '21 hours ago',
        likeCount: '5',
      ),
      Forum(
        forumId: '2',
        title: 'Attachment apartments',
        post:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit at ipsum quis lobortis. Proin feugiat tortor leo, vel tincidunt ex blandit ut. Sed varius tellus nec tellus dapibus molestie. ',
        creator: 'William Smith',
        creatorImg:
            'https://i.pinimg.com/564x/34/44/d7/3444d76425bd160951bf42f284e05fec.jpg',
        timestamp: '21 hours ago',
        likeCount: '4',
      ),
      Forum(
        forumId: '3',
        title: 'Travel and Tourism',
        post:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit at ipsum quis lobortis. Proin feugiat tortor leo, vel tincidunt ex blandit ut. Sed varius tellus nec tellus dapibus molestie. ',
        creator: 'Lorem Ipsum',
        creatorImg:
            'https://i.pinimg.com/564x/4e/8b/b0/4e8bb041565282e6171d8ab7f7b45d71.jpg',
        timestamp: '21 hours ago',
        likeCount: '2',
      ),
      Forum(
        forumId: '4',
        title: 'Consultant and Transmission',
        post:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit at ipsum quis lobortis. Proin feugiat tortor leo, vel tincidunt ex blandit ut. Sed varius tellus nec tellus dapibus molestie. ',
        creator: 'Jodie Steph',
        creatorImg:
            'https://i.pinimg.com/564x/1d/04/16/1d04161aafc4483949bc341582d37764.jpg',
        timestamp: '21 hours ago',
        likeCount: '5',
      ),
    ];
  }
}
