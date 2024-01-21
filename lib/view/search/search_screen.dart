import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/cubit/home_cubit/home_cubit.dart';
import 'package:jobsque/widget/default_form_field.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/search_cubit/search_cubit.dart';
import '../../shimmer/shimmer_recent_job.dart';
import '../../styles/color.dart';
import '../../widget/default_header.dart';
import '../home/recent_builder.dart';

enum SearchType { recent, popular }
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> recentSearches = [
    'Junior UI Designer',
    'Junior UX Designer',
    'Product Designer',
    'Project Manager',
    'UI/UX Designer',
    'Front-End Developer',
  ];

  List<String> popularSearches = [
    'UI/UX Designer',
    'Project Manager',
    'Product Designer',
    'UX Designer',
    'Front-End Developer',
  ];

  List<String> foundJobs = [];

  void searchJobs(String keyword) {
    foundJobs.clear();
    if (keyword.isEmpty) {
      foundJobs.addAll(recentSearches);
    } else {
      foundJobs.addAll(
        recentSearches
            .where((job) => job.toLowerCase().contains(keyword.toLowerCase()))
            .toList(),
      );
    }
    setState(() {});
  }

  late HomeCubit cubit;
  late SearchCubit searchCubit;

  @override
  void initState() {
    cubit = HomeCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        toolbarHeight: 10.h,
        titleSpacing: 10,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, right: 12),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Iconsax.arrow_left,
              color: AppTheme.black,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 24, top: 14, bottom: 22),
          child:
           DefaultFormField(
            onFieldSubmitted: (name) {
              cubit.searchJob(name: name);
              // cubit.filterJob(input: input);
            },
            keyboardType: TextInputType.text,
            controller: searchController,
            hintText: 'Type something...',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: AppTheme.subText,
            // const Color(0xFF292D32),
            onChanged: searchJobs,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is SearchEmptyState) {
              }
              if (state is SearchLoadedState) {
                return Column(
                  children: [
                    DefaultHeader(
                        'Featuring ${cubit.foundResults.length} jobs'),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return cubit.recentJobsData.isNotEmpty?
                        Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: cubit.foundResults.length, 
                        itemBuilder: (context, index) => RecentJobBuilder(
                          jobDataModel: cubit.foundResults[index],
              ),
              ),
                    ):
                        const ShimmerRecentJob();
                      },
                    ),
                  ],
                );
              }
              return const Padding(
                padding: EdgeInsets.all(24.0),
                child: ShimmerRecentJob(),
              );
            })
          ],
        ),
      ),
    );
  }
}
