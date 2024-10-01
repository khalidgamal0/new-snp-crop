import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../account_summary/data/model/transaction_model.dart';
import '../../../account_summary/presentation/views/widgets/accountDetailsItem.dart';
import '../../../account_summary/presentation/views/widgets/last_transaction_item.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key, required this.transactionModel});

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffEEEDEB),
      appBar: AppBar(
        leading: Image.asset(AppImages.drawerIcon),
        title: Text(
          'تفاصيل العملية',
          style: AppTextStyles.textStyle16,
        ),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                goBack();
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )),
          horizontalSpacer(20)
        ],
      ),
      body: Column(children: [
        LastTransactionsItem(transactionModel: transactionModel,),
        const AccountDetailsItem(name: 'فرع',value:'00824' ,),
        const AccountDetailsItem(name: 'اسم الحساب',value:'مؤسسة مفرح مشعل بن تركي العتايب التجاريه' ,),
        const AccountDetailsItem(name: 'نوع الحساب',value:'حساب جاري تحت الطلب-ريال' ,),
        const AccountDetailsItem(name: 'تفاصيل اضافيه',value:'تحويل ال الاهل والاصدقاء 11100156095500' ,),
        const AccountDetailsItem(name: 'معرف المجله',value:'11095500' ,),
        const AccountDetailsItem(name: 'فرع',value:'مفرح مشعل بن تركي العتيبي' ,),
        const AccountDetailsItem(name: 'تعليق',value:'' ,isFinal: true,),
        verticalSpacer(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.picture_as_pdf_sharp,color: AppColors.secondary,size: 40.sp,)),
          horizontalSpacer(30),
          IconButton(onPressed: (){}, icon: Icon(Icons.share,color: AppColors.secondary,size: 40.sp,))
        ],)
      ],),

    );
  }
}
