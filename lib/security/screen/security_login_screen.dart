import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';
import '../view/security_login_view.dart';

class SecurityLoginScreen extends HookWidget {
  const SecurityLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
          return AppScaffold(
            appBar: null,
            loadingOverlay: true,
            disableBackButton: true,
            onBackButtonPressed: () async {
              return Future.value(true);
            },
            body: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        // Positioned(
                        //   top: 16,
                        //   left: -10,
                        //   child: AppSecondaryBtn.icon(
                        //     onPressed: () {
                        //       appRouter.pop();
                        //     },
                        //     text: null,
                        //     icon: const Icon(Icons.arrow_back),
                        //     onCard: false,
                        //   ),
                        // ),
                        Center(
                          child: Image.asset(
                            'assets/images/texi.png',
                            width: MediaQuery.of(context).size.height * 0.2,
                          ),
                        ),
                        ElevatedButton(onPressed: (){
            
                        }, child: Text('Demo'))
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SecurityLoginView(),
                  ],
                ),
              ),
            ),
          );
  }
}
