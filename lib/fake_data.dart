import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/personal_trainer.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/survey.dart';
import 'package:fitme/models/workout_log.dart';

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
const LIST_COACH = const [
  PersonalTrainer(
      id: 1,
      name: 'Linh',
      imageUrl:
          'https://s3-ap-southeast-1.amazonaws.com/cmg-f8/4eb28968-66b1-11eb-a371-f2d04e0ae674/9e91e198-e796-403c-81da-a6f904f220b0-MAN_6057.jpg',
      information:
          "“Chính sức khỏe mới là sự giàu có thực sự, không phải vàng và bạc” - Mahatma Gandhi ",
      listExcersice: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      fullname: 'Nguyễn Văn Linh'),
  PersonalTrainer(
      id: 2,
      name: 'Đạt',
      imageUrl:
          "https://www.ffs.ie/hs-fs/hubfs/Daragh%20McDonnell_Revised.jpg?width=435&name=Daragh%20McDonnell_Revised.jpg",
      information:
          "“Chính sức khỏe mới là sự giàu có thực sự, không phải vàng và bạc” - Mahatma Gandhi",
      listExcersice: LIST_EXERCISE,
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

var listSurveys = [
  Survey(
    question: "Tần suất tập của bạn ?",
    answers: [
      "Dưới 3 ngày / tuần",
      "3 ngày / tuần",
      "4 ngày / tuần",
      "5 ngày / tuần",
      "6 ngày / tuần",
    ],
  ),
  Survey(
    question: "Bạn tổ chức bữa ăn thế nào ?",
    answers: [
      "Sáng, trưa, tối",
      "Trưa và tối",
      "3 bữa với xế",
      "Fasting trung hạn(18h-3 ngày)",
      "Fasting lâu(>5 ngày)",
    ],
  ),
  Survey(
    question: "Chế độ ăn uống của bạn ?",
    answers: [
      "Thông thường (không nguyên tắc)",
      "Không ăn thịt",
      "Chay hoàn toàn",
      "Keto (mỡ và thịt)",
    ],
  ),
  Survey(
    question: "Mục tiêu của bạn ?",
    answers: [
      "Giảm cân",
      "Có cơ thể gọn gàng",
      "Tăng sức bền/ dẻo dai",
      "Tinh thần thoải mái, ổn định",
    ],
  ),
];

List<MealLog> listMealLog = [
  MealLog(
    date: DateTime.now(),
    meal: Meal(
      id: 1,
      name: 'Salad bắp cải',
      imageUrl:
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/1/FN_Sauteed-Vegetable-Medley_H2_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568400650030.jpeg',
      duration: 20,
      cal: 150,
      isFavorite: true,
      isPremium: false,
    ),
    content: "",
    traineeId: 1,
  ),
  MealLog(
    date: DateTime.now(),
    meal: Meal(
      id: 1,
      name: 'Salad bắp cải',
      imageUrl:
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/1/FN_Sauteed-Vegetable-Medley_H2_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568400650030.jpeg',
      duration: 20,
      cal: 150,
      isFavorite: true,
      isPremium: false,
    ),
    content: "",
    traineeId: 1,
  ),
];

List<WorkoutLog> listWorkoutLog = [
  WorkoutLog(
    date: DateTime.now(),
    exercise: Exercise(
      id: 1,
      name: 'Yoga buổi sáng',
      imageUrl:
          'http://www.sido.com.vn/category/banner_20200306204724_0_Yoga_Pic_v2.jpg',
      duration: 50,
      cal: 150,
      isFavorite: true,
      isPremium: true,
    ),
    content: "",
    traineeId: 1,
  ),
  WorkoutLog(
    date: DateTime.now(),
    exercise: Exercise(
      id: 1,
      name: 'Yoga buổi sáng',
      imageUrl:
          'http://www.sido.com.vn/category/banner_20200306204724_0_Yoga_Pic_v2.jpg',
      duration: 50,
      cal: 150,
      isFavorite: true,
      isPremium: true,
    ),
    content: "",
    traineeId: 1,
  ),
  WorkoutLog(
    date: DateTime.now(),
    exercise: Exercise(
      id: 1,
      name: 'Yoga buổi sáng',
      imageUrl:
          'http://www.sido.com.vn/category/banner_20200306204724_0_Yoga_Pic_v2.jpg',
      duration: 50,
      cal: 150,
      isFavorite: true,
      isPremium: true,
    ),
    content: "",
    traineeId: 1,
  ),
];
