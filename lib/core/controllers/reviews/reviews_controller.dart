import 'package:bath_room_app/core/network/remote/api_service.dart';
import 'package:bath_room_app/models/review_models/review_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../presantion/widgets/snak_bar.dart';
import '../../network/app_constants.dart';

class ReviewsController extends ChangeNotifier {
  final ApiService apiService;

  ReviewsController({required this.apiService});

  List<ReviewModel> _reviewsList = [];

  static final ValueNotifier<List<ReviewModel>> reviewsNotifier =
      ValueNotifier([]);
  static final ValueNotifier<List<ReviewModel>> myReviewsNotifier =
      ValueNotifier([]);
  static final ValueNotifier<List<ReviewModel>> locationReviewsNotifier =
      ValueNotifier([]);
  static final ValueNotifier<Map<String, dynamic>> reviewsValuesNotifier =
      ValueNotifier({});

  bool instantCoffee = false;
  bool groundCoffee = false;
  bool alternativeOptions = false;
  bool sitDown = false;
  bool keyRequired = false;
  bool wheelchairFriendly = false;
  double cleanlinessRating = 0.0;
  double accessibilityRating = 0.0;
  double suppliesRating = 0.0;
  double safetyRating = 0.0;
  double priceRating = 0.0;
  double tasteRating = 0.0;
  double selectionRating = 0.0;
  double friendlinessRating = 0.0;

  Future<List<ReviewModel>?> getAllReviews(BuildContext context) async {
    try {
      final res = await apiService.get(url: AppConstants.GET_ALL_REVIEWS);
      List<dynamic> data = res;
      _reviewsList = data.map((e) {
        return ReviewModel.fromJson(e);
      }).toList();
      reviewsNotifier.value = _reviewsList;
      print("==========>${reviewsNotifier.value.length}");
      return reviewsNotifier.value;
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 500) {
          showSnackBar(context, text: e.response.toString(), color: Colors.red);
        }
        showSnackBar(context, text: e.message!, color: Colors.red);
        return [];
      } else {
        showSnackBar(context, text: e.toString(), color: Colors.red);
        return [];
      }
    }
  }

  Future<List<ReviewModel>> getLocationReviews(BuildContext context,
      {required String locationId}) async {
    try {
      final res = await apiService.get(
        url: "${AppConstants.GET_LOCATION_REVIEWS}/$locationId",
      );
      List<dynamic> data = res;
      locationReviewsNotifier.value = data.map((e) {
        return ReviewModel.fromJson(e);
      }).toList();
      return locationReviewsNotifier.value;
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 500) {
          showSnackBar(context, text: e.response.toString(), color: Colors.red);
        }
        showSnackBar(context, text: e.message!, color: Colors.red);
        return [];
      } else {
        showSnackBar(context, text: e.toString(), color: Colors.red);
        return [];
      }
    }
  }

  Future<bool> addReview(BuildContext context,
      {required Map<String, dynamic> map}) async {
    try {
      await apiService.post(
          url: AppConstants.ADD_REVIEW,
          requestBody: map,
          additionalHeaders: {"api_token": AppConstants.token});
      return true;
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 500) {
          showSnackBar(context, text: e.response.toString(), color: Colors.red);
        }
        showSnackBar(context, text: e.message!, color: Colors.red);
        return false;
      } else {
        showSnackBar(context, text: e.toString(), color: Colors.red);
        return false;
      }
    }
  }

  Future<bool> deleteReview(BuildContext context,
      {required String locationId}) async {
    try {
      await apiService.delete(
          url: "${AppConstants.DELETE_REVIEW}/$locationId",
          additionalHeaders: {"api_token": AppConstants.token});
      return true;
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 500) {
          showSnackBar(context, text: e.response.toString(), color: Colors.red);
        }
        showSnackBar(context, text: e.message!, color: Colors.red);
        return false;
      } else {
        showSnackBar(context, text: e.toString(), color: Colors.red);
        return false;
      }
    }
  }

  Future<List<ReviewModel>?> getMyReviews(
      BuildContext context, String myUserId) async {
    try {
      await getAllReviews(context);
      myReviewsNotifier.value =
          _reviewsList.where((review) => review.userId == myUserId).toList();
      print("======> ${myReviewsNotifier.value.length}");
      return myReviewsNotifier.value;
    } catch (e) {
      print("=============error===========");
      print(e.toString());
      return [];
    }
  }

  void handleInstantCoffeeSelected(bool value) {
    instantCoffee = value;
    reviewsValuesNotifier.value.addAll({"instant_coffee": instantCoffee});
  }

  void handleGroundCoffeeSelected(bool value) {
    groundCoffee = value;
    reviewsValuesNotifier.value.addAll({"ground_coffee": groundCoffee});
    notifyListeners();
  }

  void handleAlternativeOptionsSelected(bool value) {
    alternativeOptions = value;
    reviewsValuesNotifier.value
        .addAll({"alternate_options": alternativeOptions});
    notifyListeners();
  }

  void handSitDownSelected(bool value) {
    sitDown = value;
    reviewsValuesNotifier.value.addAll({"sit_down": sitDown});
    notifyListeners();
  }

  void handleKeySelected(bool value) {
    keyRequired = value;
    reviewsValuesNotifier.value.addAll({"key_required": keyRequired});
    notifyListeners();
  }

  void handleWheelChairSelected(bool value) {
    wheelchairFriendly = value;
    reviewsValuesNotifier.value
        .addAll({"wheelchair_friendly": wheelchairFriendly});
    notifyListeners();
  }
}