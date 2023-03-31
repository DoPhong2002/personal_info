// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatelessWidget(),
//       ),
//     );
//   }
// }
//
// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: const <DataColumn>[
//         DataColumn(
//           label: Expanded(
//             child: Text(
//               'Name',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ),
//         DataColumn(
//           label: Expanded(
//             child: Text(
//               'Age',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ),
//         DataColumn(
//           label: Expanded(
//             child: Text(
//               'Role',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ),
//       ],
//       rows: const <DataRow>[
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Sarah')),
//             DataCell(Text('19')),
//             DataCell(Text('Student')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Janine')),
//             DataCell(Text('43')),
//             DataCell(Text('Professor')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('William')),
//             DataCell(Text('27')),
//             DataCell(Text('Associate Professor')),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const int numItems = 3;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Role',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          // DataColumn(
          //   label: Text('Number'),
          // ),
        ],
        rows: List<DataRow>.generate(
          numItems,
              (int index) => DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  // All rows will have the same selected color.
                  if (states.contains(MaterialState.selected)) {
                    return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                  }
                  // Even rows will have a grey color.
                  if (index.isEven) {
                    return Colors.grey.withOpacity(0.3);
                  }
                  return null; // Use default value for other states and odd rows.
                }),
            cells: <DataCell>[
              DataCell(Text('Sarah')),
              DataCell(Text('19')),
              DataCell(Text('Student')),
            ],
            selected: selected[index],
            onSelectChanged: (bool? value) {
              setState(() {
                selected[index] = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
