import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:military_mobility_platform_frontend/model/mileage.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/model/reservation.dart';
import 'package:military_mobility_platform_frontend/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "http://20.214.203.20:8000")
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;

  @POST('/user/login')
  Future<LoginResDTO> login(@Body() LoginReqDTO dto);

  @POST('/user/register')
  Future<RegisterResDTO> register(@Body() RegisterReqDTO dto);

  @POST('/tms/get_available_car')
  Future<GetAvailableMobilitiesResDTO> getAvailableMobilities(
      @Body() GetAvailableMobilitiesReqDTO dto);

  @GET('/tms/reservation')
  Future<GetReservationsResDTO> getReservations();

  @POST('/tms/reservation')
  Future<MakeReservationResDTO> makeReservation(
      @Body() MakeReservationReqDTO dto);

  @DELETE('/tms/reservation')
  Future<void> deleteReservation(@Query('reservation_id') int reservationID);

  @POST('/mileage/history')
  Future<HistoryDTO> makeHistory(@Body() MakeHistoryReqDTO dto);

  @GET('/mileage/history')
  Future<GetHistoriesResDTO> getHistories();
}
