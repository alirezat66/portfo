import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/core/gen/assets.gen.dart';
import 'package:portfolio/features/testimonial/model/colleague.dart';

part 'testimonial.g.dart';

@JsonSerializable()
class Testimonial extends Equatable {
  final Colleague colleague;
  final String quote;
  final String shortQuote;
  final String company;
  final String source;

  const Testimonial({
    required this.colleague,
    required this.quote,
    required this.shortQuote,
    required this.company,
    required this.source,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) =>
      _$TestimonialFromJson(json);
  Map<String, dynamic> toJson() => _$TestimonialToJson(this);

  @override
  List<Object?> get props => [colleague, quote, shortQuote, company, source];

  static List<Testimonial> get testimonials => [
        Testimonial(
            colleague: Colleague(
                name: 'Martin Rudloff',
                image: Assets.images.testimonials.martin.path,
                role: 'Head of Software Engineering'),
            quote:
                'Reza is the strongest Dart and Flutter developer I have had the pleasure of working with. As his superior, I always valued his deep technical expertise, combined with his strong network within the Flutter community, which makes him an outstanding professional in his field. He is highly motivated to continuously improve his core skills and stays up to date with best practices and industry standards. His code is exceptionally clean, following community guidelines and best practices rigorously. Beyond his technical skills, Reza is always friendly, optimistic, and fully committed whenever needed. Working with him has been a great experience, and I can highly recommend him to any team looking for a top-tier Flutter developer.',
            shortQuote:
                'Reza is an exceptional Dart and Flutter developer. His technical expertise, clean code, and commitment to best practices make him a standout professional. Friendly and motivated, he\'s a pleasure to work with.',
            company: 'Moebel',
            source: 'https://www.linkedin.com/in/mrudloff/'),
        Testimonial(
            colleague: Colleague(
                name: 'Martin Kleimann',
                image: Assets.images.testimonials.martin2.path,
                role: 'Chief Software Officer'),
            quote:
                'Reza is a highly skilled and motivated Senior Developer who drives impactful change. A great mentor with strong business acumen, he’s a true asset to any team.',
            shortQuote:
                "Reza is a highly skilled and motivated Senior Developer who drives impactful change. A great mentor with strong business acumen, he’s a true asset to any team.",
            company: 'A2zebra',
            source: 'https://www.linkedin.com/in/martin-klemann-a441bb14a/'),
        Testimonial(
            colleague: Colleague(
                name: 'Manjunath Muntha',
                image: Assets.images.testimonials.manju.path,
                role: 'Senior Flutter Developer'),
            quote:
                'I had the opportunity to work under Reza’s guidance, and I can confidently say he is one of the most technically skilled Flutter developers I’ve met. His ability to break down complex problems into simple, clear explanations made learning and understanding much easier for me.\nReza’s coding style is clean, efficient, and always aligned with best practices. He has a remarkable talent for identifying the root cause of issues quickly and delivering effective solutions. I learned a great deal from his approach to structuring code and optimizing performance. \nIn short, Reza’s technical expertise, problem-solving skills, and clarity in explanation make him an outstanding developer and mentor',
            shortQuote:
                'Reza is a highly skilled Flutter developer with a knack for simplifying complex problems. His clean, efficient code and quick problem-solving make him an exceptional mentor and developer.',
            company: 'Mint',
            source: 'https://www.linkedin.com/in/manjunath95/'),
        Testimonial(
            colleague: Colleague(
                name: 'Payam Kokabi',
                image: Assets.images.testimonials.payam.path,
                role: 'Senior Android Developer'),
            quote:
                'Great communication skills. Outstanding knowledge in his area of expertise and a good mentor for many people',
            shortQuote:
                'Reza has exceptional communication skills and a deep understanding of his area of expertise. He’s a great mentor for many people.',
            company: 'Nourish Care',
            source: 'https://www.linkedin.com/in/payam-kokabi/'),
        Testimonial(
            colleague: Colleague(
                name: 'Delaram Sabonchi',
                image: Assets.images.testimonials.delaram.path,
                role: 'UX/UI Product Designer'),
            quote:
                'I started my work in the field of application design with Reza, He is a very strong skill to convert design to code, It is enough to execute the plan to present it in the best possible way. He is a colleague and friend and a supporter character that makes him trustable. It has made me proud to work with him and I highly recommend him',
            shortQuote:
                'Reza expertly transforms designs into code with precision. A supportive and trustworthy colleague, he’s a pleasure to work with and highly recommended.',
            company: 'Freelancer & Interim',
            source: 'https://www.linkedin.com/in/delaram-sabonchi/'),
        Testimonial(
            colleague: Colleague(
                name: 'Mehrdad Pedramfar',
                image: Assets.images.testimonials.mehrdad.path,
                role: 'CTO'),
            quote:
                'Reza was truly exceptional and undoubtedly the most talented programmer I\'ve ever had the privilege of working with. His remarkable vision for code and programming is nothing short of extraordinary. Without a doubt, Reza possesses an innate ability to conceptualize and create programs that are truly outstanding.It\'s safe to say that Reza\'s expertise and skills can greatly benefit any business operating in this field. His unique insights and innovative approach can undoubtedly contribute to the success and growth of businesses in various sectors.',
            shortQuote:
                "Reza is an exceptionally talented programmer with a remarkable vision for coding. His innovative approach and expertise greatly enhance any project or team.",
            company: 'Mizban',
            source: 'https://www.linkedin.com/in/mehrdad-pedramfar-69911284/'),
      ];
}
