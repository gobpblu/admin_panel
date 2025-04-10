import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyData extends DataTableSource {
  final DashboardController controller = Get.put(DashboardController());

  @override
  DataRow? getRow(int index) {
    final data = controller.filteredDataList[index];
    return DataRow2(
      onTap: () {},
      selected: controller.selectedRows[index],
      onSelectChanged: (value) {
        controller.selectedRows[index] = value ?? false;
      },
      cells: [
        DataCell(Text(data['Column1'] ?? '')),
        DataCell(Text(data['Column2'] ?? '')),
        DataCell(Text(data['Column3'] ?? '')),
        DataCell(Text(data['Column4'] ?? '')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredDataList.length;

  @override
  int get selectedRowCount => 0;
}

class DashboardController extends GetxController {
  var dataList = <Map<String, String>>[].obs;
  var filteredDataList = <Map<String, String>>[].obs;
  final RxList<bool> selectedRows = <bool>[].obs;

  RxInt sortColumnIndex = 1.obs;
  RxBool isSortAscending = true.obs;
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void sortById(int sortIndex, bool isAscending) {
    isSortAscending.value = isAscending;
    sortColumnIndex.value = sortIndex;
    if (isAscending) {
      filteredDataList.sort((a, b) => a['Column${sortIndex + 1}']!.compareTo(b['Column${sortIndex + 1}']!));
    } else {
      filteredDataList.sort((a, b) => b['Column${sortIndex + 1}']!.compareTo(a['Column${sortIndex + 1}']!));
    }
  }

  void fetchDummyData() {
    selectedRows.assignAll(List.generate(36, (index) => false));

    dataList.addAll(
      List.generate(
        36,
        (index) => {
          'Column1': 'Data ${index + 1} - 1',
          'Column2': 'Data ${index + 1} - 2',
          'Column3': 'Data ${index + 1} - 3',
          'Column4': 'Data ${index + 1} - 4',
        },
      ),
    );
    filteredDataList.addAll(dataList);
  }

  void searchByQuery(String query) {
    filteredDataList.assignAll(dataList.where((item) => item['Column1']!.contains(query.toLowerCase())));
  }
}
