import 'package:flutter/cupertino.dart';
import 'package:portfolio/core/gen/assets.gen.dart';
import 'package:portfolio/core/view/widgets/company_widget.dart';

class CompanyListView extends StatelessWidget {
  const CompanyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 64),
        itemCount: companies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final company = companies[index];
          return CompanyWidget(
              name: company.name, logo: company.logo, url: company.url);
        },
      ),
    );
  }
}

class Company {
  final String name;
  final String logo;
  final String url;

  Company({required this.name, required this.logo, required this.url});
}

final companies = [
  Company(
      name: 'Tuktoro',
      logo: Assets.images.companies.tuktoro.path,
      url: 'https://tuktoro.com/en'),
  Company(
      name: 'Moebel',
      logo: Assets.images.companies.moebel.path,
      url: 'https://www.moebel.de'),
  Company(
      name: 'It boosts',
      logo: Assets.images.companies.itboost.path,
      url: 'https://itboost.com.au/'),
  Company(
      name: 'Remote Derm',
      logo: Assets.images.companies.remoteDerm.path,
      url: 'https://www.remotederm.ca'),
  Company(
      name: 'Igmu',
      logo: Assets.images.companies.igmuPng.path,
      url: 'https://www.linkedin.com/company/igmu/'),
  Company(
      name: 'Delta',
      logo: Assets.images.companies.delta.path,
      url: 'https://delta.ir/tehran'),
  Company(
      name: 'Armancoders',
      logo: Assets.images.companies.armancoders.path,
      url: 'https://www.linkedin.com/company/armancoders/posts/?feedView=all'),
];
