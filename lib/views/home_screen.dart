import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:real_estate_app/views/auth/login_screen.dart';
import 'package:real_estate_app/views/auth/register_screen.dart';

import '../utils/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        height: 620,
        width: 200,
        child: ClipRRect(borderRadius:BorderRadius.circular(30) ,
          child: Drawer(
              backgroundColor: AppColors.primary,

              child:ListView(
                children: [
                  DrawerHeader(
                    //padding: EdgeInsets.symmetric(vertical: 2,horizontal: 3),
                    child: SizedBox(
                      height: 80,
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/personal.jpg'),
                            ),
                          ),
                          //SizedBox(height:2,)
                        ],
                      ),
                    ),

                  ),
                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('profile'.tr(),style: Theme.of(context).textTheme.headline1),
                    onTap: (){ },
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('home'.tr(),style: Theme.of(context).textTheme.headline1,),
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomeScreen() )) ,
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('my_real_estate'.tr(),style: Theme.of(context).textTheme.headline1,),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('my_favourite'.tr(),style: Theme.of(context).textTheme.headline1),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('login'.tr(),style: Theme.of(context).textTheme.headline1),
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder:(_) => LoginScreen() )) ,
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('setting'.tr(),style: Theme.of(context).textTheme.headline1),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('register_now'.tr(),style: Theme.of(context).textTheme.headline1),
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder:(_) => RegisterScreen() )) ,
                  ),

                  ListTile(
                    leading:Icon(Icons.circle,color: AppColors.secondary,),
                    title: Text('rate_us'.tr(),style: Theme.of(context).textTheme.headline1),
                    onTap: (){ },
                  ),


                  ListTile(
                    leading: Icon(Icons.circle,color: AppColors.secondary),
                    title: Text('sign_out'.tr(),style: Theme.of(context).textTheme.headline1),
                    onTap: (){},
                  ),
                ],

              ),

            ),
        ),
      ),

      backgroundColor: Colors.white,

      appBar: AppBar(

        title: Text('damascus'.tr(), style:Theme.of(context).textTheme.headline3),
        actions: [
          IconButton(onPressed: () {},
            icon: const Icon(Icons.compare_arrows),),
          IconButton(onPressed: () {},
            icon: const Icon(Icons.search),)
        ],
      ),

      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        separatorBuilder: (_, int index) => SizedBox( height: 20.0,),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Row(
              mainAxisAlignment: index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [ Container(

                width: 300,
                height: 200,
                alignment: AlignmentDirectional.bottomCenter,
                decoration: BoxDecoration(
                    color: AppColors.secondary,
                    image: DecorationImage(
                        image: AssetImage('assets/images/reals.jpg'),
                    fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),)
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: 50,
                  color: AppColors.primary,
                  child: DefaultTextStyle.merge(
                    style: TextStyle(color:Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('1200 ls'),
                        Text("Villa".tr()),
                        Icon(Icons.favorite),

                      ],

                    ),
                  ),

                ),
              ),
              ]
          );
        },
      ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        items: [
          BottomNavigationBarItem(label:'profile'.tr(),icon: Icon(Icons.person,color: AppColors.secondary),),
          BottomNavigationBarItem(label:'home'.tr() ,icon: Icon(Icons.home,color: AppColors.secondary)),
          BottomNavigationBarItem(label:'add_reals'.tr() ,icon: Icon(Icons.home_work_outlined,color: AppColors.secondary)),],),
    );
  }
}


