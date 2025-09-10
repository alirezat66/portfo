import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/features/companies/view/widgets/company_widget.dart';
import '../view_model/companies_cubit.dart';

class CompanyListView extends StatelessWidget {
  const CompanyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CompaniesCubit>()..loadCompanies(),
      child: const CompanyListContent(),
    );
  }
}

class CompanyListContent extends StatelessWidget {
  const CompanyListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesCubit, CompaniesState>(
      builder: (context, state) {
        if (state is CompaniesLoading) {
          return const SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CompaniesError) {
          return SizedBox(
            height: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<CompaniesCubit>().refreshCompanies(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is CompaniesLoaded) {
          return SizedBox(
            height: 100,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 64),
              itemCount: state.companies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final company = state.companies[index];
                return CompanyWidget(
                  name: company.name,
                  logo: company.logo,
                  url: company.url,
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
