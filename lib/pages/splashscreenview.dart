import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/controllers/splashscreen_controller.dart';
import 'package:flutter_project/widgets/button.dart';
import 'package:flutter_project/widgets/text.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Obx(() => Column(
            children: controller.bodyData.where((e) => e["position"] as int == controller.currentShowing.value).map((element) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ImageFade(
                      width: 250,
                      // whenever the image changes, it will be loaded, and then faded in:
                      image: AssetImage(element['image'].toString()),

                      // slow fade for newly loaded images:
                      duration: const Duration(milliseconds: 900),

                      // if the image is loaded synchronously (ex. from memory), fade in faster:
                      syncDuration: const Duration(milliseconds: 150),

                      // supports most properties of Image:
                      alignment: Alignment.center,
                      fit: BoxFit.cover,

                      // shown behind everything:
                      placeholder: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: const Icon(Icons.photo,
                            color: Colors.white30, size: 128.0),
                      ),

                      // shows progress while loading an image:
                      loadingBuilder: (context, progress, chunkEvent) =>
                          Center(child: CircularProgressIndicator(value: progress)),

                      // displayed when an error occurs:
                      errorBuilder: (context, error) => Container(
                        color: const Color(0xFF6F6D6A),
                        alignment: Alignment.center,
                        child: const Icon(Icons.warning,
                            color: Colors.black26, size: 128.0),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: element['title'].toString(),
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: "Monteserrat",
                      fontWeight: FontWeight.w800,
                      textAlign: TextAlign.center,
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: element['subTitle'].toString(),
                      color: Colors.red,
                      fontSize: 20,
                      fontFamily: "",
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextWidget(
                      text:
                      element['description'].toString(),
                      color: Colors.red,
                      fontSize: 20,
                      fontFamily: "",
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InkWell(
                      child:  ButtonWidget(
                          widget: TextWidget(
                            text: element['buttonText'],
                            color: Color(0xffF5F5F7),
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: 'Montesarrat',
                          ),
                          color: Color(0xff335571),
                          radius: 100,
                          width: 120),
                      onTap: () {
                        controller.changeCurrentShowing();
                      },
                    ),
                  )
                ]),).toList()
        ),)
      ),
      backgroundColor: const Color(0xffF5F5F7),


    );
    throw UnimplementedError();
  }
}
