import 'dart:io';
import 'package:cherry_mvp/features/donation/models/donation_model.dart';
import 'package:cherry_mvp/core/services/services.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/core/config/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

abstract class IDonationRepository {
  Future<Result<DonationResponse>> submitDonation(DonationRequest request);
}

class DonationRepository implements IDonationRepository {
  final ApiService _apiService;
  final StorageProvider _storageProvider;
  final FirebaseAuth _firebaseAuth;
  final _log = Logger('DonationRepository');

  DonationRepository({
    required ApiService apiService,
    required StorageProvider storageProvider,
    required FirebaseAuth firebaseAuth,
  })  : _apiService = apiService,
        _storageProvider = storageProvider,
        _firebaseAuth = firebaseAuth;

  @override
  Future<Result<DonationResponse>> submitDonation(DonationRequest request) async {
    try {
      _log.info('Starting donation submission process');
      
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return Result.failure(AppStrings.userNotAuthenticated);
      }

      List<String> imageUrls = [];
      
      if (request.localImages != null && request.localImages!.isNotEmpty) {
        _log.info('Uploading ${request.localImages!.length} images to Firebase Storage');
        
        final List<File> imageFiles = request.localImages!
            .map((xFile) => File(xFile.path))
            .toList();
            
        final uploadResult = await _uploadMultipleImages(imageFiles, user.uid);
        
        if (uploadResult.isSuccess) {
          imageUrls = uploadResult.value!;
        } else {
          _log.warning('Image upload failed: ${uploadResult.error}');
          return Result.failure('${AppStrings.failedToUploadImages}: ${uploadResult.error}');
        }
        _log.info('Successfully uploaded ${imageUrls.length} images');
      }

      final apiRequest = request.copyWith(
        productImages: imageUrls,
        localImages: null,
      );

      _log.info('Submitting donation to API: ${apiRequest.toJson()}');
      
      final response = await _apiService.post(
        ApiEndpoints.products,
        data: apiRequest.toJson(),
      );

      if (response.isSuccess) {
        final donationResponse = DonationResponse.fromJson(response.value);
        _log.info('Donation submitted successfully with ID: ${donationResponse.id}');
        return Result.success(donationResponse);
      } else {
        _log.warning('API submission failed: ${response.error}');
        return Result.failure(response.error ?? AppStrings.failedToSubmitDonation);
      }
    } catch (e) {
      _log.severe('Exception during donation submission: $e');
      return Result.failure('${AppStrings.unexpectedErrorOccurred}: ${e.toString()}');
    }
  }

  Future<Result<List<String>>> _uploadMultipleImages(List<File> imageFiles, String userId) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      
      final List<Future<Result<String>>> uploadFutures = [];
      
      for (int i = 0; i < imageFiles.length; i++) {
        final imageName = 'image_${timestamp}_$i.jpg';
        final imagePath = 'products/$userId/$imageName';
        
        uploadFutures.add(_storageProvider.uploadImage(imageFiles[i], imagePath));
      }
      
      final List<Result<String>> uploadResults = await Future.wait(uploadFutures);
      
      final List<String> downloadUrls = [];
      for (int i = 0; i < uploadResults.length; i++) {
        final result = uploadResults[i];
        if (result.isSuccess) {
          downloadUrls.add(result.value!);
        } else {
          return Result.failure('Failed to upload image ${i + 1}: ${result.error}');
        }
      }
      
      return Result.success(downloadUrls);
    } catch (e) {
      return Result.failure('Image upload error: ${e.toString()}');
    }
  }
}

class MockDonationRepository implements IDonationRepository {
  final _log = Logger('MockDonationRepository');

  @override
  Future<Result<DonationResponse>> submitDonation(DonationRequest request) async {
    _log.info('Mock: Submitting donation: ${request.toJson()}');
    
    await Future.delayed(const Duration(seconds: 2));
    
    final mockData = DonationData(
      id: 'mock_${DateTime.now().millisecondsSinceEpoch}',
      name: request.name,
      description: request.description,
      categoryId: request.categoryId,
      charityId: request.charityId,
      quality: request.quality,
      size: request.size,
      productImages: request.productImages ?? [],
      donation: request.donation,
      price: request.price,
      likes: request.likes,
      number: request.number,
      userId: 'mock_user_id',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    
    final response = DonationResponse(
      success: true,
      message: AppStrings.donationSubmittedSuccessfully,
      data: mockData,
    );
    
    return Result.success(response);
  }
}
