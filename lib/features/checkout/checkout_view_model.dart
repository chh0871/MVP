import 'package:cherry_mvp/core/models/product.dart';
import 'package:cherry_mvp/features/checkout/widgets/shipping_address_widget.dart';
import 'package:cherry_mvp/features/checkout/constants/address_constants.dart';
import 'package:flutter/material.dart';

/// ViewModel for managing checkout state including basket items, shipping address, and payment method
class CheckoutViewModel extends ChangeNotifier {
  final List<Product> _basketItems = [];

  /// Unmodifiable list of items in the basket
  List<Product> get basketItems => List.unmodifiable(_basketItems);

  /// Total price of all items in the basket
  double get itemTotal => _basketItems.fold(0, (sum, item) => sum + item.price);

  /// Security fee calculated as 10% of item total
  double get securityFee => itemTotal * 0.1;

  /// Fixed postage fee
  double get postage => 2.99;

  /// Total order amount including all fees
  double get total => itemTotal + securityFee + postage;

  // Shipping Address properties
  PlaceDetails? _shippingAddress;
  
  /// Currently selected shipping address
  PlaceDetails? get shippingAddress => _shippingAddress;
  
  /// Whether a valid shipping address has been selected
  bool get hasShippingAddress => _shippingAddress != null;
  
  // Payment properties  
  bool _hasPaymentMethod = false;
  
  /// Whether a payment method has been set
  bool get hasPaymentMethod => _hasPaymentMethod;
  
  /// Whether the order is ready for checkout (has both address and payment method)
  bool get canCheckout => hasShippingAddress && hasPaymentMethod;

  // Existing basket methods
  void addItem(Product product) {
    _basketItems.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _basketItems.remove(product);
    notifyListeners();
  }

  void clearBasket() {
    _basketItems.clear();
    notifyListeners();
  }

  // Shipping address methods
  
  /// Sets the shipping address from Google Places API result
  /// Notifies listeners when address is updated
  void setShippingAddress(PlaceDetails address) {
    _shippingAddress = address;
    notifyListeners();
  }

  /// Clears the currently selected shipping address
  void clearShippingAddress() {
    _shippingAddress = null;
    notifyListeners();
  }

  // Payment method methods
  
  /// Sets whether a payment method has been configured
  void setPaymentMethod(bool hasPayment) {
    _hasPaymentMethod = hasPayment;
    notifyListeners();
  }

  /// Returns the formatted shipping address for display purposes
  String get formattedShippingAddress {
    return _shippingAddress?.formattedAddress ?? '';
  }

  /// Returns shipping address components as a map for backend processing
  /// Keys are standardized using AddressConstants
  Map<String, String> get shippingAddressComponents {
    if (_shippingAddress == null) return {};
    
    return {
      AddressConstants.streetKey: '${_shippingAddress!.streetNumber} ${_shippingAddress!.route}'.trim(),
      AddressConstants.cityKey: _shippingAddress!.locality,
      AddressConstants.stateKey: _shippingAddress!.administrativeAreaLevel1,
      AddressConstants.postalCodeKey: _shippingAddress!.postalCode,
      AddressConstants.countryKey: _shippingAddress!.country,
    };
  }

  /// Resets checkout state for a new order
  /// Clears shipping address and payment method but preserves basket items
  void resetCheckout() {
    _shippingAddress = null;
    _hasPaymentMethod = false;
    notifyListeners();
  }

  /// Validates that the shipping address has all required components
  /// Returns true if address is valid for checkout
  bool validateShippingAddress() {
    if (_shippingAddress == null) return false;
    
    final components = shippingAddressComponents;
    
    // Check required fields are present and non-empty
    final street = components[AddressConstants.streetKey]?.trim() ?? '';
    final city = components[AddressConstants.cityKey]?.trim() ?? '';
    final postalCode = components[AddressConstants.postalCodeKey]?.trim() ?? '';
    
    // Basic validation - could be enhanced with format validation
    return street.isNotEmpty && 
           city.isNotEmpty && 
           postalCode.isNotEmpty &&
           _isValidPostalCode(postalCode);
  }
  
  /// Helper method to validate postal code format (basic US ZIP code validation)
  bool _isValidPostalCode(String postalCode) {
    // Basic US ZIP code pattern (5 digits or 5+4 format)
    final RegExp zipPattern = RegExp(r'^\d{5}(-\d{4})?$');
    return zipPattern.hasMatch(postalCode);
  }

  /// Processes the checkout order
  /// Returns true if successful, false if validation fails or error occurs
  /// TODO: Implement actual API integration
  Future<bool> processCheckout() async {
    if (!canCheckout) return false;
    if (!validateShippingAddress()) return false;
    
    try {
      // Prepare order data for API call
      final Map<String, dynamic> orderData = {
        'items': basketItems.map((item) => {
          'id': item.id,
          'name': item.name,
          'price': item.price,
          // Add other product fields as needed
        }).toList(),
        'shipping_address': {
          'formatted_address': formattedShippingAddress,
          AddressConstants.streetKey: shippingAddressComponents[AddressConstants.streetKey],
          AddressConstants.cityKey: shippingAddressComponents[AddressConstants.cityKey],
          AddressConstants.stateKey: shippingAddressComponents[AddressConstants.stateKey],
          'postal_code': shippingAddressComponents[AddressConstants.postalCodeKey],
          AddressConstants.countryKey: shippingAddressComponents[AddressConstants.countryKey],
          'latitude': _shippingAddress?.latitude,
          'longitude': _shippingAddress?.longitude,
        },
        'totals': {
          'item_total': itemTotal,
          'security_fee': securityFee,
          'postage': postage,
          'total': total,
        }
      };
      
      // TODO: Implement actual API call here
      // Example: await checkoutService.processOrder(orderData);
      // For now, we'll just validate the order data is properly structured
      if (orderData['items'] == null || (orderData['items'] as List).isEmpty) {
        return false;
      }
      
      return true;
    } catch (e) {
      // Log error for debugging purposes only
      debugPrint('${AddressConstants.checkoutError}: $e');
      return false;
    }
  }
}