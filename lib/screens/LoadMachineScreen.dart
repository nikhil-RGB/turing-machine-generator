import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:turing_machines/main.dart';
import 'package:turing_machines/models/Targets.dart';
import 'package:turing_machines/models/TuringMachineModel.dart';
import 'package:turing_machines/screens/TableScreen.dart';

class LoadMachineScreen extends StatefulWidget {
  @override
  State<LoadMachineScreen> createState() => _LoadMachineScreenState();
}

class _LoadMachineScreenState extends State<LoadMachineScreen> {
  @override
  Widget build(BuildContext context) {
    Targets platform = target;
    Size size = MediaQuery.of(context).size;
    if (size.width <= 480 && (platform == Targets.WEB)) {
      platform = Targets.ANDROID;
    }
    Box machineBox = Hive.box<TuringMachineModel>("turing_machines");
    List<dynamic> names = machineBox.keys.toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Load a saved machine"),
          actions: [
            IconButton(
                onPressed: () async {
                  await machineBox.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.restart_alt_rounded))
          ],
        ),
        body: Center(
          child: (names.isEmpty)
              ? const Text("No machines to view!")
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return createTile(
                        context, names[index] as String, machineBox, platform);
                  }),
        ),
      ),
    );
  }

//Create tile to click to load a machine.
  // Widget createTile(BuildContext context, String name, Box machineBox) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       bottom: 10.0,
  //       left: MediaQuery.of(context).size.width * 0.33,
  //       right: MediaQuery.of(context).size.width * 0.33,
  //     ),
  //     child: GestureDetector(
  //       onTap: () {
  //         Navigator.of(context)
  //             .pushReplacement(MaterialPageRoute(builder: (context) {
  //           return TableScreen(machine: machineBox.get(name).actuateMachine());
  //         }));
  //       },
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.blue,
  //           borderRadius: BorderRadius.circular(12.0),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(
  //             vertical: 10.0,
  //             horizontal: 6.0,
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Text(
  //                 name,
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.bold, fontSize: 22),
  //               ),
  //               const Gap(35.0),
  //               IconButton(
  //                   onPressed: () async {
  //                     await machineBox.delete(name);
  //                     setState(() {});
  //                   },
  //                   icon: const Icon(
  //                     Icons.delete_forever_rounded,
  //                     color: Colors.red,
  //                   ))
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget createTile(
      BuildContext context, String name, Box machineBox, Targets platform) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.0,
        left: (platform == Targets.ANDROID)
            ? MediaQuery.of(context).size.width * 0.12
            : MediaQuery.of(context).size.width * 0.33,
        right: (platform == Targets.ANDROID)
            ? MediaQuery.of(context).size.width * 0.12
            : MediaQuery.of(context).size.width * 0.33,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Adjust the border radius as needed
        ),
        trailing: IconButton(
          onPressed: () async {
            await machineBox.delete(name);
            setState(() {});
          },
          icon: const Icon(Icons.delete_forever),
        ),
        tileColor: Colors.blue,
        title: Center(
            child: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        )),
        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return TableScreen(machine: machineBox.get(name).actuateMachine());
          }));
        },
      ),
    );
  }
}
