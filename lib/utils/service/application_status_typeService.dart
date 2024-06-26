class ApplicationStatusType {
  final int id;
  final String name;
  final String banglaName;

  ApplicationStatusType(this.id, this.name, this.banglaName);
}
class ApplicationStatusTypeService {
  final int SUBMIT = 1;
  final int IN_REVIEW = 2;
  final int IN_PROCESS = 3;
  final int REJECT = 4;
  final int APPROVE = 5;
  final int CITIZEN_FEED_BACK = 6;
  final int APPLICATION_ROLL_BACK = 10;
  final int FORWARD = 11;

  List<ApplicationStatusType> getList() {
    List<ApplicationStatusType> list = [];
    list.add(ApplicationStatusType(SUBMIT, 'Submit', 'জমা'));
    list.add(ApplicationStatusType(IN_REVIEW, 'In Review', 'পর্যালোচনা'));
    list.add(ApplicationStatusType(IN_PROCESS, 'In Process', 'প্রক্রিয়াধীন'));
    list.add(ApplicationStatusType(REJECT, 'Reject', 'প্রত্যাখ্যান'));
    list.add(ApplicationStatusType(APPROVE, 'Approve', 'অনুমোদন'));
    list.add(ApplicationStatusType(CITIZEN_FEED_BACK, 'Citizen Feed Back', 'সিটিজেন ফিড ব্যাক'));
    list.add(ApplicationStatusType(APPLICATION_ROLL_BACK, 'Complain Roll Back', 'আবেদন রোল ব্যাক'));
    list.add(ApplicationStatusType(FORWARD, 'Forward', 'ফরওয়ার্ড'));
    return list;
  }
}