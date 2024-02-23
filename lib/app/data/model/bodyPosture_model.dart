class BodyPosture {
  int? id;
  String? front_image;
  String? side_image;
  String? back_image;
  DateTime? created_at;

  double? front_ear_degree;
  double? front_head_degree;
  double? front_shoulder_degree;
  double? front_elbow_r_degree;
  double? front_elbow_l_degree;
  double? front_pelvis_degree;
  double? front_knee_r_degree;
  double? front_knee_l_degree;

  bool? is_side_right;
  double? side_elbow_r_degree;
  double? side_knee_r_degree;
  double? side_elbow_l_degree;
  double? side_knee_l_degree;

  double? back_ear_degree;
  double? back_head_degree;
  double? back_shoulder_degree;
  double? back_elbow_r_degree;
  double? back_elbow_l_degree;
  double? back_pelvis_degree;
  double? back_knee_r_degree;
  double? back_knee_l_degree;

  BodyPosture({
    this.id,
    this.front_image,
    this.side_image,
    this.back_image,
    this.created_at,
    this.front_ear_degree,
    this.front_head_degree,
    this.front_shoulder_degree,
    this.front_elbow_r_degree,
    this.front_elbow_l_degree,
    this.front_pelvis_degree,
    this.front_knee_r_degree,
    this.front_knee_l_degree,
    this.is_side_right,
    this.side_elbow_r_degree,
    this.side_knee_r_degree,
    this.side_elbow_l_degree,
    this.side_knee_l_degree,
    this.back_ear_degree,
    this.back_head_degree,
    this.back_shoulder_degree,
    this.back_elbow_r_degree,
    this.back_elbow_l_degree,
    this.back_pelvis_degree,
    this.back_knee_r_degree,
    this.back_knee_l_degree,
  });

  BodyPosture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    front_image = json['front_image'];
    side_image = json['side_image'];
    back_image = json['back_image'];
    created_at = DateTime.parse(json['created_at']);
    front_ear_degree = json['front_ear_degree'];
    front_head_degree = json['front_head_degree'];
    front_shoulder_degree = json['front_shoulder_degree'];
    front_elbow_r_degree = json['front_elbow_r_degree'];
    front_elbow_l_degree = json['front_elbow_l_degree'];
    front_pelvis_degree = json['front_pelvis_degree'];
    front_knee_r_degree = json['front_knee_r_degree'];
    front_knee_l_degree = json['front_knee_l_degree'];
    is_side_right = json['is_side_right'];
    side_elbow_r_degree = json['side_elbow_r_degree'];
    side_knee_r_degree = json['side_knee_r_degree'];
    side_elbow_l_degree = json['side_elbow_l_degree'];
    side_knee_l_degree = json['side_knee_l_degree'];

    back_ear_degree = json['back_ear_degree'];
    back_head_degree = json['back_head_degree'];
    back_shoulder_degree = json['back_shoulder_degree'];
    back_elbow_r_degree = json['back_elbow_r_degree'];
    back_elbow_l_degree = json['back_elbow_l_degree'];
    back_pelvis_degree = json['back_pelvis_degree'];
    back_knee_r_degree = json['back_knee_r_degree'];
    back_knee_l_degree = json['back_knee_l_degree'];
  }
}
