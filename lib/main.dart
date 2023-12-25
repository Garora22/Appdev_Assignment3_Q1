import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Assignment 2 part 1',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key,});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final rollNoController = TextEditingController();
  final phonenoController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    rollNoController.dispose();
    phonenoController.dispose();
    super.dispose();
  }

  void _navigateToDisplayDetail() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DisplayDetail(
        name: nameController.text,
        roll: rollNoController.text,
        email: emailController.text,
        phone: phonenoController.text,
      ),
    ),
  ).then((result) {
    if (result == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('User(${nameController.text}) Logged out'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      emailController.clear();
      rollNoController.clear();
      phonenoController.clear();
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 2 : PART I'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Name:     "),
                const SizedBox(width: 20,),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Email:      "),
                const SizedBox(width: 20,),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Roll No:    "),
                const SizedBox(width: 20,),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: rollNoController,
                    decoration: const InputDecoration(
                      hintText: 'Roll No',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Phone No:"),
                const SizedBox(width: 20,),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: phonenoController,
                    decoration: const InputDecoration(
                      hintText: 'PhoneNo',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                _navigateToDisplayDetail();
              },
              child: const Text("Click Me!!"),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayDetail extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String roll;

  const DisplayDetail({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.roll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context,true);
          },
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Column(
          children: [
            Text('Name: $name'),
            const SizedBox(height: 8),
            Text('Email: $email'),
            const SizedBox(height: 8),
            Text('Roll No: $roll'),
            const SizedBox(height: 8,),
            Text('Phone No: $phone'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true); 
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ],
    ),
    );
  }
}
