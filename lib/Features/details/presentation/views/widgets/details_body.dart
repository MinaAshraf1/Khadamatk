import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradproject/Features/details/presentation/view_model/cubit/details_cubit.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/custom_grid_view.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/app_bar_view.dart';
import 'package:gradproject/Features/search_services/presentation/views/search_service.dart';
import 'package:gradproject/core/utls/widget/custom_text_feild.dart';
import 'package:gradproject/main.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody({super.key});
  static const detailsBodyId = "details";

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  String? categoryName;
  String?imageUrl;
  int?id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
      final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    categoryName = args['name'];
    imageUrl=args['image'];
    id=args['id'];
    _fetchDetails(args['id']);
    
  }

  Future<void> _fetchDetails(int id) async {
  
  
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle the case when the token is null
      return;
    }

    final detailsCubit = BlocProvider.of<DetailsCubit>(context);

    switch (id) {
      case 1:
      setState(() {
        detailsCubit.details(
            url:
                'http://graduationbroject.runasp.net/api/AnalysisCenters/GetAllAnalysisCenters',
            token: token);
       
      });
        
        break;
      case 2:
         setState(() {
       detailsCubit.details(
            url:
                'http://graduationbroject.runasp.net/api/pharmacie/GetAllPharmacies',
            token: token);
    
      });
      
        break;
      case 3:
           setState(() {
      detailsCubit.details(
            url:
                'http://graduationbroject.runasp.net/api/Doctor/GetAllDoctors',
            token: token);
      });
       
        break;
      case 4:
             setState(() {
   detailsCubit.details(
            url:
                'http://graduationbroject.runasp.net/api/PlayStation/GetAllPlayStations',
            token: token);
      });
       
        break;
      case 5:
                  setState(() {
 detailsCubit.details(
            url:
                'http://graduationbroject.runasp.net/api/Restaurant/GetAllRestaurants',
            token: token);
      });
       
        break;
      case 6:
                        setState(() {
detailsCubit.details(
            url:
                'http://graduationbroject.runasp.net/api/SuperMarket/GetAllSuperMarkets',
            token: token);
      });
        
        break;
      default:
         setState(() {
     detailsCubit.details(
            url:
                'http://graduationbroject.runasp.net/api/Workspace/GetAllWorkspaces',
            token: token);
      });
        
   
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); 
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: AppBarView(
                text:categoryName?? 'الخدمات',
                icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: CustomTextField(
                foucs: false,
                onTap: () {
                  Navigator.pushNamed(context, SearchService.serviceSearchId,arguments: {'id': id, 'name': categoryName,'image':imageUrl});
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: BlocBuilder<DetailsCubit, DetailsState>(
                  builder: (context, state) {
                    if (state is DetailsSuccess) {
                      return CustomGridView(details: state.data,url: imageUrl!,);
                    } else if (state is DetailsFailure) {
                      return Center(
                        child: Text(state.errMessage),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
