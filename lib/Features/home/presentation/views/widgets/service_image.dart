import 'package:flutter/material.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/details_body.dart';
import 'package:gradproject/Features/home/data/models/category_model.dart';
import 'package:gradproject/const.dart';

class ServiceImage extends StatelessWidget {
  const ServiceImage({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsBody.detailsBodyId,arguments: {'id': category.id, 'name': category.name,'image':category.imageUrl},);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                category.imageUrl,
                height: double.infinity,
                width: MediaQuery.of(context).size.width * .7,
                fit: BoxFit.fill,
              )),
          Container(
               height:double.infinity,
            width: MediaQuery.of(context).size.width * .7,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Text(
              category.name,
              style: const TextStyle(
                  fontFamily: font,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
         
        ],
      ),
    );
  }
}
