import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/core/view/widgets/glow_card.dart';
import 'package:portfolio/features/about/model/data/about_data.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class WorkSummeryCard extends StatelessWidget {
  final WorkExperience work;
  const WorkSummeryCard({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      borderRadius: 16,
      borderWidth: 1,
      borderColor: context.basicColors.surfaceTertiaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32,
          children: [
            Offstage(
              offstage: !context.isDesktop,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${work.startYear} -',
                          style: TextStyle(
                            fontFamily: 'Zodiak',
                            fontSize: 16,
                            color: context.basicColors.textPrimaryColor,
                          )),
                      Offstage(
                        offstage: work.startYear != work.endYear,
                        child: Text(work.startMonth,
                            style: TextStyle(
                              fontFamily: 'Zodiak',
                              fontSize: 14,
                              color: context.basicColors.textSecondaryColor,
                            )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(' ${work.endYear}',
                          style: TextStyle(
                            fontFamily: 'Zodiak',
                            fontSize: 16,
                            color: context.basicColors.textPrimaryColor,
                          )),
                      Offstage(
                        offstage: work.startYear != work.endYear,
                        child: Text(work.endMonth,
                            style: TextStyle(
                              fontFamily: 'Zodiak',
                              fontSize: 14,
                              color: context.basicColors.textSecondaryColor,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    work.companyName,
                    style: TextStyle(
                      fontFamily: 'Zodiak',
                      fontSize: 16,
                      color: context.basicColors.textPrimaryColor,
                    ),
                  ),
                  Text(work.jobTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: context.basicColors.textSecondaryColor,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
