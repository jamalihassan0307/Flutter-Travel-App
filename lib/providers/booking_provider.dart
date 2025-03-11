import 'package:flutter/foundation.dart';
import 'package:uidesign08/data/data.dart';

enum BookingStatus { confirmed, pending, cancelled, completed }

class Booking {
  final Item hotel;
  final DateTime checkIn;
  final DateTime checkOut;
  final int guests;
  final String roomType;
  final double totalPrice;
  BookingStatus status;

  Booking({
    required this.hotel,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.roomType,
    required this.totalPrice,
    this.status = BookingStatus.pending,
  });
}

class BookingProvider with ChangeNotifier {
  final List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  void addBooking(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  void updateBookingStatus(Booking booking, BookingStatus status) {
    booking.status = status;
    notifyListeners();
  }

  void cancelBooking(Booking booking) {
    booking.status = BookingStatus.cancelled;
    notifyListeners();
  }
} 