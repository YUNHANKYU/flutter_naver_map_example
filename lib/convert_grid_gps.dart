// import 'dart:math' as math;
// import 'dart:core';

// final int TO_GRID = 0;
// final int TO_GPS = 1;

// class LatXLngY {
//   double? lat;
//   double? lng;

//   num? x;
//   num? y;

//   LatXLngY({this.lat, this.lng, this.x, this.y});
// }

// LatXLngY convertGridGPS(int mode, num lat_X, num lng_Y) {
//   double RE = 6371.00877;

//   /// 지구 반경(km)
//   double GRID = 5.0;

//   /// 격자 간격(km)
//   double SLAT1 = 30.0;

//   /// 투영 위도1(degree)
//   double SLAT2 = 60.0;

//   /// 투영 위도2(degree)
//   double OLON = 126.0;

//   /// 기준점 경도(degree)
//   double OLAT = 38.0;

//   /// 기준점 위도(degree)
//   double XO = 43;

//   /// 기준점 X좌표(GRID)
//   double YO = 136;

//   /// 기1준점 Y좌표(GRID)

//   ///
//   /// LCC DFS 좌표변환 ( code : "TO_GRID"(위경도->좌표, lat_X:위도,  lng_Y:경도), "TO_GPS"(좌표->위경도,  lat_X:x, lng_Y:y) )
//   ///

//   double DEGRAD = math.pi / 180.0;
//   double RADDEG = 180.0 / math.pi;

//   double re = RE / GRID;
//   double slat1 = SLAT1 * DEGRAD;
//   double slat2 = SLAT2 * DEGRAD;
//   double olon = OLON * DEGRAD;
//   double olat = OLAT * DEGRAD;

//   double sn = math.tan(math.pi * 0.25 + slat2 * 0.5) /
//       math.tan(math.pi * 0.25 + slat1 * 0.5);
//   sn = math.log(math.cos(slat1) / math.cos(slat2)) / math.log(sn);
//   double sf = math.tan(math.pi * 0.25 + slat1 * 0.5);
//   sf = math.pow(sf, sn) * math.cos(slat1) / sn;
//   double ro = math.tan(math.pi * 0.25 + olat * 0.5);
//   ro = re * sf / math.pow(ro, sn);
//   LatXLngY rs = LatXLngY();

//   if (mode == TO_GRID) {
//     rs.lat = lat_X as double;
//     rs.lng = lng_Y as double;
//     double ra = math.tan(math.pi * 0.25 + (lat_X) * DEGRAD * 0.5);
//     ra = re * sf / math.pow(ra, sn);
//     double theta = lng_Y * DEGRAD - olon;
//     if (theta > math.pi) theta -= 2.0 * math.pi;
//     if (theta < -math.pi) theta += 2.0 * math.pi;
//     theta *= sn;
//     rs.x = (ra * math.sin(theta) + XO + 0.5).floor();
//     rs.y = (ro - ra * math.cos(theta) + YO + 0.5).floor();
//   } else {
//     rs.x = lat_X;
//     rs.y = lng_Y;
//     double xn = lat_X - XO;
//     double yn = ro - lng_Y + YO;
//     double ra = math.sqrt(xn * xn + yn * yn);
//     if (sn < 0.0) {
//       ra = -ra;
//     }
//     double alat = math.pow((re * sf / ra), (1.0 / sn)) as double;
//     alat = 2.0 * math.atan(alat) - math.pi * 0.5;

//     double theta = 0.0;
//     if (xn.abs() <= 0.0) {
//       theta = 0.0;
//     } else {
//       if (yn.abs() <= 0.0) {
//         theta = math.pi * 0.5;
//         if (xn < 0.0) {
//           theta = -theta;
//         }
//       } else {
//         theta = math.atan2(xn, yn);
//       }
//     }
//     double alon = theta / sn + olon;
//     rs.lat = alat * RADDEG;
//     rs.lng = alon * RADDEG;
//   }
//   return rs;
// }
