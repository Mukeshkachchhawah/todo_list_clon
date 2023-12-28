import 'package:flutter/material.dart';
import 'package:task/util/colors.dart';

/// status leding color
Color colorByStatus(int status) {
  switch (status) {
    case 1:
      return pendingColor;
    case 2:
      return ongoingColor;
    case 3:
      return completedColor;
    default:
      return completedColor;
  }
}

/// status button task completed and ongoing and pending color

Color colorByStatusButton(int status) {
  switch (status) {
    case 1:
      return textColor3;
    case 2:
      return textColor2;
    case 3:
      return textColor1;
    default:
      return completedColor;
  }
}

Color colorbgColor(int status) {
  switch (status) {
    case 1:
      return textColors3;
    case 2:
      return textColors2;
    case 3:
      return textColors1;
    default:
      return completedColor;
  }
}

/// profile bg color and icon color


Color ProfilebgColor(int status) {
  switch (status) {
    case 1:
      return bgColorBox4;
    case 2:
      return bgColorBox3;
    case 3:
      return bgColorBox2;
       case 3:
      return bgColorBox1;
    default:
      return completedColor;
  }
}