import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_datail_content/movie_cast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;
  final showPanel = false.obs;

  MovieDetailContentMainCast({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.ThemeGrey,
        ),
        Obx(
          () => ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanel.toggle();
            },
            children: [
              ExpansionPanel(
                backgroundColor: Colors.white,
                isExpanded: showPanel.value,
                canTapOnHeader: false,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movieDetailModel?.cast
                            .map(
                              (c) => MovieCast(
                                castModel: c,
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
