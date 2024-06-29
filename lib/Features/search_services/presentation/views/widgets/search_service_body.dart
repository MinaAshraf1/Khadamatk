import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/details/data/models/details/details.dart';
import 'package:gradproject/Features/details/presentation/view_model/cubit/details_cubit.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/custom_grid_view.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/app_bar_view.dart';
import 'package:gradproject/core/utls/widget/custom_text_feild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchServiceBody extends StatefulWidget {
  const SearchServiceBody({super.key});

  @override
  State<SearchServiceBody> createState() => _SearchServiceBodyState();
}

class _SearchServiceBodyState extends State<SearchServiceBody> {
  String? categoryName;
  String? imageUrl;
  String? search;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    categoryName = args['name'];
    imageUrl=args['image'];
    
    _fetchDetails(args['id']);
  }

  Future<void> _fetchDetails(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle the case when the token is null
      return;
    }

    final detailsCubit = BlocProvider.of<DetailsCubit>(context);

    switch (id) {
      case 1:
        detailsCubit.details(
            url: 'http://graduationbroject.runasp.net/api/AnalysisCenters/GetAllAnalysisCenters2',
            token: token);
        break;
      case 2:
        detailsCubit.details(
            url: 'http://graduationbroject.runasp.net/api/pharmacie/GetAllPharmacies2',
            token: token);
        break;
      case 3:
        detailsCubit.details(
            url: 'http://graduationbroject.runasp.net/api/Doctor/GetAllDoctors2',
            token: token);
        break;
      case 4:
        detailsCubit.details(
            url: 'http://graduationbroject.runasp.net/api/PlayStation/GetAllPlayStations2',
            token: token);
        break;
      case 5:
        detailsCubit.details(
            url: 'http://graduationbroject.runasp.net/api/Restaurant/GetAllRestaurants2',
            token: token);
        break;
      case 6:
        detailsCubit.details(
            url: 'http://graduationbroject.runasp.net/api/SuperMarket/GetAllSuperMarkets2',
            token: token);
        break;
      default:
        detailsCubit.details(
            url: 'http://graduationbroject.runasp.net/api/Workspace/GetAllWorkspaces2',
            token: token);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: AppBarView(
              text: 'البحث',
              icon: Icons.arrow_forward,
              onPressed: () {
                Navigator.pop(context);
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                CustomTextField(
                  foucs: true,
                  onChanged: (p0) {
                    setState(() {
                      search = p0;
                      BlocProvider.of<DetailsCubit>(context).searchDetails(p0);
                    });
                  },
                ),
                BlocBuilder<DetailsCubit, DetailsState>(
                  builder: (context, state) {
                    if (state is DetailsSuccess) {
                      final details = state.data;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*0.8,
                        child: CustomGridView(details: details, url: imageUrl!));
                    } else if (state is DetailsFailure) {
                      return Text('Failed to load data: ${state.errMessage}');
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
