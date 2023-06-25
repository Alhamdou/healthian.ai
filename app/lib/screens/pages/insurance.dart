import 'package:flutter/material.dart';

class InsurancePolicy {
  final String name;
  final String description;
  final String termsAndConditions;

  InsurancePolicy(
      {required this.name,
      required this.description,
      required this.termsAndConditions});
}

class InsurancePage extends StatefulWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  int _selectedIndex = -1;
  final List<InsurancePolicy> _policies = [
    InsurancePolicy(
      name: 'Basic Policy',
      description: 'Covers basic medical expenses',
      termsAndConditions:
          'This policy covers only basic medical expenses such as hospitalization, surgeries, etc. It does not cover any advanced medical procedures or treatments.',
    ),
    InsurancePolicy(
      name: 'Premium Policy',
      description: 'Covers advanced medical procedures',
      termsAndConditions:
          'This policy covers both basic and advanced medical procedures such as organ transplants, cancer treatments, etc. However, it comes with a higher premium and deductibles.',
    ),
    InsurancePolicy(
      name: 'Family Policy',
      description: 'Covers medical expenses for the whole family',
      termsAndConditions:
          'This policy covers medical expenses for the whole family. However, it has a limit on the number of family members covered and a higher premium.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance Policies'),
      ),
      body: ListView.builder(
        itemCount: _policies.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Card(
              elevation: 2.0,
              margin: EdgeInsets.all(10.0),
              color: _selectedIndex == index ? Colors.grey[300] : Colors.white,
              child: ListTile(
                title: Text(_policies[index].name),
                subtitle: Text(_policies[index].description),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _selectedIndex == -1
          ? null
          : BottomAppBar(
              child: Container(
                height: 60.0,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _policies[_selectedIndex].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Buy Policy'),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
