import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/constants/app_colors.dart';
import 'package:flutter_projects/core/constants/asset_path.dart';
import 'package:flutter_projects/core/global/custom_text.dart';
import 'package:flutter_projects/core/global/custom_textfield.dart';
import 'package:flutter_projects/features/home/bloc/home_bloc.dart';
import 'package:flutter_projects/features/home/bloc/home_event.dart';
import 'package:flutter_projects/features/home/bloc/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.add(const LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      borderRadius: 12,
                      hintText: 'Search Anything...',
                      onChanged: (value) => _bloc.add(SearchProducts(value)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.h),
                  IconButton(
                    onPressed: () {
                      modalBottomSheet(context);
                    },
                    icon: Icon(Icons.filter_list_outlined, size: 35.h),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      final products = state.products;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.5,
                            ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          products[index].images?[0] ?? '',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15.r,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite_border_rounded,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              CustomText(
                                text: products[index].title ?? 'No Title',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryTextColor,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text: '\$${products[index].price}',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryTextColor,
                                  ),
                                  SizedBox(width: 5),
                                  CustomText(
                                    text: '\$${products[index].price}',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                    textDecoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.greyColor,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: CustomText(
                                      text:
                                          '${products[index].discountPercentage}% off',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.orangeColor,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetPath.ratingIcon),
                                  SizedBox(width: 10),
                                  CustomText(
                                    text: '${products[index].rating}',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryTextColor,
                                  ),
                                  SizedBox(width: 5),
                                  CustomText(
                                    text:
                                        '(${products[index].reviews!.length})',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyColor,
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    } else if (state is ProductError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future modalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return SizedBox(
          height: 230.h,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Sort By',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close_rounded),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomText(
                  text: 'Price - High to Low',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryTextColor,
                  onTextTap: () => _bloc.add(const SortProducts('highToLow')),
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: 'Price - Low to High',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryTextColor,
                  onTextTap: () => _bloc.add(const SortProducts('lowToHigh')),
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: 'Rating',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryTextColor,
                  onTextTap: () => _bloc.add(const SortProducts('rating')),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
