import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/plan.dart';

final LIST_PLAN = [
  Plan(
      id: DateTime.now().day,
      listExercise: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      listGoal: LIST_GOAL,
      totalOfCaloIn: 325,
      totalOfCaloOut: 250),
  Plan(
      id: DateTime.now().day - 1,
      listExercise: LIST_EXERCISE2,
      listMeal: LIST_MEAL2,
      listGoal: LIST_GOAL2,
      totalOfCaloIn: 200,
      totalOfCaloOut: 110)
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