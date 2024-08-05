# How to disable the outer border in the Flutter DataGrid (SfDataGrid)?.

In this article, we will show you how to disable the outer border in the [Flutter DataGrid](https://www.syncfusion.com/flutter-widgets/flutter-datagrid).

Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all the required properties. Use the [ClipRect](https://api.flutter.dev/flutter/widgets/ClipRect-class.html) widget along with a [custom clipper](https://api.flutter.dev/flutter/widgets/ClipRect/clipper.html) (CustomClipper) to remove the outer borders. To achieve this, create a custom clipper class by extending the CustomClipper class. In the [getClip](https://api.flutter.dev/flutter/rendering/CustomClipper/getClip.html) method, use Rect.fromLTWH to set the grid line stroke width for the left and top sides, and specify the appropriate size for the right and bottom sides based on the grid layout. After defining this custom clipper, wrap the SfDataGrid with the ClipRect widget to control the visibility of the borders as desired.

```dart
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
            gridLinesVisibility: GridLinesVisibility.vertical,
            headerGridLinesVisibility: GridLinesVisibility.vertical,
            columns: getColumns,
          ),
        ));
  }

class CustomLeftClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(2, 2, size.width - 4, size.height - 58);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
```

You can download this example on [GitHub](https://github.com/SyncfusionExamples/How-to-disable-the-outer-border-in-the-flutter-DataGrid).