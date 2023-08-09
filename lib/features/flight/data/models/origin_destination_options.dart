import '../../domain/domain.dart';
import 'models.dart';

class OriginDestinationOptionsModel extends OriginDestinationOptions {
  OriginDestinationOptionsModel({super.totalStops, super.tourSegments});

  OriginDestinationOptionsModel.fromJson(Map<String, dynamic> json) {
    totalStops = json['TotalStops'];
    if (json['tourSegments'] != null) {
      tourSegments = <TourSegments>[];
      json['tourSegments'].forEach((v) {
        tourSegments!.add(TourSegmentsModel.fromJson(v));
      });
    }
  }
}
