import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:real_estate_app/models/real_estate_model.dart';
import 'package:real_estate_app/models/response_model.dart';
import 'package:real_estate_app/services/real_estate_service.dart';
import '../../utils/theme/app_colors.dart';

class MyPropertiesScreen extends StatefulWidget {
  const MyPropertiesScreen({Key? key}) : super(key: key);

  @override
  State<MyPropertiesScreen> createState() => _MyPropertiesScreenState();
}

class _MyPropertiesScreenState extends State<MyPropertiesScreen> {
  Future<ResponseModel<List<RealEstateModel>>> _future = RealEstateService().getMyRealEstate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('my_properties'.tr(),
            style: Theme.of(context).textTheme.headline3),

      ),
      body: FutureBuilder<ResponseModel<List<RealEstateModel>>>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<ResponseModel<List<RealEstateModel>>> snapshot){
          if(snapshot.hasData){
            return GridView.custom(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: SliverStairedGridDelegate(
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                startCrossAxisDirectionReversed: true,
                pattern: const [
                  StairedGridTile(0.5, 0.7),
                  StairedGridTile(0.5, 4.5 / 6),
                  StairedGridTile(1.0, 8 / 5),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: snapshot.data!.data.length,
                    (context, index) => Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 250,
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        image:  DecorationImage(
                            image: NetworkImage(snapshot.data!.data[index].urls[0]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 50,
                        color: AppColors.primary,
                        child: DefaultTextStyle.merge(
                          style: const TextStyle(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //const Icon(Icons.favorite),
                              Text(snapshot.data!.data[index].property_type),
                              Column(
                                children: [
                                  IconButton(icon: Icon(Icons.delete), onPressed: () async {
                                    showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator()), barrierDismissible: false);
                                    var data = await RealEstateService().deleteRealEstate(snapshot.data!.data[index].id);
                                    if(data.success){
                                      Navigator.pop(context);
                                      setState(() {
                                        _future = RealEstateService().getMyRealEstate();
                                      });
                                    }
                                    else{
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.BOTTOMSLIDE,
                                        body: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'failed'.tr(),
                                                style: Theme.of(context).textTheme.headline5,
                                              ),
                                              const SizedBox(
                                                height: 25.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).show();
                                    }
                                  }),
                                  Text('delete',
                                      style:
                                      Theme.of(context).textTheme.headline1),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(20.0), topEnd: Radius.circular(20.0))
                          ),
                          padding: const EdgeInsets.all(15.0),
                          child: Text(snapshot.data!.data[index].state,style:Theme.of(context).textTheme.headline3),
                        )
                    )
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
