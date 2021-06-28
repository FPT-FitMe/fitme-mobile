import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/post.dart';
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
      listGoal: LIST_GOAL, //list nay null de check hoan thanh chua
      listPost: LIST_POST,
      totalOfCaloIn: 325,
      totalOfCaloOut: 250),
  Plan(
      id: DateTime.now().day - 1,
      listExercise: LIST_EXERCISE2,
      listMeal: LIST_MEAL2,
      listGoal: LIST_GOAL2,
      listPost: LIST_POST,
      totalOfCaloIn: 200,
      totalOfCaloOut: 110)
];
const LIST_COACH = const [
  PersonalTrainer(
      id: 1,
      name: 'Linh',
      imageUrl:
          'https://images.unsplash.com/photo-1621890369918-521fb893180c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
      information:
          "“Chính sức khỏe mới là sự giàu có thực sự, không phải vàng và bạc” - Mahatma Gandhi ",
      listExcersice: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      fullname: 'Lalisa'),
  PersonalTrainer(
      id: 2,
      name: '',
      imageUrl:
          "https://images.unsplash.com/photo-1599058917727-824293170100?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZpdG5lc3MlMjBtYW58ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      information:
          "“Chính sức khỏe mới là sự giàu có thực sự, không phải vàng và bạc” - Mahatma Gandhi",
      listExcersice: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      fullname: "Tony Stark"),
];

const List<Exercise> LIST_GOAL = const [];
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
    tag: ["Sáng"],
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
    tag: ["Trưa"],
  ),
];
const LIST_POST = const [
  Post(
    id: 1,
    name: 'Chạy bộ cùng Linh',
    imageUrl:
        'https://vnn-imgs-f.vgcloud.vn/2018/05/02/08/di-bo-co-thuc-su-la-cach-tap-the-duc-hoan-hao.jpg',
    duration: 10,
  ),
  Post(
    id: 2,
    name: 'Vì cơ thể bạn cần nước',
    imageUrl:
        'https://media.suckhoedoisong.vn/Images/nguyenkhanh/2019/06/27/uong_nuoc_sao_cho_du.jpg',
    duration: 7,
  ),
];
const LIST_EXERCISE = const [
  Exercise(
    id: 1,
    name: 'Luyện tay trước',
    imageUrl:
        'https://images.unsplash.com/photo-1532384661798-58b53a4fbe37?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    duration: 20,
    cal: 50,
    isFavorite: true,
    isPremium: false,
  ),
  Exercise(
    id: 2,
    name: 'Khởi động',
    imageUrl: 'https://boidapchay.com/wp-content/uploads/2019/01/cover.jpg',
    duration: 10,
    cal: 50,
    isFavorite: true,
    isPremium: false,
  )
];

const LIST_EXERCISE2 = const [
  Exercise(
    id: 1,
    name: 'Luyện tay sau',
    imageUrl:
        'https://images.unsplash.com/photo-1581009137042-c552e485697a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: true,
  ),
  Exercise(
    id: 2,
    name: 'Luyện tay trước',
    imageUrl:
        'https://images.unsplash.com/photo-1532384661798-58b53a4fbe37?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    duration: 20,
    cal: 50,
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
    tag: ["Sáng"],
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
    tag: ["Tối"],
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
const LIST_FINISH = [
  Exercise(
    id: 2,
    name: 'Khởi động',
    imageUrl: 'https://boidapchay.com/wp-content/uploads/2019/01/cover.jpg',
    duration: 10,
    cal: 50,
    isFavorite: true,
    isPremium: false,
  ),
  Meal(
      id: 1,
      name: 'Salad bắp cải',
      imageUrl:
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/1/FN_Sauteed-Vegetable-Medley_H2_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568400650030.jpeg',
      duration: 20,
      cal: 150,
      isFavorite: true,
      isPremium: false,
      tag: ["Sáng"]),
];

var listSurveys = [
  Survey(
    question: "Chế độ ăn uống hiện tại của bạn ?",
    answers: [
      "Không nguyên tắc",
      "Không tinh bột",
      "Ăn chay hoàn toàn",
      "Không ăn thịt",
    ],
  ),
  Survey(
    question: "cai nay de skip tai tao luoi lam logic",
    answers: [
      "Giảm cân",
      "Duy trì vóc dáng hiện tại",
      "Tăng cân",
      "Cân bằng sức khỏe",
    ],
  ),
  Survey(
    question: "Bạn muốn đạt mục tiêu này trong khoảng thời gian bao lâu ?",
    answers: [
      "30 ngày",
      "3 tháng",
      "6 tháng",
      "1 năm",
    ],
  ),
  Survey(
    question: "Tần suất tập bạn mong muốn ?",
    answers: [
      "Dưới 3 ngày / tuần",
      "3 ngày / tuần",
      "4 ngày / tuần",
      "5 ngày / tuần",
      "6 ngày hoặc cả tuần",
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
      tag: ["Sáng"],
    ),
    content: "",
    traineeId: 1,
  ),
  MealLog(
    date: DateTime.now(),
    meal: Meal(
      id: 2,
      name: 'Cháo yến mạch trái cây',
      imageUrl:
          'https://images.unsplash.com/photo-1494597564530-871f2b93ac55?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80',
      duration: 10,
      cal: 100,
      isFavorite: true,
      isPremium: false,
      tag: ["Trưa"],
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
      name: 'Tập tay trước',
      imageUrl:
          'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
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
      id: 2,
      name: 'Kéo xà đơn',
      imageUrl:
          'https://images.unsplash.com/photo-1597347316205-36f6c451902a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      duration: 10,
      cal: 130,
      isFavorite: true,
      isPremium: true,
    ),
    content: "",
    traineeId: 1,
  ),
  WorkoutLog(
    date: DateTime.now(),
    exercise: Exercise(
      id: 3,
      name: 'Tập chân trước',
      imageUrl:
          'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      duration: 50,
      cal: 200,
      isFavorite: true,
      isPremium: true,
    ),
    content: "",
    traineeId: 1,
  ),
];
