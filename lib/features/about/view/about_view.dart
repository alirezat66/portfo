import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/gen/assets.gen.dart';
import 'package:portfolio/core/view/increase_hover_ext.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/models/work.dart';
import 'package:portfolio/features/about/view/widgets/work_summery_card.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Text(
          'About Me',
          style: TextStyle(
              color: context.basicColors.textSecondaryColor,
              fontSize: 44,
              fontFamily: 'Zodiak',
              fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                spacing: 12,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.basicColors.backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      ...WorkModel.works
                          .map((work) => WorkSummeryCard(work: work)),
                    ]),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 12,
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.basicColors.backgroundColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 20,
                              children: [
                                Text(
                                  'Experience',
                                  style: TextStyle(
                                    fontFamily: 'Zodiak',
                                    fontSize: 14,
                                    color:
                                        context.basicColors.textSecondaryColor,
                                  ),
                                ),
                                Text(
                                  '16+ Years',
                                  style: TextStyle(
                                    fontFamily: 'Zodiak',
                                    fontSize: 22,
                                    color: context.basicColors.textPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.basicColors.backgroundColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 20,
                              children: [
                                Text(
                                  'Projects',
                                  style: TextStyle(
                                    fontFamily: 'Zodiak',
                                    fontSize: 14,
                                    color:
                                        context.basicColors.textSecondaryColor,
                                  ),
                                ),
                                Text(
                                  '70+ Projects',
                                  style: TextStyle(
                                    fontFamily: 'Zodiak',
                                    fontSize: 22,
                                    color: context.basicColors.textPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: context.basicColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://www.linkedin.com/in/reza-taghizadeh/'));
                                    },
                                    child: SvgPicture.asset(
                                      Assets.icons.linkedin.path,
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.none,
                                    )..increaseSizeOnHover(1.4),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: context.basicColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://github.com/reza-taghizadeh'));
                                    },
                                    child: SvgPicture.asset(
                                      Assets.icons.github.path,
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.none,
                                    )..increaseSizeOnHover(1.4),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: context.basicColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://www.youtube.com/@taghiTechTalks'));
                                    },
                                    child: SvgPicture.asset(
                                      Assets.icons.youtube.path,
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.none,
                                    )..increaseSizeOnHover(1.4),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: context.basicColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://medium.com/@alirezataghizadeh66'));
                                    },
                                    child: SvgPicture.asset(
                                      Assets.icons.linkedin.path,
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.none,
                                    )..increaseSizeOnHover(1.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.basicColors.surfaceBrandColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 16,
                                children: [
                                  CircleAvatar(
                                    radius: 36,
                                    child: Image.asset(
                                        Assets.images.profileImageHover.path),
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 12,
                                    children: [
                                      Text(
                                        'Reza Taghizadeh',
                                        style: TextStyle(
                                          fontFamily: 'Zodiak',
                                          fontSize: 28,
                                          color:
                                              context.basicColors.surfaceColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '''Senior Software Engineer, crafting scalable apps using robust architectures. Skilled in Android, iOA and Flutter, focusing on SOLID and test-driven development. Delivered apps with high-quality, adaptable code under tight deadlines.''',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              context.basicColors.surfaceColor,
                                        ),
                                      ),
                                    ],
                                  ))
                                ]),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
