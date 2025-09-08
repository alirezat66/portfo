class WorkModel {
  final String startYear;
  final String startMonth;
  final String endYear;
  final String endMonth;
  final String companyName;
  final String jobTitle;

  WorkModel({
    required this.startYear,
    required this.endYear,
    required this.companyName,
    required this.jobTitle,
    required this.startMonth,
    required this.endMonth,
  });

  static List<WorkModel> get works => [
        WorkModel(
          startYear: '2025',
          startMonth: 'Apr',
          endYear: '2025',
          endMonth: 'Jul',
          companyName: 'A2zebra',
          jobTitle: 'Senior Flutter Engineer',
        ),
        WorkModel(
          startYear: '2023',
          startMonth: 'Feb',
          endYear: '2025',
          endMonth: 'Apr',
          companyName: 'Moebel.de',
          jobTitle: 'Senior Flutter Developer',
        ),
        WorkModel(
          startYear: '2020',
          startMonth: 'Jul',
          endYear: '2023',
          endMonth: 'Jun',
          companyName: 'ArmanCoders',
          jobTitle: 'Mobile Team Lead',
        ),
        WorkModel(
          startYear: '2018',
          startMonth: 'Jul',
          endYear: '2020',
          endMonth: 'Jun',
          companyName: 'Sana Gostar',
          jobTitle: 'Flutter Developer',
        ),
        WorkModel(
          startYear: '2017',
          startMonth: 'Aug',
          endYear: '2018',
          endMonth: 'Jul',
          companyName: 'IT boosts',
          jobTitle: 'Senior Mobile Developer(native)',
        ),
      ];
}
