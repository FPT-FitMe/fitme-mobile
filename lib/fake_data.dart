import 'package:fitme/models/achivement.dart';
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
      id: 0,
      name: 'Lalisa',
      imageUrl:
          'https://i.pinimg.com/originals/0f/56/51/0f56511d7e416da63782dd0cc73816f1.png',
      tagName: 'Body builder',
      information:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      listExcersice: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      fullname: 'Lalisa Monoban'),
  PersonalTrainer(
      id: 1,
      name: 'Rose',
      imageUrl: "https://i.imgur.com/zCiPWRn.jpeg",
      tagName: 'Yoga, Thể hình',
      information:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      listExcersice: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      fullname: "Rose"),
  PersonalTrainer(
      id: 2,
      name: 'Ariana Grande',
      imageUrl: "https://i.imgur.com/u4EVYZC.jpg",
      tagName: 'Boxing, Thể hình',
      information:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      listExcersice: LIST_EXERCISE,
      listMeal: LIST_MEAL,
      fullname: "Ariana Grande"),
];

const List<Exercise> LIST_GOAL = const [];
const LIST_MEAL = const [
  Meal(
    id: 1,
    name: 'Salad bắp cải',
    imageUrl:
        'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    description: "20 phút - 150 cal",
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: false,
    tag: ["Sáng"],
    ingredients: ["Salad", "Bắp cải", "Dầu mè"],
  ),
  Meal(
    id: 2,
    name: 'Rau củ nướng',
    imageUrl:
        'https://images.unsplash.com/photo-1523813301608-f54a198f6b5f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    description: "15 phút - 300 cal",
    duration: 15,
    cal: 300,
    isFavorite: false,
    isPremium: false,
    tag: ["Trưa"],
    ingredients: ["Rau củ", "Sốt", "Dầu mè"],
  ),
];
const LIST_MEAL1 = const [
  Meal(
    id: 2,
    name: 'Salad bắp cải',
    imageUrl:
        'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    description: "20 phút - 150 cal",
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: true,
    tag: ["Sáng"],
    ingredients: ["Salad", "Bắp cải", "Dầu mè"],
  ),
  Meal(
    id: 2,
    name: 'Rau củ nướng',
    imageUrl:
        'https://images.unsplash.com/photo-1523813301608-f54a198f6b5f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    description: "15 phút - 300 cal",
    duration: 15,
    cal: 300,
    isFavorite: true,
    isPremium: true,
    tag: ["Trưa"],
    ingredients: ["Rau củ", "Sốt", "Dầu mè"],
  ),
  Meal(
    id: 3,
    name: 'Pasta hải sản',
    imageUrl:
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    description: "10 phút - 300 cal",
    duration: 10,
    cal: 300,
    isFavorite: false,
    isPremium: false,
    tag: ["Tối"],
    ingredients: ["Mì pasta", "Hải sản", "Sốt kem"],
  ),
];
const LIST_POST = const [
  Post(
    id: 0,
    name: 'Chạy bộ cùng Linh',
    imageUrl:
        'https://vnn-imgs-f.vgcloud.vn/2018/05/02/08/di-bo-co-thuc-su-la-cach-tap-the-duc-hoan-hao.jpg',
    headline: "Chạy bộ và những lợi ích không tưởng",
    content:
        "Bottom sheet is a nice component given by Material design. It like a dialog which is open from the bottom. Most of the apps use this bottom sheet to add some extra setting kind of things. May be you have seen this is a app called Tasks created by google. In there when we try to create a new task it show a bottom sheet with text input field and the several buttons.",
    duration: 10,
    authorID: 1,
  ),
  Post(
    id: 1,
    name: 'Vì cơ thể bạn cần nước',
    imageUrl:
        'https://media.suckhoedoisong.vn/Images/nguyenkhanh/2019/06/27/uong_nuoc_sao_cho_du.jpg',
    headline: "Nước vô cùng quan trọng với cơ thể",
    content:
        "Bottom sheet is a nice component given by Material design. It like a dialog which is open from the bottom. Most of the apps use this bottom sheet to add some extra setting kind of things. May be you have seen this is a app called Tasks created by google. In there when we try to create a new task it show a bottom sheet with text input field and the several buttons.",
    duration: 7,
    authorID: 0,
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
    isSkipped: false,
    isFinished: false,
  ),
  Exercise(
    id: 2,
    name: 'Khởi động',
    imageUrl: 'https://boidapchay.com/wp-content/uploads/2019/01/cover.jpg',
    duration: 10,
    cal: 50,
    isFavorite: true,
    isPremium: false,
    isSkipped: false,
    isFinished: false,
  )
];
const LIST_ACHIVEMENT = const [
  Achivement(
    id: 0,
    name: 'Hoàn thành bài tâp đầu tiên',
    title: 'First workout',
    imageUrl:
        'https://images.unsplash.com/photo-1587986174328-47e12c4d1e60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=537&q=80',
  ),
  Achivement(
    id: 1,
    name: 'Hoàn thành thử thách tập fullbody',
    title: 'Full body challenge',
    imageUrl:
        'https://images.unsplash.com/photo-1587652990204-1671eeaac77e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=533&q=80',
  ),
  Achivement(
    id: 2,
    name: 'Hoàn thành bài chạy bộ đầu tiên',
    title: 'First Running Workout',
    imageUrl:
        'https://images.unsplash.com/photo-1564054074885-e5a7c93671d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
  ),
  Achivement(
    id: 3,
    name: 'Hoàn thành 7 ngày tập liên tiếp',
    title: '7-Workout Week',
    imageUrl:
        'https://images.unsplash.com/photo-1587567711116-272a3a927415?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=531&q=80',
  ),
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
    isPremium: false,
    isSkipped: true,
    isFinished: false,
  ),
  Exercise(
    id: 2,
    name: 'Luyện tay trước',
    imageUrl:
        'https://images.unsplash.com/photo-1532384661798-58b53a4fbe37?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    duration: 20,
    cal: 50,
    isFavorite: true,
    isPremium: false,
    isSkipped: false,
    isFinished: true,
  ),
];
const LIST_MEAL2 = const [
  Meal(
    id: 1,
    name: 'Salad bắp cải',
    imageUrl:
        'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    description: "20 phút - 150 cal",
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: false,
    tag: ["Sáng"],
    ingredients: ["Salad", "Bắp cải", "Dầu mè"],
  ),
  Meal(
    id: 2,
    name: 'Rau củ nướng',
    imageUrl:
        'https://images.unsplash.com/photo-1461530927168-44328109da52?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    description: "15 phút - 300 cal",
    duration: 15,
    cal: 300,
    isFavorite: false,
    isPremium: false,
    tag: ["Trưa"],
    ingredients: ["Rau củ", "Sốt", "Dầu mè"],
  ),
  Meal(
    id: 3,
    name: 'Pasta hải sản',
    imageUrl:
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    description: "10 phút - 300 cal",
    duration: 10,
    cal: 300,
    isFavorite: false,
    isPremium: false,
    tag: ["Tối"],
    ingredients: ["Mì pasta", "Hải sản", "Sốt kem"],
  ),
  Meal(
    id: 4,
    name: 'Phở bò',
    imageUrl:
        'https://images.unsplash.com/photo-1568096889942-6eedde686635?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    description: "20 phút - 250 cal",
    duration: 20,
    cal: 250,
    isFavorite: false,
    isPremium: false,
    tag: ["Sáng"],
    ingredients: ["Sợi phở", "Thịt bò"],
  ),
  Meal(
    id: 5,
    name: 'Salad thập cẩm',
    imageUrl:
        'https://images.unsplash.com/photo-1533622597524-a1215e26c0a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
    description: "10 phút - 120 cal",
    duration: 10,
    cal: 120,
    isFavorite: false,
    isPremium: false,
    tag: ["Trưa"],
    ingredients: ["Salad", "Trái cây", "Sốt mè"],
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
    isSkipped: false,
    isFinished: true,
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
    isSkipped: false,
    isFinished: true,
  ),
  Meal(
    id: 1,
    name: 'Salad bắp cải',
    imageUrl:
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/1/FN_Sauteed-Vegetable-Medley_H2_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568400650030.jpeg',
    description: "20 phút - 150 cal",
    duration: 20,
    cal: 150,
    isFavorite: true,
    isPremium: false,
    tag: ["Sáng"],
    ingredients: ["Salad", "Bắp cải", "Dầu mè"],
  ),
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
          'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
      description: "20 phút - 150 cal",
      duration: 20,
      cal: 150,
      isFavorite: true,
      isPremium: false,
      tag: ["Sáng"],
      ingredients: ["Salad", "Bắp cải", "Dầu mè"],
    ),
    content: "",
    traineeId: 1,
  ),
  MealLog(
    date: DateTime.now(),
    meal: Meal(
      id: 2,
      name: 'Rau củ nướng',
      imageUrl:
          'https://images.unsplash.com/photo-1461530927168-44328109da52?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      description: "15 phút - 300 cal",
      duration: 15,
      cal: 300,
      isFavorite: false,
      isPremium: false,
      tag: ["Trưa"],
      ingredients: ["Rau củ", "Sốt", "Dầu mè"],
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
      isSkipped: false,
      isFinished: true,
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
      isSkipped: false,
      isFinished: true,
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
      isSkipped: false,
      isFinished: true,
    ),
    content: "",
    traineeId: 1,
  ),
];
