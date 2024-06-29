import 'package:flutter/material.dart';
import 'package:gradproject/Features/details/data/models/details/details.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/custom_app_bar.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/description_view_body.dart';
import 'package:gradproject/core/utls/utils.dart';
import 'package:gradproject/core/utls/widget/assets.dart';
import 'package:gradproject/core/utls/widget/service_icon.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});
  static const id = 'description';

  @override
  Widget build(BuildContext context) {
    final Details details = ModalRoute.of(context)!.settings.arguments as Details;
    String mainImage = details.images != null && details.images!.isNotEmpty
        ? details.images![0].image ?? Assets.logo
        : Assets.logo;
    List<String> images = details.images != null
        ? details.images!.map((image) => image.image ?? Assets.logo).toList()
        : [Assets.logo];

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              CustomAppBar(
                titleIcon: serviceIcon['restaurant'],
                titleText: details.name!,
              ),
              DescriptionViewBody(
                mainImage: mainImage,
                images: images,
                descText: details.descriptionOfPlace ?? 'لا يوجد وصف متاح',
                city: details.city ?? 'غير محدد',
                street: details.street ?? 'غير محدد',
                endWork: convertDateToHours(details.endWork!)?? 'غير محدد',
                startWork: convertDateToHours(details.startWork!) ?? 'غير محدد',
                openDays: 'طوال أيام الأسبوع',
                phone: details.phoneNumber ?? 'غير محدد',
                latitude: details.latitude ?? 'غير محدد',
                longitude: details.longitude ?? 'غير محدد',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
