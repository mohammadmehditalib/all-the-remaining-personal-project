import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_3/Providers/ListPlaces.dart';
import 'package:flutter_application_3/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  @override
  ConsumerState<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  String  captureImage='https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg';

  @override
  void initState() {
    super.initState();
    print('mehdit   -----$cameras[0]');
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    TextEditingController place = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Add new places')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Title', labelText: 'Place'),
                controller: place,
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 5,
                          ),
                          image:  DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  captureImage)))),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: ElevatedButton(
                            onPressed: () async {
                              try {
                                XFile captureImage1 = await controller.takePicture();
                                
                                print('mehdi ------>     ${captureImage1.path}');
                                setState(() {
                                 

                                });
                              } catch (e) {
                                print('error occured');
                              }
                            },
                            child: const Text(' Capture Image'))),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(listprovider.notifier).add(place.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Add place'))
            ],
          ),
        ),
      ),
    );
  }
}
