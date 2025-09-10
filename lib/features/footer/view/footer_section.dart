import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/core/view/widgets/download_button.dart';
import 'package:portfolio/core/view/widgets/social_item/social_item_widget.dart';
import 'package:portfolio/features/about/models/social.dart';
import 'package:portfolio/features/footer/model/data/footer_data.dart';
import 'package:portfolio/features/footer/view_model/footer_cubit.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FooterCubit>()..loadFooterData(),
      child: const FooterSectionContent(),
    );
  }
}

class FooterSectionContent extends StatelessWidget {
  const FooterSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FooterCubit, FooterState>(
      builder: (context, state) {
        if (state is FooterLoaded) {
          return Container(
            color: context.basicColors.backgroundColor,
            child: ResponsiveContent(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: _buildDesktopFooter(context, state.footerData)),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDesktopFooter(BuildContext context, FooterData footerData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 24,
      children: [
        // Main footer content

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 68,
            children: footerData.navigationLinks.map<Widget>((link) {
              return GestureDetector(
                onTap: () {
                  // Handle navigation
                  // context.go(link.route);
                },
                child: Text(
                  link.title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: link.isActive
                        ? context.basicColors.surfaceBrandColor
                        : context.basicColors.textSecondaryColor,
                    fontWeight:
                        link.isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              );
            }).toList()),
        const SizedBox(height: 24),

        DownloadButton(text: "Download CV", isResume: true),

        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            ...footerData.socialLinks.map<Widget>((socialLink) {
              return SocialIconWidget.circle(
                  context,
                  Social(
                    icon: socialLink.iconPath,
                    url: socialLink.url,
                    tooltip: socialLink.tooltip,
                  ));
            }),
          ],
        ),
        const Divider(color: Colors.grey),

        // Bottom - Copyright
        Text(
          footerData.copyright.text,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.basicColors.textSecondaryColor,
          ),
        ),
      ],
    );
  }
}
