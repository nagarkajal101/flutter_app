// wedding_countdown_card.dart
import 'dart:async';
import 'package:flutter/material.dart';

class WeddingCountdownCard extends StatefulWidget {
  final String bride;
  final String groom;
  final DateTime weddingDate;

  const WeddingCountdownCard({
    super.key,
    required this.bride,
    required this.groom,
    required this.weddingDate,
  });

  @override
  State<WeddingCountdownCard> createState() => _WeddingCountdownCardState();
}

class _WeddingCountdownCardState extends State<WeddingCountdownCard> {
  String? _countdownText;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final diff = widget.weddingDate.difference(now);

      if (diff.isNegative) {
        setState(() {
          _countdownText = "The big day has passed 🎉";
        });
        _timer?.cancel();
      } else {
        final days = diff.inDays;
        final hours = diff.inHours % 24;
        final minutes = diff.inMinutes % 60;
        final seconds = diff.inSeconds % 60;

        setState(() {
          _countdownText = "$days D : $hours H : $minutes M : $seconds S";
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${widget.bride} ❤ ${widget.groom}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _countdownText ?? "Loading...",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Wedding Date: ${widget.weddingDate.day}-${widget.weddingDate.month}-${widget.weddingDate.year}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
