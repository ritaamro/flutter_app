import 'package:flutter/material.dart';

const kAccentColor = Color(0xFF26a69a);

const double kScreenContainerPadding = 16.0;

const TextStyle kFlatButtonWithBorderTextStyle = TextStyle(
  color: kAccentColor,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);

const kSelectedAccountBorderColor = kAccentColor;
const double kAccountAvatarRadius = 50.0;
const double kSelectedAccountAvatarRadius = 60.0;
const TextStyle kMainTitleTextStyle = TextStyle(
  fontSize: 26.0,
  fontWeight: FontWeight.bold,
);

const kAccentTextStyle = TextStyle(
  color: kAccentColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const TextStyle kSubtitleTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  color: Color(0xFF777777),
);

const double kCardElevation = 3.0;
const double kCardBorderRadius = 8.0;

const double kProgressStepperLineHeight = 8.0;
const Color kProgressStepperDefaultColor = Color(0xFFB8C7CB);
const Color kProgressStepperPercentageColor = Color(0xFF4caf50);
const double kProgressMilestoneRadius = 25.0;
const double kProgressLabelFontSize = 16.0;

const Map<String, IconData> kIcons = {
  "veveto Products": Icons.wb_sunny,
  "Symptoms": Icons.healing,
  "Nutrition": Icons.local_dining,
  "Medicines": Icons.local_hospital,
  "Events": Icons.event,
  "Other Notes": Icons.view_list
};

const Map<String, Color> kIconsBGColors = {
  "veveto Products": Color(0xFF43a047),
  "Symptoms": Color(0xFFd81b60),
  "Nutrition": Color(0xFF512da8),
  "Medicines": Color(0xFFffd54f),
  "Events": Color(0xFF1565c0),
  "Other Notes": Color(0xFF455a64)
};

const Icon kLoadMoreIcon = Icon(
  Icons.view_stream,
  size: 40.0,
  color: Color(0xFF777777),
);

const String kLoadMoreBtnText = 'Load More';
const TextStyle kLoadMoreBtnTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);
