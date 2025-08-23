import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/app_router.dart';

class SecurityLoginView extends HookWidget {
  const SecurityLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(onPressed: (){
                          appRouter.push('/demo');
                        }, child: Text('Demo'))
    ],);
  }
}