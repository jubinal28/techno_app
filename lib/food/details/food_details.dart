// ignore: camel_case_types
import '../../../../constants/assets.dart';

class CommentsList {
  final String imagePath;
  final String? comment;
  final String? like;
  final String? dislike;

  CommentsList({
    required this.imagePath,
    this.comment,
    this.like,
    this.dislike,
  });
}

List<CommentsList> commentlist = [
  CommentsList(
    imagePath: Assets.pfp,
    comment:
        '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"',
    like: Assets.like,
    dislike: Assets.dislike,
  ),
  CommentsList(
    imagePath: Assets.pfp,
    comment:
        '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"',
    like: Assets.like,
    dislike: Assets.dislike,
  ),
  CommentsList(
    imagePath: Assets.pfp,
    comment:
        '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"',
    like: Assets.like,
    dislike: Assets.dislike,
  ),
  CommentsList(
    imagePath: Assets.pfp,
    comment:
        '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"',
    like: Assets.like,
    dislike: Assets.dislike,
  ),
  // CommentsList(
  //   imagePath: Assets.pfp,
  //   comment: 'Write you’re feedback...',
  //   like: '',
  //   dislike: '',
  // ),
];
