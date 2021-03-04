import 'package:airframes_aggregation_server/common.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

class Leaderboards {
  Future<Leaderboard> findOrCreateLeaderboard(date) async {
    var query = new LeaderboardQuery();
    query.where..date.equals(date);
    var leaderboard = await query.getOne(executor);

    if (leaderboard != null && leaderboard.id != null) {
      this.logger.debug('Retrieved leaderboard (id: ${leaderboard.id})');
      return leaderboard;
    }
  }
}
