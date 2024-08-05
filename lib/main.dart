import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SfDataGridDemo()));
}

class SfDataGridDemo extends StatefulWidget {
  const SfDataGridDemo({super.key});

  @override
  SfDataGridDemoState createState() => SfDataGridDemoState();
}

class SfDataGridDemoState extends State<SfDataGridDemo> {
  late EmployeeDataSource _employeeDataSource;
  List<Employee> _employees = <Employee>[];

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter SfDataGrid'),
        ),
        body: ClipRect(
          clipper: CustomLeftClipper(),
          child: SfDataGrid(
            columnWidthMode: ColumnWidthMode.fill,
            source: _employeeDataSource,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            columns: getColumns,
          ),
        ));
  }

  List<GridColumn> get getColumns {
    return [
      GridColumn(
          columnName: 'id',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('ID'))),
      GridColumn(
          columnName: 'name',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Name'))),
      GridColumn(
          columnName: 'designation',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Designation'))),
      GridColumn(
          columnName: 'salary',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Salary ')))
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    buildDataGridRow(employees);
  }

  void buildDataGridRow(List<Employee> employeeData) {
    dataGridRow = employeeData.map<DataGridRow>((employee) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: employee.id),
        DataGridCell<String>(columnName: 'name', value: employee.name),
        DataGridCell<String>(
            columnName: 'designation', value: employee.designation),
        DataGridCell<int>(columnName: 'salary', value: employee.salary),
      ]);
    }).toList();
  }

  List<DataGridRow> dataGridRow = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => dataGridRow.isEmpty ? [] : dataGridRow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
          ));
    }).toList());
  }
}

List<Employee> getEmployeeData() {
  return [
    Employee(10001, 'James', 'Project Lead', 20000),
    Employee(10002, 'Kathryn', 'Manager', 30000),
    Employee(10003, 'Lara', 'Developer', 15000),
    Employee(10004, 'Michael', 'Designer', 15000),
    Employee(10005, 'martin', 'Developer', 15000),
    Employee(10006, 'newberry', 'Developer', 15000),
    Employee(10007, 'Balnc', 'Project Lead', 25000),
    Employee(10008, 'Michael', 'Designer', 15000),
    Employee(10009, 'martin', 'Developer', 15000),
    Employee(10010, 'newberry', 'Developer', 15000),
  ];
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

class CustomLeftClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(2, 2, size.width - 4, size.height - 58);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
