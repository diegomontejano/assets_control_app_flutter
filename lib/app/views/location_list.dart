import 'package:assets_control_app/app/controllers/location_controller.dart';
import 'package:assets_control_app/app/models/location_model.dart';
import 'package:assets_control_app/app/widgets/custom_design.dart';
import 'package:assets_control_app/app/widgets/custom_textlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationList extends StatelessWidget {
  const LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationController = context.watch<LocationController>();

    return Flexible(
      child: Column(
        children: [
          // title list
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomTextList(
                text: "Company",
                title: true,
              ),
              CustomTextList(
                text: "Segment",
                title: true,
              ),
              CustomTextList(
                text: "Seg. Purchase",
                title: true,
              ),
              CustomTextList(
                text: "Region",
                title: true,
              ),
              CustomTextList(
                text: "Site Purchase",
                title: true,
              ),
              CustomTextList(
                text: "Location",
                title: true,
              ),
              CustomTextList(
                text: "Stockroom",
                title: true,
              ),
              CustomTextList(
                text: "Managed by",
                title: true,
              ),
            ],
          ),
          // stream list
          Flexible(
            child: StreamBuilder<List<LocationModel>>(
              stream: locationController.streamLocationCollection(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Error by loading data."));
                }
                if (snapshot.hasData == false) {
                  return const Center(
                      child: Text(
                          "No data was found. Please, update the page or check your database."));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // select location document
                          locationController.selectLocationDocument(
                            LocationModel(
                              snapshot.data![index].locationID,
                              snapshot.data![index].company,
                              snapshot.data![index].segment,
                              snapshot.data![index].segment_of_origin_purchase,
                              snapshot.data![index].region,
                              snapshot.data![index].site_of_origin_purchase,
                              snapshot.data![index].location,
                              snapshot.data![index].stockroom,
                              snapshot.data![index].managed_by,
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(bottom: 2),
                          color: snapshot.data![index].locationID ==
                                  locationController.locationIDController
                              ? CustomDesign.secondaryColor3
                              : CustomDesign.secondaryColor2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextList(
                                text: snapshot.data![index].company,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].segment,
                              ),
                              CustomTextList(
                                text: snapshot
                                    .data![index].segment_of_origin_purchase,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].region,
                              ),
                              CustomTextList(
                                text: snapshot
                                    .data![index].site_of_origin_purchase,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].location,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].stockroom,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].managed_by,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
