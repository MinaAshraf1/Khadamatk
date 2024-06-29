import 'package:flutter/material.dart';
import 'package:gradproject/Features/details/data/models/details/details.dart';
import 'package:gradproject/Features/details/presentation/views/description_view.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.details, required this.url});
final Details details;
final String url;
  @override
  Widget build(BuildContext context) {
       String imageUrl;
    if (details.images != null && details.images!.isNotEmpty) {
      imageUrl = details.images![0].image ??
         url;
    }else {
      imageUrl = url;
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
          height: MediaQuery.sizeOf(context).height * 0.25,
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DescriptionView.id,arguments: details);
            },
            child: ClipRRect(
              
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                    fit: BoxFit.cover, imageUrl)),
          )),
        const SizedBox(height: 10),
        Text(
        details.name!,
        textAlign: TextAlign.center,
          style:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            
          ),
        )
      ],
    );
  }
}
