// ignore_for_file: unused_catch_clause

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:turing_machines/models/Behaviour.dart';
import 'package:turing_machines/models/Configuration.dart';
import 'package:turing_machines/models/TuringMachines.dart';
import 'package:turing_machines/models/Actions.dart' as actions;
import 'package:turing_machines/screens/TapeScreen.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key, required this.machine});
  final TuringMachine machine;
  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  //0->m-config,1->Scanned Symbol,2->Actions,3->f-configs
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  String deleteValue = "NONE";
  String initialConfigValue = "NONE";

  //0->m-config,1->Scanned Symbol,2->Actions,3->f-configs;
  final List<Function(String?)> validators = <Function(String?)>[
    (value) {
      if (value == null || value.isEmpty) {
        return "m-config cannot be empty";
      } else if (value.contains(" ")) {
        return "m-config cannot contain spaces";
      }
      return null;
    },
    (value) {
      if (((value == null) || (value.length != 1)) &&
          (value!.toLowerCase() != "none") &&
          (value.toLowerCase() != "any")) {
        return "Must be a single character or NONE.";
      }
      return null;
    },
    (value) {
      if (value == null) {
        return "Input cannot be empty";
      }
      try {
        actions.Actions.parseActions(value);
      } catch (e) {
        return "Invalid input!";
      }
    },
    (value) {
      if (value == null || value.isEmpty) {
        return "m-config cannot be empty";
      } else if (value.contains(" ")) {
        return "m-config cannot contain spaces";
      }
      return null;
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TableScreen"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    initialConfigValue = "NONE";
                    deleteValue = "NONE";
                    for (TextEditingController contr in _controllers) {
                      contr.clear();
                    }
                    widget.machine.reset();
                  });
                },
                icon: const Icon(Icons.restart_alt_rounded))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                controller: _scrollController,
                child: SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: DataTable(
                      decoration: const BoxDecoration(
                        color: Colors.blue, // Set the background color here
                      ),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'M-config',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Symbol',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Actions',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'New m-config',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                      rows: buildEntries(),
                    ),
                  ),
                ),
              ),
              const Gap(60),
              entryForm(),
              const Gap(20),
              deleteDropDown(),
              const Gap(20),
              selectInitialConfigDropDown(),
              const Gap(70),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (initialConfigValue == "NONE") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Initial M-Configuration cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  // widget.machine.initial_config = initialConfigValue;
                  // widget.machine.current_config = initialConfigValue;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TapeScreen(machine: widget.machine);
                  }));
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Create Machine",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Creates the drop down to select the initial configuration for the turing machine
  Widget selectInitialConfigDropDown() {
    List<String> availableConfigs = widget.machine.machine.keys
        .map((config) => config.m_config)
        .toSet()
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Select initial M-Config"),
        const Gap(13.0),
        DropdownButton(
          value: initialConfigValue,
          items: availableConfigs.map((config) {
            return DropdownMenuItem(
              value: config,
              child: Text(config),
            );
          }).toList()
            ..insert(
              0,
              const DropdownMenuItem(
                value: "NONE",
                child: Text("NONE"),
              ),
            ),
          onChanged: (widget.machine.machine.isEmpty)
              ? null
              : (Object? value) {
                  if (value == null || value == "NONE") {
                    return;
                  }
                  setState(() {
                    initialConfigValue = value as String;
                    widget.machine.current_config = initialConfigValue;
                    widget.machine.initial_config = initialConfigValue;
                  });
                },
        ),
      ],
    );
  }

  //Creates the drop down and associated button required to delete a configuration.
  Widget deleteDropDown() {
    List<String> availableConfigs =
        widget.machine.machine.keys.map((config) => config.toString()).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          items: availableConfigs.map((config) {
            return DropdownMenuItem(
              value: config,
              child: Text(config),
            );
          }).toList()
            ..insert(
              0,
              const DropdownMenuItem(
                value: "NONE",
                child: Text("NONE"),
              ),
            ),
          value: deleteValue,
          onChanged: (widget.machine.machine.isEmpty)
              ? null
              : (Object? value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    deleteValue = value as String;
                  });
                },
        ),
        const Gap(12.0),
        ElevatedButton(
            onPressed: (widget.machine.machine.isEmpty)
                ? null
                : () {
                    if (deleteValue == "NONE") {
                      return;
                    }
                    Configuration toBeDeleted =
                        Configuration.fromString(deleteValue);
                    setState(() {
                      if (toBeDeleted.m_config == initialConfigValue) {
                        initialConfigValue = "NONE";
                      }
                      deleteValue = "NONE";
                      widget.machine.machine.remove(toBeDeleted);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$toBeDeleted deleted')),
                    );
                  },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }

  // Builds rows for tables
  List<DataRow> buildEntries() {
    List<DataRow> dataRows = <DataRow>[];
    widget.machine.machine.forEach((config, behaviour) {
      List<DataCell> dataCells = <DataCell>[];
      dataCells.add(DataCell(Text(config.m_config)));
      dataCells.add(DataCell(Text(parseSymbolOutput(config.symbol))));
      dataCells.add(
          DataCell(Text(actions.Actions.printableListFrom(behaviour.actions))));
      dataCells.add(DataCell(Text(behaviour.f_config)));
      dataRows.add(DataRow(cells: dataCells));
    });
    return dataRows;
  }

  Form entryForm() {
    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _fieldInput(
            label: "Input M-Config",
            hint: "Example: B",
            index: 0,
          ),
          const Gap(3),
          _fieldInput(
            label: "Input Scanned Symbol",
            hint: "Example: 0",
            index: 1,
          ),
          const Gap(3),
          _fieldInput(
            label: "Input Actions(Px,R,L,E) separated by ,",
            hint: "Example: P0,R,P1",
            index: 2,
          ),
          const Gap(3),
          _fieldInput(
            label: "Input final M-config",
            hint: "Example: Q",
            index: 3,
          ),
          const Gap(22),
          ElevatedButton(
            onPressed: () {
              if ((_formKey.currentState!.validate())) {
                Configuration config = Configuration(
                    m_config: _controllers[0].text,
                    symbol: parseSymbolInput(_controllers[1].text));
                Behaviour behaviour = Behaviour(
                    actions: actions.Actions.parseActions(_controllers[2].text),
                    f_config: _controllers[3].text);

                setState(() {
                  for (TextEditingController contr in _controllers) {
                    contr.clear();
                  }
                  widget.machine.addEntry(config, behaviour);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data Entry added')),
                );
                //Construct and add entry to machine
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid Data Entry')),
                );
              }
            },
            child: const Text("Add Row to table."),
          ),
        ],
      ),
    );
  }

  //custom widgets
  Widget _fieldInput({
    required String label,
    required String hint,
    required int index,
    // required Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: SizedBox(
        width: (index == 2) ? 400 : 250,
        child: TextFormField(
          validator: (value) {
            return validators[index](value);
          },
          autovalidateMode: AutovalidateMode.disabled,
          controller: _controllers[index],
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            alignLabelWithHint: true,
            labelStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black38,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400),
            floatingLabelStyle: const TextStyle(color: Color(0xff23a590)),
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 3, color: Colors.black12), //<-- SEE HERE
              borderRadius: BorderRadius.circular(50.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue.shade400),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}
