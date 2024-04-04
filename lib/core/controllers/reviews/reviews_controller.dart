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
  bool isLoading = false;

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
  double cleanlinessRating = 1.0;
  double accessibilityRating = 1.0;
  double suppliesRating = 1.0;
  double safetyRating = 1.0;
  double priceRating = 1.0;
  double tasteRating = 1.0;
  double selectionRating = 1.0;
  double friendlinessRating = 1.0;

  // Future<List<ReviewModel>?> getAllReviews(BuildContext context) async {
  //   try {
  //     final res = await apiService.get(url: AppConstants.GET_ALL_REVIEWS);
  //     List<dynamic> data = res;
  //     _reviewsList = data.map((e) {
  //       return ReviewModel.fromJson(e);
  //     }).toList();
  //     reviewsNotifier.value = _reviewsList;
  //     print("==========>${reviewsNotifier.value.length}");
  //     return reviewsNotifier.value;
  //   } catch (e) {
  //     if (e is DioException) {
  //       if (e.response!.statusCode == 500) {
  //         showSnackBar(context, text: e.response.toString(), color: Colors.red);
  //       }
  //       showSnackBar(context, text: e.message!, color: Colors.red);
  //       return [];
  //     } else {
  //       showSnackBar(context, text: e.toString(), color: Colors.red);
  //       return [];
  //     }
  //   }
  // }

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
      await getMyReviews(context);
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
      var response = await apiService.delData(
          url: "${AppConstants.DELETE_REVIEW}/$locationId");
      print('Delete API response: $response');

      var currentReviews = List<ReviewModel>.from(myReviewsNotifier.value);
      currentReviews.removeWhere((review) => review.id == locationId);
      myReviewsNotifier.value = currentReviews;
      if (response.statusCode == 200) {
        showSnackBar(context,
            text: "Review has been deleted", color: Colors.green);
      }
      print('New notifier length: ${myReviewsNotifier.value.length}');

      return true;
    } catch (e) {
      print("===============error=============");
      print("=========== ${e.toString()}");
      if (e is DioException) {
        if (e.response!.statusCode == 500) {
          showSnackBar(context, text: e.response.toString(), color: Colors.red);
        }
        showSnackBar(context,
            text: "===========>${e.message!}",
            color: Colors.red,
            duration: const Duration(seconds: 20));
        return false;
      }
      return false;
    }
  }

  Future<List<ReviewModel>?> getMyReviews(BuildContext context) async {
    print("object");
    try {
      final res = await apiService.get(
          url: "${AppConstants.GET_MY_REVIEWS}${AppConstants.userId}");
      List<dynamic> data = res;
      _reviewsList = data.map((e) {
        return ReviewModel.fromJson(e);
      }).toList();
      myReviewsNotifier.value = _reviewsList;
      print("==========>${myReviewsNotifier.value.length}");
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
    notifyListeners();
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
