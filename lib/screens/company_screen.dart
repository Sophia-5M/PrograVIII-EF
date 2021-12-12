import 'package:cartelera/models/company.dart';
import 'package:cartelera/models/models.dart';
import 'package:cartelera/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompanyS extends StatelessWidget {
  const CompanyS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<Company> np;
    np = MoviesProvider().getCompany(1);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([getInfo(context, np)]))
        ],
      ),
    );
  }

  Widget getInfo(BuildContext context, Future<Company> np) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    //MEDIA QUERY
    final size = MediaQuery.of(context).size;
    return Center(
      child: FutureBuilder<Company>(
        future: np,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.id,
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                            margin: EdgeInsets.only(top: 2),
                            padding: EdgeInsets.only(bottom: 2),
                            child: Row(
                              children: [
                                Hero(
                                  tag: snapshot.data!.id,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: FadeInImage(
                                      placeholder:
                                          AssetImage('assets/no_image.jpeg'),
                                      image: NetworkImage(
                                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2" +
                                              snapshot.data!.logoPath),
                                      height: 150,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: size.width - 190),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.name,
                                        style: textTheme.headline5,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        snapshot.data!.originCountry,
                                        style: textTheme.subtitle1,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        snapshot.data!.headquarters,
                                        style: textTheme.subtitle1,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        snapshot.data!.homepage,
                                        style: textTheme.subtitle1,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('No hay datos');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
