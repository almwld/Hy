import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/constants/app_colors.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, dynamic> doctor;
  const BookingScreen({super.key, required this.doctor});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _selectedTimeSlot;
  
  final List<String> _morningSlots = ['09:00', '10:00', '11:00', '12:00'];
  final List<String> _eveningSlots = ['16:00', '17:00', '18:00', '19:00', '20:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حجز موعد'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(width: 60, height: 60, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.person, size: 30, color: AppColors.primary)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.doctor['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(widget.doctor['specialty'], style: TextStyle(fontSize: 12, color: AppColors.grey)),
                              Row(children: [const Icon(Icons.star, size: 14, color: Colors.amber), const SizedBox(width: 4), Text(widget.doctor['rating'].toString())]),
                            ],
                          ),
                        ),
                        Text('${widget.doctor['consultationPrice']} ريال', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text('اختر التاريخ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        TableCalendar(
                          firstDay: DateTime.now(),
                          lastDay: DateTime.now().add(const Duration(days: 30)),
                          focusedDay: _focusedDay,
                          selectedDay: _selectedDay,
                          calendarFormat: CalendarFormat.month,
                          onDaySelected: (selectedDay, focusedDay) => setState(() { _selectedDay = selectedDay; _focusedDay = focusedDay; _selectedTimeSlot = null; }),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('اختر الوقت', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        const Text('الفترة الصباحية', style: TextStyle(fontSize: 14, color: AppColors.grey)),
                        Wrap(spacing: 8, runSpacing: 8, children: _morningSlots.map((slot) => _TimeSlotChip(time: slot, isSelected: _selectedTimeSlot == slot, onTap: () => setState(() => _selectedTimeSlot = slot))).toList()),
                        const SizedBox(height: 12),
                        const Text('الفترة المسائية', style: TextStyle(fontSize: 14, color: AppColors.grey)),
                        Wrap(spacing: 8, runSpacing: 8, children: _eveningSlots.map((slot) => _TimeSlotChip(time: slot, isSelected: _selectedTimeSlot == slot, onTap: () => setState(() => _selectedTimeSlot = slot))).toList()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: _selectedTimeSlot != null ? () {} : null,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, minimumSize: const Size(double.infinity, 50)),
                child: const Text('تأكيد الحجز'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeSlotChip extends StatelessWidget {
  final String time; final bool isSelected; final VoidCallback onTap;
  const _TimeSlotChip({required this.time, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: isSelected ? AppColors.primary : Colors.grey.shade100, borderRadius: BorderRadius.circular(20), border: isSelected ? null : Border.all(color: Colors.grey.shade300)),
        child: Text(time, style: TextStyle(color: isSelected ? Colors.white : AppColors.dark)),
      ),
    );
  }
}
