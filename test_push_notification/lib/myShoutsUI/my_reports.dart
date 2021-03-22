class MyReports {
  String id;
  String reportDate;
  String time;
  String cat;
  String subCat;
  String urgency;
  double latitude;
  double longitiude;
  String status; //Unseen, Seen, Assigned/Rejected, Resolved/Draped
  String assignedUsername;
  String assignedUserFullName;
  String comment;
  String responderPartyCode; // Attention party
  String responderPartyName;

  MyReports(
      this.id,
      this.reportDate,
      this.time,
      this.cat,
      this.subCat,
      this.urgency,
      this.latitude,
      this.longitiude,
      this.status,
      this.assignedUsername,
      this.assignedUserFullName,
      this.comment,
      this.responderPartyCode,
      this.responderPartyName);

  static List<MyReports> fetchAll() {
    return [
      MyReports(
        "1",
        "2020-03-17",
        "10.00AM",
        "Crime",
        "Murder",
        "High",
        23.7746591,
        90.4030951,
        "Unseen",
        "user121",
        "Abdul Karim",
        "This is a test payment. I hope it works well. This is a test payment. I hope it works well.",
        "BP10001",
        'Gulshan Thana',
      ),
      MyReports(
        "2",
        "2020-03-23",
        "11.00AM",
        "Accident",
        "Road Traffic Accident",
        "High",
        23.7646091,
        90.4140951,
        "Seen",
        "user999",
        "SI Abdul",
        "This is a test payment. I hope it works well. This is a test payment. I hope it works well.",
        "BP10001",
        'Gulshan Thana',
      ),
      MyReports(
        "3",
        "2020-03-18",
        "12.12AM",
        "Lost & Found",
        "Wallet",
        "High",
        23.776034,
        90.4100903,
        "Assigned",
        "user999",
        "SI Abdul Karim",
        "This is a test payment. I hope it works well. This is a test payment. I hope it works well.",
        "BP10001",
        'Gulshan Thana',
      ),
      MyReports(
        "4",
        "2020-03-18",
        "12.10AM",
        "Electricity",
        "High electricity bill",
        "Medium",
        23.746034,
        90.4000903,
        "Resolved",
        "user333",
        "SI Abdul Karim",
        "This is a test payment. I hope it works well. This is a test payment. I hope it works well.",
        "BP10001",
        'Gulshan Thana',
      ),
      MyReports(
        "5",
        "2020-03-18",
        "12.01AM",
        "Gas",
        "Gas line leakage",
        "Low",
        23.746034,
        90.4090903,
        "Rejected",
        "user347",
        "SI Abdul Karim",
        "This is a test payment. I hope it works well. This is a test payment. I hope it works well.",
        "BP10001",
        'Gulshan Thana',
      ),
      MyReports(
        "6",
        "2020-03-18",
        "12.02AM",
        "Pollution",
        "Water Pollution",
        "Low",
        23.749034,
        90.4000903,
        "Dropped",
        "user368",
        "SI Abdul Karim",
        "This is comment",
        "BP10001",
        'Gulshan Thana',
      ),
    ];
  }
}
