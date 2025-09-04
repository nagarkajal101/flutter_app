import 'package:get/get.dart';
import 'package:ever_after/botom_navigation/venue/venue_screen.dart';
import 'package:ever_after/botom_navigation/catering/catering_screen.dart';

class AmountController extends GetxController {
  final Rx<Venue?> selectedVenue = Rx<Venue?>(null);
  final Rx<Caterer?> selectedCaterer = Rx<Caterer?>(null);

  int get totalBudget {
    int total = 0;
    if (selectedVenue.value != null) total += selectedVenue.value!.budget;
    if (selectedCaterer.value != null) total += selectedCaterer.value!.budget;
    return total;
  }
}
