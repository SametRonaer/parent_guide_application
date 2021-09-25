import 'package:parent_guide_application/models/activity_model.dart';

List<Map<String, String>> dComments = [
  {
    "name": "Subhasis Das: ",
    "comment": "These cubes look great! Where can I get them?"
  },
  {
    "name": "Dolla Morgos:  ",
    "comment": "This is really confusing I'm not sure I even came close"
  },
  {
    "name": "Carolline Barron:  ",
    "comment":
        "My baby is 5 months, she does not sit, she can't do this activity"
  },
];

ActivityModel dActivityModel1 = ActivityModel(
  title: "Stretching",
  comments: dComments,
  purpose: "Purpose: To simulate your baby's movements when playing with cubes",
  videoUrl: "",
);
