import 'package:flutter/material.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/custom_button.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/custom_map_button.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/custom_text.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/custom_text_icon.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/list_image.dart';
import 'package:gradproject/core/utls/widget/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DescriptionViewBody extends StatelessWidget {
  final String mainImage;
  final List<String> images;
  final String specialization;
  final dynamic price;
  final dynamic hasDelivery;
  final String descText;
  final String city;
  final String street;
  final String openDays;
  final String startWork;
  final String endWork;
  final String phone;
  final longitude;
  final latitude;

  const DescriptionViewBody({
    super.key,
    required this.images,
    required this.descText,
    required this.city,
    required this.street,
    required this.openDays,
    required this.startWork,
    required this.endWork,
    required this.phone,
    required this.mainImage,
    required this.longitude,
    required this.latitude,
    required this.specialization,
    required this.price,
    required this.hasDelivery,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics:const  BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                
                Stack(
                  children:[ ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 280,
                      imageUrl: mainImage,
                      placeholder: (context, url) =>const Center(child:  CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(Assets.logo),
                    ),
                    
                  ),

               ] ),
              
                const SizedBox(height: 20,),

                const CustomTextIcon(text: "صور", icon: Assets.picIcon),

                // استخدم ListView لعرض الصور الأخرى
                ListImage(images: images),

                specialization == "empty"? const SizedBox(height: 0,) : const CustomTextIcon(text: "التخصص", icon: Assets.descIcon),

                specialization == "empty"? const SizedBox(height: 0,) : CustomText(text: specialization),


                const CustomTextIcon(text: "الوصف", icon: Assets.descIcon),

                CustomText(text: descText),

                price == 0? const SizedBox(height: 0,) : const CustomTextIcon(text: "سعر الساعة", icon: Assets.descIcon),
                price == 0? const SizedBox(height: 0,) : CustomText(text: "$price"),

                const CustomTextIcon(text: "الموقع", icon: Assets.locationIcon),

                CustomText(text: "$city - $street"),

                hasDelivery == null? const SizedBox(height: 0,) : const CustomTextIcon(text: "خدمة توصيل", icon: Assets.locationIcon),

                hasDelivery == null? const SizedBox(height: 0,) : CustomText(text: hasDelivery == false? "لا يوجد خدمة توصيل" : "يوجد خدمة توصيل"),

                const CustomTextIcon(text: "مواعيد", icon: Assets.clockIcon),

               Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "$startWork - $endWork"),
                    CustomText(text: openDays),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(phone: phone),

                      CustomMapButton(latitude: latitude, longitude: longitude)
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
