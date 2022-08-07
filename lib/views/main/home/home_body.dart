import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/services/real_estate_service.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/views/main/details/property_details_screen.dart';

import '../../../models/real_estate_model.dart';
import '../../../models/response_model.dart';
import '../../drawer/my_favourite.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key, required this.data}) : super(key: key);
  final Future<ResponseModel<List<RealEstateModel>>> data;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseModel<List<RealEstateModel>>>(
      future: data,
        builder: (BuildContext context, snapshot) {
        if(snapshot.hasError) {
          print(snapshot.error);
          print(snapshot.stackTrace);
        }
          if (snapshot.hasData) {
            if(snapshot.data!.data.isEmpty){
              return Center(child: Text('No Data.',style:  Theme.of(context).textTheme.headline6,));
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              separatorBuilder: (_, int index) => const SizedBox(
                height: 20.0,
              ),
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                return Row(
                    children: [
                      if(index % 2 == 0) const Spacer(),
                      Expanded(
                        flex: 9,
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PropertyDetailsScreen(realEstateModel: snapshot.data!.data[index],),
                            ),
                          ),
                          child: Container(
                            height: 250,
                            alignment: AlignmentDirectional.bottomCenter,
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                                image: DecorationImage(
                                    image: NetworkImage(snapshot.data!.data[index].urls.first),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(index % 2 == 0 ? 20 : 0),
                                  topEnd: Radius.circular(index % 2 == 0 ? 0 : 20),
                                  bottomStart: Radius.circular(index % 2 == 0 ? 20 : 0),
                                  bottomEnd: Radius.circular(index % 2 == 0 ? 0 : 20),
                                )),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              height: 50,
                              color: AppColors.primary,
                              child: DefaultTextStyle.merge(
                                style: const TextStyle(color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(snapshot.data!.data[index].price.toString()),
                                    Text(snapshot.data!.data[index].property_type),
                                    FavouriteButton(id: snapshot.data!.data[index].id, isFavourite: snapshot.data!.data[index].isFavourite,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if(!(index % 2 == 0)) const Spacer()
                    ]);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }
}
