import 'package:get/get.dart';
import 'package:marlo_task/app/features/chats/view/chat_screen.dart';
import 'package:marlo_task/app/features/contracts/view/contracts_screen.dart';
import 'package:marlo_task/app/features/home/view/home_screen.dart';
import 'package:marlo_task/app/features/loans/view/loans_screen.dart';
import 'package:marlo_task/app/features/teams/view/team_screen.dart';

class GlobalScreenController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  var screens = [
    const HomeScree(),
    const LoanScreen(),
    const ContractsScreen(),
    const TeamScreen(),
    const ChatScreen()
  ].obs;

  onTapBottomNavButton(int index) {
    selectedIndex.value = index;
  }
}
