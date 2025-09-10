import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
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
                child: context.isDesktop || context.isLaptop
                    ? _buildDesktopFooter(context, state.footerData)
                    : _buildMobileFooter(context, state.footerData),
              ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 68,
          children: footerData.socialLinks.map<Widget>((socialLink) {
            return SocialIconWidget.circle(
                context,
                Social(
                  icon: socialLink.iconPath,
                  url: socialLink.url,
                  tooltip: socialLink.tooltip,
                ));
          }).toList(),
        ),
        const Divider(color: Colors.grey),

        // Bottom - Copyright
        _buildCopyright(context, footerData.copyright),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context, footerData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Navigation links
        _buildNavigationLinks(context, footerData.navigationLinks),
        const SizedBox(height: 32),
        // Social links
        _buildSocialLinks(context, footerData.socialLinks),
        const SizedBox(height: 32),
        // Contact info
        _buildContactInfo(context, footerData.contactInfo),
        const SizedBox(height: 32),
        const Divider(color: Colors.grey),
        const SizedBox(height: 24),
        // Copyright
        _buildCopyright(context, footerData.copyright),
      ],
    );
  }

  Widget _buildNavigationLinks(BuildContext context, navigationLinks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Navigation',
          style: context.textTheme.titleMedium?.copyWith(
            color: context.basicColors.textPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 24,
          runSpacing: 8,
          children: navigationLinks.map<Widget>((link) {
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
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSocialLinks(BuildContext context, socialLinks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect',
          style: context.textTheme.titleMedium?.copyWith(
            color: context.basicColors.textPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: socialLinks.map<Widget>((socialLink) {
            return GestureDetector(
              onTap: () {
                // Handle social link tap
                // launchUrl(Uri.parse(socialLink.url));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.basicColors.surfaceTertiaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  socialLink.iconPath,
                  width: 20,
                  height: 20,
                  color: context.basicColors.textSecondaryColor,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context, contactInfo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: context.textTheme.titleMedium?.copyWith(
            color: context.basicColors.textPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          contactInfo.email,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.basicColors.textSecondaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          contactInfo.location,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.basicColors.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCopyright(BuildContext context, Copyright copyright) {
    return Text(
      copyright.text,
      style: context.textTheme.bodySmall?.copyWith(
        color: context.basicColors.textSecondaryColor,
      ),
    );
  }
}
