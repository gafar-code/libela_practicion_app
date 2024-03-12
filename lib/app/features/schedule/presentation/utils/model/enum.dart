enum ScheduleTab { all, coming, finished, rejected }

extension ScheduleTabExtension on ScheduleTab {
  String get name {
    switch (this) {
      case ScheduleTab.all:
        return 'Semua';
      case ScheduleTab.coming:
        return 'Mendatang';
      case ScheduleTab.finished:
        return 'Selesai';
      case ScheduleTab.rejected:
        return 'Ditolak';
      default:
        return '';
    }
  }

  String get filter {
    switch (this) {
      case ScheduleTab.all:
        return '';
      case ScheduleTab.coming:
        return 'assinged';
      case ScheduleTab.finished:
        return 'finish';
      case ScheduleTab.rejected:
        return 'cancel';
      default:
        return '';
    }
  }
}
