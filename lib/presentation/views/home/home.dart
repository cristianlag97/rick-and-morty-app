library presentation.views.home;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/config/config.dart';
import 'package:rick_and_morty_app/presentation/delegates/search_delegate.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';
import '../../widgets/bottom_sheet/bottom_sheet.dart';

part 'character_view.dart';
part 'episode_view.dart';
part 'location_view.dart';
