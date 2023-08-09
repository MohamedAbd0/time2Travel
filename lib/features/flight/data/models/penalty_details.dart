import '../../domain/domain.dart';

class PenaltyDetailsModel extends PenaltyDetails {
  PenaltyDetailsModel(
      {super.currency,
      super.refundAllowed,
      super.refundPenaltyAmount,
      super.changeAllowed,
      super.changePenaltyAmount});

  PenaltyDetailsModel.fromJson(Map<String, dynamic> json) {
    currency = json['Currency'];
    refundAllowed = json['RefundAllowed'];
    refundPenaltyAmount = json['RefundPenaltyAmount'];
    changeAllowed = json['ChangeAllowed'];
    changePenaltyAmount = json['ChangePenaltyAmount'];
  }
}
