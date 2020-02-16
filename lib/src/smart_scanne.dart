import 'dart:async';
import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recycle_app/src/scanner.dart';

enum AnimationToPlay {
  Activate,
  Deactivate,
  CameraTapped,
  ImageTapped,
}

class SmartFlareAnimation extends StatefulWidget {
  @override
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  static const AnimationWi = 200.0;
  static const AnimationHe = 200.0;
  AnimationToPlay _lastPlay;
  final FlareControls animationControl = FlareControls();
  bool isopen = false;
  File _image;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
    if (image != null) {
      print(image.path);
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Scanner(image: image)));
    }
  }

  Future openGallery() async {
    var image1 = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image1;
      Scanner(image: image1);
    });
    if (image1 != null) {
      print(image1.path);
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Scanner(
                    image: image1,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWi,
      height: AnimationHe,
      child: GestureDetector(
        onTapUp: (tapInfo) {
          var localTouchPosition = (context.findRenderObject() as RenderBox)
              .globalToLocal(tapInfo.globalPosition);
          var topHalfTouched = localTouchPosition.dy < AnimationHe / 2;
          var leftTouched = localTouchPosition.dx < AnimationWi / 2;
          var rightTouched = localTouchPosition.dx > AnimationWi / 2;

          if (leftTouched && topHalfTouched) {
            _setAnimationToPlay(AnimationToPlay.ImageTapped);
            print("Camera Tapeed");
            openCamera();
          } else if (rightTouched && topHalfTouched) {
            _setAnimationToPlay(AnimationToPlay.ImageTapped);
            openGallery();
          } else {
            if (isopen) {
              _setAnimationToPlay(AnimationToPlay.Deactivate);
            } else {
              _setAnimationToPlay(AnimationToPlay.Activate);
            }
            setState(() {
              isopen = !isopen;
            });
          }
        },
        child: FlareActor(
          'assets/button-animation.flr',
          controller: animationControl,
          animation: 'deactivate',
        ),
      ),
    );
  }

  void _setAnimationToPlay(AnimationToPlay imageTapped) {
    var isTappedAnimation = _getAnimationName(imageTapped).contains("_tapped");
    if (isTappedAnimation && _lastPlay == AnimationToPlay.Deactivate) {
      return;
    }
    animationControl.play(_getAnimationName(imageTapped));
    _lastPlay = imageTapped;
  }

  String _getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Activate:
        return 'activate';
      case AnimationToPlay.Deactivate:
        return 'deactivate';
      case AnimationToPlay.CameraTapped:
        return 'camera_tapped';
      case AnimationToPlay.ImageTapped:
        return 'image_tapped';
      default:
        return 'deactivate';
    }
  }
}
