import 'package:artificial_intelligence/core/routes/app_navigators.dart';
import 'package:artificial_intelligence/features/account_summary/data/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../filter/presentation/views/pdf_screen.dart';
import '../../../data/model/account_details_model.dart';


class LastTransactionsItem extends StatelessWidget {
  const LastTransactionsItem({
    super.key, required this.transactionModel,
  });

  final Transaction? transactionModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   goToWidget(screen:  PdfScreen(transactionModel: transactionModel,));
      // },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.color917F7F.withOpacity(.4),
            ),
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionModel?.details?? 'تحويل داخلي صادر',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textStyle12,
                ),
                verticalSpacer(4),
                Text(
                ' ${
                    transactionModel?.transactionDate?.year.toString() ?? '2023'}- ${
                    transactionModel?.transactionDate?.month.toString() ?? '12'}-${
                    transactionModel?.transactionDate?.day.toString() ?? '18'}',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textStyle10.copyWith(color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'SAR ${transactionModel?.printedValue}',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textStyle10
                        .copyWith(color: const Color(0xffE63637)),
                  ),
                  verticalSpacer(4),
                  Text(
                    'SAR ${transactionModel?.balance}',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textStyle10.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
