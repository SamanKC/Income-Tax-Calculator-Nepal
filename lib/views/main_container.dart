import 'package:flutter/material.dart';
import 'package:income_tax_calculator_nepal/controllers/calculate_married.dart';
import 'package:income_tax_calculator_nepal/controllers/calculate_unmarried.dart';
import 'package:income_tax_calculator_nepal/utils/constants.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final controller = TextEditingController();
  double monthlySalary = 0;
  double annualSalary = 0;
  List result = [];
  // Initial Selected Value
  String dropDownValue = 'UnMarried';

  // List of items in our dropdown menu
  var items = ["UnMarried", "Married"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How much tax will i pay?",
                style: primaryText,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: const Divider(
                  thickness: 3,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Enter your details: ",
            style: secondaryText,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                // Initial Value
                value: dropDownValue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
            onChanged: (value) {
              monthlySalary = double.parse(value);
              setState(() {
                annualSalary = monthlySalary * 12;
              });
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Your Monthly Income"),
              alignLabelWithHint: true,
              hintText: "Enter your Monthly Salary",
              // prefix: Text("Monthly Income: "),
              border: OutlineInputBorder(),
              // labelText: ""
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            // controller: controller,

            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text("Yearly Income: $annualSalary"),
              enabled: false,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      annualSalary = 0;
                      controller.clear();
                      dropDownValue = items[0];
                    });
                  },
                  child: const Text(
                    "Reset",
                    style: buttonText,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: OutlinedButton(
                  onPressed: () {
                    if (dropDownValue == items[0]) {
                      result = calculateUnMarried(annualSalary);
                    } else {
                      result = calculateMarried(annualSalary);
                    }
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        scrollable: true,
                        title: const Text("Your Tax Sheet is: "),
                        content: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tax Amount: Rs.${result[0]}",
                                style: buttonText,
                              ),
                              Text(
                                "Tax Percentage: ${result[1]}%",
                                style: buttonText,
                              ),
                              Text(
                                "Salary After Tax: Rs.${result[2]}",
                                style: buttonText,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Calculate",
                    style: buttonText,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
