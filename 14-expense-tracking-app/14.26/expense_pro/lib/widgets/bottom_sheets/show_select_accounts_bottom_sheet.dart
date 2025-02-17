import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/data/drift/drift_db.dart';
import '/providers/.providers.dart';

import '/data/models/account_model.dart';

import 'show_custom_bottom_sheet.dart';

void showSelectAccountsBottomSheet({
  required BuildContext context,
  required Function(Account) select,
  AccountModel? selected,
  bool excludeSelected = false,
  AccountModel? excludedAccount,
}) {
  context.read<AccountsProvider>().getAllAccounts();
  showCustomBottomSheet(
    context: context,
    title: 'Select Accounts',
    child: Expanded(
      child: Consumer<AccountsProvider>(
        builder: (context, accountsProvider, _) {
          return ListView(
            children: [
              ...accountsProvider.accounts.map(
                (el) {
                  return (excludeSelected && el.id == excludedAccount?.id)
                      ? const SizedBox()
                      : SelectAccountCard(
                          name: el.name,
                          isSelected: el.id == selected?.id,
                          onTap: () => select(el),
                        );
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}

class SelectAccountCard extends StatelessWidget {
  const SelectAccountCard({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isSelected
              ? const Color.fromARGB(255, 248, 248, 248)
              : const Color.fromRGBO(252, 252, 252, 1),
          border: Border.all(
              color: isSelected
                  ? Colors.black.withOpacity(0.3)
                  : Colors.transparent),
        ),
        child: Text(
          name,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
