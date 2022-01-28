import 'package:flutter/material.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  static const routeName = '/carinfo';
  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final carModelController = TextEditingController();
  final carColorController = TextEditingController();
  final carNumberController = TextEditingController();

  List<String> carTypeList = ['uber-go', 'uber-x', 'bike'];
  String? _selectedCar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              Image.asset('assets/images/splash.png'),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Write Car Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: carModelController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: 'Enter your carmodel.',
                    labelText: 'Car Model',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: carNumberController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: 'Enter your number.',
                    labelText: 'Car Number',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              const SizedBox(height: 12),
              TextField(
                keyboardType: TextInputType.text,
                controller: carColorController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: 'Enter your carcolor.',
                    labelText: 'Car Color',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        elevation: 3,
                        icon: const Icon(Icons.arrow_drop_down_circle,
                            color: Colors.deepPurpleAccent),
                        value: _selectedCar,
                        hint: const Text(
                          'Select car type',
                          style: TextStyle(fontSize: 16),
                        ),
                        items: carTypeList.map((car) {
                          return DropdownMenuItem(value: car, child: Text(car));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCar = newValue.toString();
                          });
                        }),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_selectedCar);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // <-- Radius
                      ),
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  child: const Text(
                    'Save Now',
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
