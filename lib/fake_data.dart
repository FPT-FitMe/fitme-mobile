import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/personal_trainer.dart';
import 'package:fitme/models/plan.dart';

final LIST_PLAN = [
  Plan(
      id: DateTime.now().day,
      listExercise: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      listGoal: LIST_GOAL,
      totalOfCaloIn: 325,
      totolOfCaloOut: 250),
  Plan(
      id: DateTime.now().day - 1,
      listExercise: LIST_EXERCISE2,
      listMeal: LIST_MEAL2,
      listGoal: LIST_GOAL2,
      totalOfCaloIn: 200,
      totolOfCaloOut: 110)
];
const LIST_COACH = const [
  PersonalTrainer(
      id: 1,
      name: 'Linh',
      imageUrl:
          'https://s3-ap-southeast-1.amazonaws.com/cmg-f8/4eb28968-66b1-11eb-a371-f2d04e0ae674/9e91e198-e796-403c-81da-a6f904f220b0-MAN_6057.jpg',
      information:
          "“Chính sức khỏe mới là sự giàu có thực sự, không phải vàng và bạc” - Mahatma Gandhi \nTập luyện cùng HLV cá nhân là cách nhanh và hiệu quả nhất để bạn đạt được mục tiêu sức khỏe và thể hình của bạn ",
      listExcersice: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      fullname: 'Nguyễn Văn Linh'),
  PersonalTrainer(
      id: 2,
      name: 'Đạt',
      imageUrl:
          'https://scontent-sin6-1.xx.fbcdn.net/v/t1.6435-9/146102237_2362533387224552_6033412381923862316_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=SWqCqOemplQAX-LO-hR&_nc_ht=scontent-sin6-1.xx&oh=4eca4acf7f60d821e343ef23731d8f4d&oe=60E29DEB',
      information:
          "“Chính sức khỏe mới là sự giàu có thực sự, không phải vàng và bạc” - Mahatma Gandhi \nTập luyện cùng HLV cá nhân là cách nhanh và hiệu quả nhất để bạn đạt được mục tiêu sức khỏe và thể hình của bạn ",
      listExcersice: LIST_EXERCISE2,
      listMeal: LIST_MEAL,
      fullname: "Hồ Hào Đạt"),
];

const LIST_GOAL = const [
  Exercise(
    id: 1,
    name: 'Yoga buổi sáng',
    imageUrl:
        'http://www.sido.com.vn/category/banner_20200306204724_0_Yoga_Pic_v2.jpg',
    duration: 50,
    cal: 150,
    isFavorite: true,
    isPremium: true,
  ),
];
const LIST_MEAL = const [
  Meal(
    id: 1,
    name: 'Salad bắp cải',
    imageUrl:
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/1/FN_Sauteed-Vegetable-Medley_H2_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568400650030.jpeg',
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: false,
  ),
  Meal(
    id: 2,
    name: 'Rau củ nướng',
    imageUrl:
        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/aubergine-goulash_1-e33971f.jpg?webp=true&quality=90&resize=500%2C454',
    duration: 15,
    cal: 300,
    isFavorite: false,
    isPremium: false,
  ),
];
const LIST_EXERCISE = const [
  Exercise(
    id: 2,
    name: 'Khởi động',
    imageUrl: 'https://boidapchay.com/wp-content/uploads/2019/01/cover.jpg',
    duration: 10,
    cal: 50,
    isFavorite: true,
    isPremium: false,
  ),
  Exercise(
    id: 3,
    name: 'Giãn cơ',
    imageUrl: 'http://cdn.thehinh.com/2017/09/gian-co-la-gi-2.jpg',
    duration: 10,
    cal: 25,
    isFavorite: false,
    isPremium: false,
  ),
];

const LIST_EXERCISE2 = const [
  Exercise(
    id: 1,
    name: 'Yoga buổi sáng',
    imageUrl:
        'http://www.sido.com.vn/category/banner_20200306204724_0_Yoga_Pic_v2.jpg',
    duration: 50,
    cal: 150,
    isFavorite: true,
    isPremium: true,
  ),
];
const LIST_MEAL2 = const [
  Meal(
    id: 1,
    name: 'Salad bắp cải',
    imageUrl:
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/1/FN_Sauteed-Vegetable-Medley_H2_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568400650030.jpeg',
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: false,
  ),
  Meal(
    id: 2,
    name: 'Rau củ nướng',
    imageUrl:
        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/aubergine-goulash_1-e33971f.jpg?webp=true&quality=90&resize=500%2C454',
    duration: 15,
    cal: 300,
    isFavorite: false,
    isPremium: false,
  ),
];
const LIST_GOAL2 = const [
  Exercise(
    id: 2,
    name: 'Khởi động',
    imageUrl: 'https://boidapchay.com/wp-content/uploads/2019/01/cover.jpg',
    duration: 10,
    cal: 50,
    isFavorite: true,
    isPremium: false,
  ),
  Exercise(
    id: 3,
    name: 'Giãn cơ',
    imageUrl: 'http://cdn.thehinh.com/2017/09/gian-co-la-gi-2.jpg',
    duration: 10,
    cal: 25,
    isFavorite: false,
    isPremium: false,
  ),
];
