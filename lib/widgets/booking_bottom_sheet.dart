import 'package:flutter/material.dart';
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

  Widget _buildDateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Dates',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() => checkIn = date);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-in', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text(
                        checkIn == null ? 'Select date' : '${checkIn!.day}/${checkIn!.month}/${checkIn!.year}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  if (checkIn == null) return;
                  final date = await showDatePicker(
                    context: context,
                    initialDate: checkIn!.add(Duration(days: 1)),
                    firstDate: checkIn!.add(Duration(days: 1)),
                    lastDate: checkIn!.add(Duration(days: 30)),
                  );
                  if (date != null) {
                    setState(() => checkOut = date);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-out', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text(
                        checkOut == null ? 'Select date' : '${checkOut!.day}/${checkOut!.month}/${checkOut!.year}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGuestCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Number of Guests',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                if (guests > 1) setState(() => guests--);
              },
            ),
            Text(
              '$guests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                if (guests < 4) setState(() => guests++);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRoomTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Room Type',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...roomTypes.map((type) => RadioListTile<String>(
              title: Text(type),
              value: type,
              groupValue: selectedRoom,
              onChanged: (value) {
                if (value != null) setState(() => selectedRoom = value);
              },
            )),
      ],
    );
  }

  Widget _buildPriceDetails() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Room Rate'),
              Text('\$${widget.hotel.price} / night'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\$1,200',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
