import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() {
  runApp(const ConverterApp());
}

class ConverterApp extends StatelessWidget {
  const ConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: const ConverterHomePage(),
    );
  }
}

class ConverterHomePage extends StatefulWidget {
  const ConverterHomePage({super.key});

  @override
  State<ConverterHomePage> createState() => _ConverterHomePageState();
}

class _ConverterHomePageState extends State<ConverterHomePage> {
  final Map<String, Widget> _converterWidgets = {
    'Currency Converter': const CurrencyConverter(),
    'Temperature Converter': const TemperatureConverter(),
    'Friendship Calculator': const FriendshipCalculator(),
    'Age Calculator': const AgeCalculator(),
    'BMI Calculator': const BMICalculator(),
    'Length Converter': const LengthConverter(),
    'Area Converter': const AreaConverter(),
    'Volume Converter': const VolumeConverter(),
    'Weight & Mass Converter': const WeightMassConverter(),
    'Time Converter': const TimeConverter(),
  };

  String? _selectedConverter;

  @override
  void initState() {
    super.initState();
    _selectedConverter = _converterWidgets.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedConverter,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedConverter = newValue!;
                    });
                  },
                  items: _converterWidgets.keys.map<DropdownMenuItem<String>>(
                        (String key) {
                      return DropdownMenuItem<String>(
                        value: key,
                        child: Text(key, style: const TextStyle(fontSize: 16)),
                      );
                    },
                  ).toList(),
                  underline: const SizedBox(), // Remove the default underline
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _converterWidgets[_selectedConverter] ?? Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== Friendship Calculator ====================
class FriendshipCalculator extends StatefulWidget {
  const FriendshipCalculator({super.key});

  @override
  _FriendshipCalculatorState createState() => _FriendshipCalculatorState();
}

class _FriendshipCalculatorState extends State<FriendshipCalculator> {
  final TextEditingController _nameController1 = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();
  String _friendshipResult = '';

  void _calculateFriendship() {
    setState(() {
      int percentage = Random().nextInt(101);
      _friendshipResult = 'Friendship Score: $percentage%';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController1,
          decoration: const InputDecoration(
            labelText: 'Enter first name',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _nameController2,
          decoration: const InputDecoration(
            labelText: 'Enter second name',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _calculateFriendship,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Calculate Friendship'),
        ),
        const SizedBox(height: 20),
        Text(
          _friendshipResult,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Currency Converter ====================
class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _selectedFromCurrency = 'USD';
  String _selectedToCurrency = 'PKR';
  final Map<String, double> _conversionRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'PKR': 277.0,
  };

  void _convert() {
    setState(() {
      double input = double.tryParse(_controller.text) ?? 0;
      _result = input * (_conversionRates[_selectedToCurrency]! / _conversionRates[_selectedFromCurrency]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter amount',
            prefixIcon: Icon(Icons.attach_money),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _selectedFromCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFromCurrency = newValue!;
                });
              },
              items: _conversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
            const Text('to', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedToCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedToCurrency = newValue!;
                });
              },
              items: _conversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _convert,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20),
        Text(
          'Converted Amount: $_result',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Age Calculator ====================
class AgeCalculator extends StatefulWidget {
  const AgeCalculator({super.key});

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  DateTime? _selectedDate;
  String _ageResult = '';

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _calculateAge();
      });
    }
  }

  void _calculateAge() {
    if (_selectedDate == null) return;

    DateTime now = DateTime.now();
    Duration difference = now.difference(_selectedDate!);

    int years = (difference.inDays / 365).floor();
    int months = ((difference.inDays % 365) / 30).floor();
    int days = (difference.inDays % 365) % 30;

    setState(() {
      _ageResult = "$years years $months months $days days";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _pickDate,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Select Date of Birth'),
        ),
        const SizedBox(height: 20),
        Text(
          _selectedDate == null ? 'No date selected' : DateFormat.yMMMMd().format(_selectedDate!),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          _ageResult,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Temperature Converter ====================
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _selectedFromUnit = 'Celsius';
  String _selectedToUnit = 'Fahrenheit';

  final Map<String, Function(double)> _toCelsius = {
    'Celsius': (double value) => value,
    'Fahrenheit': (double value) => (value - 32) * 5 / 9,
    'Kelvin': (double value) => value - 273.15,
  };

  final Map<String, Function(double)> _fromCelsius = {
    'Celsius': (double value) => value,
    'Fahrenheit': (double value) => (value * 9 / 5) + 32,
    'Kelvin': (double value) => value + 273.15,
  };

  void _convert() {
    setState(() {
      double input = double.tryParse(_controller.text) ?? 0;
      double celsiusValue = _toCelsius[_selectedFromUnit]!(input);
      _result = _fromCelsius[_selectedToUnit]!(celsiusValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter temperature',
            prefixIcon: Icon(Icons.thermostat),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _selectedFromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFromUnit = newValue!;
                });
              },
              items: _toCelsius.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
            const Text('to', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedToUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedToUnit = newValue!;
                });
              },
              items: _fromCelsius.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _convert,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20),
        Text(
          'Converted Temperature: $_result',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== BMI Calculator ====================
class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _bmiResult = '';

  void _calculateBMI() {
    setState(() {
      double weight = double.tryParse(_weightController.text) ?? 0;
      double height = double.tryParse(_heightController.text) ?? 0;

      if (weight > 0 && height > 0) {
        double bmi = weight / pow(height / 100, 2);
        _bmiResult = 'BMI: ${bmi.toStringAsFixed(2)} (${_bmiCategory(bmi)})';
      } else {
        _bmiResult = 'Please enter valid values!';
      }
    });
  }

  String _bmiCategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 24.9) return 'Normal weight';
    if (bmi < 29.9) return 'Overweight';
    return 'Obese';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter weight (kg)',
            prefixIcon: Icon(Icons.monitor_weight),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _heightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter height (cm)',
            prefixIcon: Icon(Icons.height),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _calculateBMI,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Calculate BMI'),
        ),
        const SizedBox(height: 20),
        Text(
          _bmiResult,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Length Converter ====================
class LengthConverter extends StatefulWidget {
  const LengthConverter({super.key});

  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  final TextEditingController _lengthController = TextEditingController();
  double _convertedValue = 0.0;

  String _selectedFromUnit = 'Meters';
  String _selectedToUnit = 'Kilometers';

  final Map<String, double> _lengthConversionRates = {
    'Meters': 1.0,
    'Kilometers': 0.001,
    'Centimeters': 100.0,
    'Millimeters': 1000.0,
    'Inches': 39.3701,
    'Feet': 3.28084,
  };

  void _convertLength() {
    setState(() {
      double input = double.tryParse(_lengthController.text) ?? 0;
      _convertedValue = input *
          (_lengthConversionRates[_selectedToUnit]! /
              _lengthConversionRates[_selectedFromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _lengthController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter length',
            prefixIcon: Icon(Icons.straighten),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _selectedFromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFromUnit = newValue!;
                });
              },
              items: _lengthConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
            const Text('to', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedToUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedToUnit = newValue!;
                });
              },
              items: _lengthConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _convertLength,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20),
        Text(
          'Converted Value: $_convertedValue',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Area Converter ====================
class AreaConverter extends StatefulWidget {
  const AreaConverter({super.key});

  @override
  _AreaConverterState createState() => _AreaConverterState();
}

class _AreaConverterState extends State<AreaConverter> {
  final TextEditingController _areaController = TextEditingController();
  double _convertedValue = 0.0;

  String _selectedFromUnit = 'Square Meters';
  String _selectedToUnit = 'Square Kilometers';

  final Map<String, double> _areaConversionRates = {
    'Square Meters': 1.0,
    'Square Kilometers': 0.000001,
    'Square Centimeters': 10000.0,
    'Square Millimeters': 1000000.0,
    'Acres': 0.000247105,
    'Hectares': 0.0001,
  };

  void _convertArea() {
    setState(() {
      double input = double.tryParse(_areaController.text) ?? 0;
      _convertedValue = input *
          (_areaConversionRates[_selectedToUnit]! /
              _areaConversionRates[_selectedFromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _areaController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter area',
            prefixIcon: Icon(Icons.crop_square),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _selectedFromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFromUnit = newValue!;
                });
              },
              items: _areaConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
            const Text('to', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedToUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedToUnit = newValue!;
                });
              },
              items: _areaConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _convertArea,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20),
        Text(
          'Converted Value: $_convertedValue',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Volume Converter ====================
class VolumeConverter extends StatefulWidget {
  const VolumeConverter({super.key});

  @override
  _VolumeConverterState createState() => _VolumeConverterState();
}

class _VolumeConverterState extends State<VolumeConverter> {
  final TextEditingController _volumeController = TextEditingController();
  double _convertedValue = 0.0;

  String _selectedFromUnit = 'Liters';
  String _selectedToUnit = 'Milliliters';

  final Map<String, double> _volumeConversionRates = {
    'Liters': 1.0,
    'Milliliters': 1000.0,
    'Cubic Meters': 0.001,
    'Cubic Centimeters': 1000.0,
    'Gallons': 0.264172,
    'Cups': 4.22675,
  };

  void _convertVolume() {
    setState(() {
      double input = double.tryParse(_volumeController.text) ?? 0;
      _convertedValue = input *
          (_volumeConversionRates[_selectedToUnit]! /
              _volumeConversionRates[_selectedFromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _volumeController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter volume',
            prefixIcon: Icon(Icons.water_drop),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _selectedFromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFromUnit = newValue!;
                });
              },
              items: _volumeConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
            const Text('to', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedToUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedToUnit = newValue!;
                });
              },
              items: _volumeConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _convertVolume,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20),
        Text(
          'Converted Value: $_convertedValue',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Weight & Mass Converter ====================
class WeightMassConverter extends StatefulWidget {
  const WeightMassConverter({super.key});

  @override
  _WeightMassConverterState createState() => _WeightMassConverterState();
}

class _WeightMassConverterState extends State<WeightMassConverter> {
  final TextEditingController _weightController = TextEditingController();
  double _convertedValue = 0.0;

  String _selectedFromUnit = 'Kilograms';
  String _selectedToUnit = 'Grams';

  final Map<String, double> _weightConversionRates = {
    'Kilograms': 1.0,
    'Grams': 1000.0,
    'Pounds': 2.20462,
    'Ounces': 35.274,
    'Stones': 0.157473,
    'Tons': 0.001,
  };

  void _convertWeight() {
    setState(() {
      double input = double.tryParse(_weightController.text) ?? 0;
      _convertedValue = input *
          (_weightConversionRates[_selectedToUnit]! /
              _weightConversionRates[_selectedFromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter weight/mass',
            prefixIcon: Icon(Icons.scale),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _selectedFromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFromUnit = newValue!;
                });
              },
              items: _weightConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
            const Text('to', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedToUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedToUnit = newValue!;
                });
              },
              items: _weightConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _convertWeight,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20),
        Text(
          'Converted Value: $_convertedValue',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ==================== Time Converter ====================
class TimeConverter extends StatefulWidget {
  const TimeConverter({super.key});

  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  final TextEditingController _timeController = TextEditingController();
  double _convertedValue = 0.0;

  String _selectedFromUnit = 'Seconds';
  String _selectedToUnit = 'Minutes';

  final Map<String, double> _timeConversionRates = {
    'Seconds': 1.0,
    'Minutes': 1 / 60,
    'Hours': 1 / 3600,
    'Days': 1 / 86400,
    'Weeks': 1 / 604800,
    'Months': 1 / 2.628e+6, // Approximate (30.44 days)
  };

  void _convertTime() {
    setState(() {
      double input = double.tryParse(_timeController.text) ?? 0;
      _convertedValue = input *
          (_timeConversionRates[_selectedToUnit]! /
              _timeConversionRates[_selectedFromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _timeController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter time',
            prefixIcon: Icon(Icons.access_time),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _selectedFromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFromUnit = newValue!;
                });
              },
              items: _timeConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
            const Text('to', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedToUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedToUnit = newValue!;
                });
              },
              items: _timeConversionRates.keys.map<DropdownMenuItem<String>>(
                    (String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _convertTime,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Convert'),
        ),
        const SizedBox(height: 20),
        Text(
          'Converted Value: $_convertedValue',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
