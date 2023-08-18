import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class FlashLight extends StatefulWidget {
  const FlashLight({super.key});

  @override
  State<FlashLight> createState() => _FlashLightState();
}

class _FlashLightState extends State<FlashLight> {
  final bgColor = Colors.grey[800];
  final txtColor = Colors.white;
  var theActive = false;
  var controller  = TorchController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "El Feneri",
          style: TextStyle(
            color: txtColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    theActive
                        ? 'assets/flashlightOn.png'
                        : 'assets/flashlightOff.png',
                    width: 200,
                    height: 200,
                    color: theActive
                        ? null
                        : txtColor.withOpacity(0.6),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CircleAvatar(
                    minRadius: 33,
                    maxRadius: 44,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        onPressed: () {
                          controller.toggle();
                          theActive = !theActive;
                          setState(() {
                            
                          });
                        },
                        icon: const Icon(Icons.power_settings_new_outlined),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Text(
            "Developed by ibrahim",
            style: TextStyle(
              color: txtColor,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          )
        ],
      ),
    );
  }
}
