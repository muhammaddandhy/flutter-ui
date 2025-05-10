import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          _buildListTile(context, "TextField Example", const MyTextField()),
          _buildListTile(context, "DropdownButton Example", const MyDropDown()),
          _buildListTile(context, "Switch Example", const MySwitch()),
          _buildListTile(context, "Radio Example", const MyRadio()),
          _buildListTile(context, "Checkbox Example", const MyCheckbox()),
          _buildListTile(context, "DatePicker Example", const MyDatePicker()),
          _buildListTile(context, "Dialog Example", const MyDialog()),
          _buildListTile(context, "BottomSheet Example", const MyBottomSheet()),
          _buildListTile(context, "Snackbar Example", const MySnackbar()),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, String title, Widget widget) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
    );
  }
}

// =================== Widgets Implementation ====================

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextField Example")),
      body: Center(
        child: TextField(
          maxLength: 20,
          controller: textController,
          decoration: const InputDecoration(
            labelText: "Nama",
            helperText: "Masukkan nama",
          ),
          onChanged: (value) => print(value),
        ),
      ),
    );
  }
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String selected = "Dart";
  final List<String> dropDownList = [
    "Dart",
    "Kotlin",
    "Java",
    "Javascript",
    "PHP",
    "Python",
    "Ruby",
    "Swift"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DropdownButton Example")),
      body: Row(
        children: [
          const Text("Bahasa favorit: "),
          const SizedBox(width: 8),
          DropdownButton(
            value: selected,
            items: dropDownList.map((value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (val) {
              setState(() {
                if (val != null) selected = val;
              });
            },
          ),
        ],
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Switch Example")),
      body: Row(
        children: [
          const Text("Connect Instagram"),
          Switch(
            value: isOn,
            onChanged: (val) => setState(() => isOn = val),
          ),
        ],
      ),
    );
  }
}

class MyRadio extends StatefulWidget {
  const MyRadio({super.key});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  String sex = "pria";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio Example")),
      body: Row(
        children: [
          const Text("Jenis Kelamin: "),
          Radio(
            value: 'pria',
            groupValue: sex,
            onChanged: (val) => setState(() => sex = val!),
          ),
          const Text("Pria"),
          Radio(
            value: 'wanita',
            groupValue: sex,
            onChanged: (val) => setState(() => sex = val!),
          ),
          const Text("Wanita"),
        ],
      ),
    );
  }
}

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkbox Example")),
      body: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (val) => setState(() => isChecked = val!),
          ),
          const Text("Setuju syarat dan ketentuan."),
        ],
      ),
    );
  }
}

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DatePicker Example")),
      body: InkWell(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            setState(() {
              dateController.text = pickedDate.toString().split(' ')[0];
            });
          }
        },
        child: TextFormField(
          controller: dateController,
          enabled: false,
          decoration: const InputDecoration(
            labelText: "Tanggal Lahir",
            suffixIcon: Icon(Icons.date_range),
          ),
        ),
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dialog Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Info'),
                content: const Text('Your order was placed.'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BottomSheet Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Your order was placed!'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Text('Open BottomSheet'),
        ),
      ),
    );
  }
}

class MySnackbar extends StatelessWidget {
  const MySnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snackbar Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.blue,
                content: Text('Your request is successful'),
              ),
            );
          },
          child: const Text('Open SnackBar'),
        ),
      ),
     );
  }
}
