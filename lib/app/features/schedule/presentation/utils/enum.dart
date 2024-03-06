enum ScheduleTab { all, coming, finished, rejected }

extension ScheduleTabExtension on ScheduleTab {
  String get name {
    switch (this) {
      case ScheduleTab.all:
        return 'Semua';
      case ScheduleTab.coming:
        return 'Akan Datang';
      case ScheduleTab.finished:
        return 'Selesai';
      case ScheduleTab.rejected:
        return 'Ditolak';
      default:
        return '';
    }
  }
}
