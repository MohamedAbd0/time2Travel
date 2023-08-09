class PenaltyDetails {
  String? currency;
  bool? refundAllowed;
  String? refundPenaltyAmount;
  bool? changeAllowed;
  String? changePenaltyAmount;

  PenaltyDetails(
      {this.currency,
      this.refundAllowed,
      this.refundPenaltyAmount,
      this.changeAllowed,
      this.changePenaltyAmount});
}
