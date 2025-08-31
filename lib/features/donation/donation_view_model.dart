import 'package:cherry_mvp/features/donation/models/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:cherry_mvp/features/donation/donation_repository.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/core/config/config.dart';

class DonationViewModel extends ChangeNotifier {
  final IDonationRepository _donationRepository;
  final _log = Logger('DonationViewModel');

  DonationViewModel({required IDonationRepository donationRepository})
      : _donationRepository = donationRepository;

  Status _status = Status.uninitialized;
  DonationResponse? _lastSubmission;
  String? _submissionMessage;

  Status get status => _status;
  DonationResponse? get lastSubmission => _lastSubmission;
  String? get submissionMessage => _submissionMessage;

  Future<void> submitDonation(DonationRequest request) async {
    _log.info('Starting donation submission for: ${request.name}');
    
    _status = Status.loading;
    _submissionMessage = null;
    _lastSubmission = null;
    notifyListeners();

    try {
      final result = await _donationRepository.submitDonation(request);
      
      if (result.isSuccess) {
        _status = Status.success;
        _lastSubmission = result.value!;
        _submissionMessage = AppStrings.donationSubmittedSuccessfully;
        _log.info("Donation submitted successfully with ID: ${result.value!.id}");
      } else {
        _status = Status.failure(result.error ?? "Unknown error");
        _submissionMessage = result.error ?? "Failed to submit donation";
        _log.warning("Donation submission failed: ${result.error}");
      }
    } catch (e) {
      _status = Status.failure(e.toString());
      _submissionMessage = AppStrings.unexpectedErrorOccurred;
      _log.severe("Exception during donation submission: $e");
    }

    notifyListeners();
  }

  void resetStatus() {
    _status = Status.uninitialized;
    _submissionMessage = null;
    _lastSubmission = null;
    notifyListeners();
  }
}
