import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';


class InAppPaymentService {
  static Future<void> purchaseProduct(String productId) async {
    try {
      PurchaserInfo purchaserInfo = await Purchases.purchaseProduct(productId);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> purchasePackage(Package purchasePackage) async {
    try {
      PurchaserInfo purchaserInfo =
          await Purchases.purchasePackage(purchasePackage);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<Offerings> getOfferings() async {
    try {
      return await Purchases.getOfferings();
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        print(e);
      }
      throw Exception("offerings PlatformException hatası");
    } catch (e) {
      print(e);
      throw Exception("offerings catch hatası");
    }
  }

  static Future<List<Product>> getProducts(List<String> productIds) async {
    try {
      return await Purchases.getProducts(productIds);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        print(e);
      }
      throw Exception("offerings PlatformException hatası");
    } catch (e) {
      print(e);
      throw Exception("offerings catch hatası");
    }
  }

  static Future<bool> isConfigured() async {
    try {
      return await Purchases.isConfigured;
    } catch (e) {
      throw Exception("not configured");
    }
  }
}
