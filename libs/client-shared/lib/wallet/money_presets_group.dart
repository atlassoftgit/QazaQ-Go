import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ionicons/ionicons.dart';

import '../config.dart';
import '../theme/theme.dart';

class MoneyPresetsGroup extends StatefulWidget {
  final Function(double) onAmountChanged;
  final String titleCustom;

  const MoneyPresetsGroup(
      {required this.onAmountChanged, required this.titleCustom, Key? key})
      : super(key: key);

  @override
  State<MoneyPresetsGroup> createState() => _MoneyPresetsGroupState();
}

class _MoneyPresetsGroupState extends State<MoneyPresetsGroup> {
  int? selectedTip;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...tipPresets.asMap().keys.map((index) => Flexible(
            child: TipPresetView(
                index: index,
                amount: tipPresets[index],
                currency: defaultCurrency,
                isSelected: selectedTip == index,
                onSelected: (selected) {
                  widget.onAmountChanged(tipPresets[index]);
                  setState(() => selectedTip = selected);
                }))),
        CustomAmountField(
          hintText: widget.titleCustom,
          onChanged: (value) {
            if (selectedTip != null) {
              setState(() {
                selectedTip = null;
              });
            }
            widget.onAmountChanged(double.tryParse(value) ?? 0);
          },
          onTap: () => setState(() => selectedTip = null),
        )
      ],
    );
  }
}

class TipPresetView extends StatelessWidget {
  final int index;
  final double amount;
  final String currency;
  final bool isSelected;
  final Function(int) onSelected;

  const TipPresetView(
      {required this.index,
      required this.amount,
      required this.currency,
      required this.isSelected,
      required this.onSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(index),
      child: AnimatedContainer(
        margin: EdgeInsets.only(left: index == 0 ? 0 : 0, right: 4),
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.5,
                color: isSelected
                    ? CustomTheme.primaryColors.shade600
                    : Colors.transparent),
            color: isSelected
                ? CustomTheme.primaryColors.shade400
                : CustomTheme.primaryColors.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: AutoSizeText(
          NumberFormat.simpleCurrency(name: currency).format(amount),
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
        ),
      ),
    );
  }
}

class CustomAmountField extends StatelessWidget {
  final String? hintText;
  final Function(String) onChanged;
  final Function()? onTap;
  const CustomAmountField(
      {required this.hintText, required this.onChanged, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onTap: onTap,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) => onChanged(value),
        decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: CustomTheme.primaryColors.shade700),
                borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 8, minHeight: 0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 4),
              child: Icon(
                Ionicons.add,
                color: CustomTheme.neutralColors.shade800,
                size: 24,
              ),
            ),
            fillColor: CustomTheme.primaryColors.shade200),
      ),
    );
  }
}
