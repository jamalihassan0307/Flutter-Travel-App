import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidesign08/data/data.dart';
import 'package:uidesign08/providers/booking_provider.dart';
import 'package:uidesign08/pages/payment_page.dart';

class BookingBottomSheet extends StatefulWidget {
  final Item hotel;

  const BookingBottomSheet({Key? key, required this.hotel}) : super(key: key);

  @override
  _BookingBottomSheetState createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  DateTime? checkIn;
  DateTime? checkOut;
  int guests = 2;
  String selectedRoom = 'Deluxe Room';

  final List<String> roomTypes = [
    'Deluxe Room',
    'Executive Suite',
    'Presidential Suite',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDateSelection(),
                  SizedBox(height: 20),
                  _buildGuestCounter(),
                  SizedBox(height: 20),
                  _buildRoomTypeSelection(),
                  SizedBox(height: 20),
                  _buildPriceDetails(),
                ],
              ),
            ),
          ),
          _buildBookButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.hotel.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hotel.titel,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.hotel.location,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Add other build methods for date selection, guest counter, etc.

  Widget _buildBookButton() {
    return Container(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          if (checkIn != null && checkOut != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentPage(
                  booking: Booking(
                    hotel: widget.hotel,
                    checkIn: checkIn!,
                    checkOut: checkOut!,
                    guests: guests,
                    roomType: selectedRoom,
                    totalPrice: 1200.0, // Calculate based on selection
                  ),
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text(
          'Proceed to Payment',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
} 