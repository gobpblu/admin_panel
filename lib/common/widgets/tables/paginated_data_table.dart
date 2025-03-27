import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomPaginatedDataTable extends StatelessWidget {
  const CustomPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.sortColumnIndex,
    this.dataRowHeight = AppSizes.xl * 3,
    this.isSortAscending = true,
    this.minWidth = 1000,
  });

  final bool isSortAscending;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPageChanged;
  final double tableHeight;
  final double? minWidth;
  final double dataRowHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(cardTheme: const CardTheme(color: Colors.white, elevation: 0)),
        child: PaginatedDataTable2(
          source: source,

          /// COLUMNS & ROWS
          columns: columns,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          rowsPerPage: rowsPerPage,
          dataRowHeight: dataRowHeight,

          /// CHECKBOX
          showCheckboxColumn: true,

          /// PAGINATION
          showFirstLastButtons: true,
          onPageChanged: onPageChanged,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (rowsNumber) {},

          /// HEADER DESIGN
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith((states) => AppColors.primaryBackground),
          headingRowDecoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.borderRadiusMd),
            topRight: Radius.circular(AppSizes.borderRadiusMd),
          )),
          empty: const AnimationLoaderWidget(
            text: 'Nothing found',
            animation: AppImages.packageAnimation,
            height: 200,
            width: 200,
          ),

          /// SORTING
          sortAscending: isSortAscending,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (isAscending, isSorted) {
            IconData iconData;
            if (isSorted) {
              iconData = isAscending ? Iconsax.arrow_up_3 : Iconsax.arrow_down;
            } else {
              iconData = Iconsax.arrow_3;
            }
            return Icon(iconData, size: AppSizes.iconSm);
          },
        ),
      ),
    );
  }
}
