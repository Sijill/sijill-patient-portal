class ActiveTokensModel {
  final String title;
  final String access;
  final String time;
  ActiveTokensModel({
    required this.title,
    required this.access,
    required this.time,
  });
  static List<ActiveTokensModel> activeTokensModelList = [
    ActiveTokensModel(
      title: "Healthcare Provider",
      access: "Read & Write Access",
      time: "Expires At: 29/10/2026 - 06:35:00",
    ),
    ActiveTokensModel(
      title: "Healthcare Provider",
      access: "Read & Write Access",
      time: "Expires At: 29/10/2026 - 06:35:00",
    ),
    ActiveTokensModel(
      title: "Healthcare Provider",
      access: "Read & Write Access",
      time: "Expires At: 29/10/2026 - 06:35:00",
    ),
  ];
}
