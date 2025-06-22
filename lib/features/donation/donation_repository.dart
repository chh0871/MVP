import 'package:cherry_mvp/features/donation/models/donation_model.dart';
import 'package:logging/logging.dart';

class DonationRepository {
  final _log = Logger('DonationRepository');

  Future<void> submitDonation(DonationRequest request) async {
    _log.info('Submitting donation: ${request.toJson()}');
  }
}
