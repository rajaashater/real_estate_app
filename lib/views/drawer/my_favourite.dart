import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:real_estate_app/models/real_estate_model.dart';
import 'package:real_estate_app/models/response_model.dart';
import 'package:real_estate_app/services/real_estate_service.dart';
import '../../utils/theme/app_colors.dart';

class MyFavouriteScreen extends StatelessWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('my_favourite'.tr(),
            style: Theme.of(context).textTheme.headline3),

      ),
      body: FutureBuilder<ResponseModel<List<RealEstateModel>>>(
        future: RealEstateService().showFavorite(),
        builder: (BuildContext context, AsyncSnapshot<ResponseModel<List<RealEstateModel>>> snapshot){
          if (snapshot.hasData){
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
                    (context, index) => Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 250,
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        image: DecorationImage(
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
                              FavouriteButton(id: snapshot.data!.data[index].id,),
                              Text(snapshot.data!.data[index].property_type),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                childCount: snapshot.data!.data.length,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        }
      )
    );
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool _isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return  IconButton(icon:Icon(_isFavourite ? Icons.favorite : Icons.favorite_border), onPressed: () {
      setState(() {
        _isFavourite = !_isFavourite;
      });
      if(_isFavourite) {
        RealEstateService().addFavorite(widget.id);
      } else {
        RealEstateService().removeFavorite(widget.id);
      }
    });
  }
}

