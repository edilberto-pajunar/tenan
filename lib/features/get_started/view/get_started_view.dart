import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:tenan/features/home/view/home_page.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Get Started"),
            const SizedBox(height: 12.0),
            FormBuilder(
              child: FormBuilderTextField(
                name: "code",
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                context.go(HomePage.route);
              },
              child: const Text("Let's get started"),
            ),
          ],
        ),
      ),
    );
  }
}
