import 'package:cherry_mvp/features/donation/models/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:cherry_mvp/features/donation/donation_repository.dart';
import 'package:cherry_mvp/core/utils/utils.dart';

class DonationViewModel extends ChangeNotifier {
  final DonationRepository donationRepository;
  final _log = Logger('DonationViewModel');

  DonationViewModel({required this.donationRepository});

  Status _status = Status.uninitialized;

  Status get status => _status;

  Future<void> submitDonation(DonationRequest request) async {
    _status = Status.loading;
    notifyListeners();

    try {
      final result = await donationRepository.submitDonation(request);
    //
    //   if (result.isSuccess) {
    //     _status = Status.success;
    //     _log.info("Donation submitted successfully");
    //   } else {
    //     _status = Status.failure(result.error ?? "Unknown error");
    //     _log.warning("Donation submission failed: ${result.error}");
    //   }
    } catch (e) {
      _status = Status.failure(e.toString());
      _log.severe("Exception during donation submission: $e");
    }

    notifyListeners();
  }
}
