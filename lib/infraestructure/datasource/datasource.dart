library infraestructure.datasource;

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/infraestructure/datasource/global_datasource_impl.dart';

import '../../config/helpers/helpers.dart';
import '../../domain/domain.dart';
import '../errors/errors.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';

part 'characters_datasource_impl.dart';
part 'episode_datasource_impl.dart';
part 'location_datasource_impl.dart';
