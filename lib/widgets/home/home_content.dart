import 'package:flutter/cupertino.dart';

import '../../models/bank-account.dart';
import '../../views/laon/widgets/account_swiper.dart';
import '../loan_banner.dart';
import '../quick_action.dart';
import 'draggable_transfer_panel.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int selectedQuickActionIndex = -1;
  late List<BankAccount> userAccounts;
  late int initialBookmarkedIndex;

  void _toggleBookmark(int index) {
    setState(() {
      for (int i = 0; i < userAccounts.length; i++) {
        userAccounts[i].isBookmarked = i == index;
      }
      initialBookmarkedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    userAccounts = [
      BankAccount(
        ownerName: "مینا علمی",
        accountNumber: "051511242000000150",
        iban: "IR890750051511242000000150",
        type: "سپرده قرض الحسنه",
        balance: 1500000000000,
        logoAsset: 'assets/images/melal_icon.png',
        isBookmarked: false,
      ),
      BankAccount(
        ownerName: "علی احمدی",
        accountNumber: "051511242000000151",
        iban: "IR230750051511242000000151",
        type: "سپرده کوتاه مدت",
        balance: 87500000,
        logoAsset: 'assets/images/melal_icon.png',
        isBookmarked: true,
      ),
      BankAccount(
        ownerName: "خودم",
        accountNumber: "051511242000000151",
        iban: "IR230750051511242000000151",
        type: "سپرده بلند مدت",
        balance: 87500000,
        logoAsset: 'assets/images/melal_icon.png',
        isBookmarked: false,
      ),
    ];
    ; // Load from model or mock
    initialBookmarkedIndex = userAccounts.indexWhere((a) => a.isBookmarked);
    if (initialBookmarkedIndex == -1) initialBookmarkedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountSwiper(
              accounts: userAccounts,
              initialIndex: initialBookmarkedIndex,
              onBookmark: _toggleBookmark,
            ),
            const SizedBox(height: 20),
            QuickActions(
              selectedIndex: selectedQuickActionIndex,
              onActionSelected: (index) {
                setState(() {
                  selectedQuickActionIndex = index;
                });
              },
            ),
            loanBanner,
          ],
        ),
        const DraggableTransferPanel(),
      ],
    );
  }
}
