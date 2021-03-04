import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'leaderboard_rank.g.dart';

@serializable
@Orm(generateMigrations: false)
abstract class _LeaderboardRank extends Model {
  int get leaderboardId;
  int get stationId;
  int get points;
  int get ranking;
  int get airframeAllTimeCount;
  int get airframeThisMonthCount;
  int get airframeLast24HoursCount;
  int get flightAllTimeCount;
  int get flightThisMonthCount;
  int get flightLast24HoursCount;
  int get messageAllTimeCount;
  int get messageThisMonthCount;
  int get messageLast24HoursCount;
}
