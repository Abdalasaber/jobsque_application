import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/cubit/message_cubit/message_cubit.dart';
import 'package:jobsque/model/message_model/messages_model.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../styles/color.dart';
import '../../widget/default_search_bar.dart';
import '../../widget/default_text.dart';
import '../message/message_builder.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late MessageCubit cubit;
  @override
  void initState() {
    cubit = MessageCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouters.layoutPageRoute);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: DefaultText(
            text: 'Messages',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
        child: SingleChildScrollView(
          child: BlocBuilder<MessageCubit, MessageState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DefaultSearchBar(
                          searchController: cubit.searchController,
                          hintText: 'Search messages....',
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.bottomSheet(context);
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: AppTheme.black),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Icon(
                            Iconsax.setting_4,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        height: 2.h,
                        indent: 15.w,
                      ),
                      itemCount: itemMesaageModel.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRouters.chatPageRoute,
                                arguments: itemMesaageModel[index]);
                          },
                          child: MessageBuilder(
                            messageModel: itemMesaageModel[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
