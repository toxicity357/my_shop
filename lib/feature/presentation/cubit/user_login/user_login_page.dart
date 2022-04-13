import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/data/data_sources/constants.dart';
import 'package:my_shop/feature/domain/repositories/basket_repository.dart';
import 'package:my_shop/feature/domain/repositories/user_repository.dart';
import 'package:my_shop/feature/presentation/cubit/basket/basket_cubit.dart';
import 'package:my_shop/feature/presentation/cubit/user_login/user_login_cubit.dart';
import 'package:my_shop/feature/ui/ueser_login/user_login_widget.dart';

import '../catalog/catalog_page.dart';

class UserLoginPage extends StatelessWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => UserLoginCubit(context.read<UserRepository>())),
        BlocProvider(
            create: (_) => BasketCubit(context.read<BasketRepository>())),
      ],
      child: const _UserLoginPage(),
    );
  }
}

class _UserLoginPage extends StatefulWidget {
  const _UserLoginPage({Key? key}) : super(key: key);

  @override
  State<_UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<_UserLoginPage> {
  void a() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoginCubit, UserLoginState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Login Page')),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UserLoginWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                    onPressed: () async{
                      await context.read<BasketCubit>().fetchBasket();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CatalogPage(categoryId: '',)));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                    onPressed: ()  {
                      context.read<UserLoginCubit>().fetchLogin();
                      respBasketProducts.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CatalogPage(categoryId: '',)));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ],
        ),
      );
    });
  }
}
