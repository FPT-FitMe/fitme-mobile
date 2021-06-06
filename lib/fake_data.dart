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
      totolOfCaloOut: 250),
  Plan(
      id: DateTime.now().day - 1,
      listExercise: LIST_EXERCISE2,
      listMeal: LIST_MEAL2,
      listGoal: LIST_GOAL2,
      totalOfCaloIn: 200,
      totolOfCaloOut: 110)
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
    name: 'Spaghetti with Tomato Sauce',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: false,
  ),
  Meal(
    id: 2,
    name: 'Toast Hawaii',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
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
    name: 'Spaghetti with Tomato Sauce',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: false,
  ),
  Meal(
    id: 2,
    name: 'Toast Hawaii',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
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
