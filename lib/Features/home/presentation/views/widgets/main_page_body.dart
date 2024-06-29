import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/home/data/models/category_model.dart';
import 'package:gradproject/Features/home/presentation/view_model/cubit/user_cubit.dart';
import 'package:gradproject/Features/home/presentation/views/search_category.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/app_bar_view.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/drawer_view.dart';
import 'package:gradproject/Features/login/presentation/view_model/cubit/login_cubit_cubit.dart';
import 'package:gradproject/Features/login/presentation/views/login.dart';
import 'package:gradproject/core/errors/failure.dart';
import 'package:gradproject/core/utls/widget/custom_text_feild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      BlocProvider.of<UserCubit>(context).user(token: token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return DrawerView(
                userData: state.user,
              );
            } else if (state is UserFailure) {
              return const Text('data');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            AppBarView(
              onPressed: _openDrawer,
              text: 'استطلع',
              icon: Icons.menu,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: CustomTextField(
                foucs: false,
                onTap: () {
                  Navigator.pushNamed(context, SearchCategory.searchCategoryId);
                },
              ),
            ),
            const SizedBox(height: 50),
            const Expanded(
                child: CutomListView(categories: Category.categories)),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  final Widget child;

  const CustomDrawer({Key? key, required this.child}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      ),
    );
  }
}
