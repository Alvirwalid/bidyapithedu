class ComplainStatusType {
  final int id;
  final String name;
  final String banglaName;

  ComplainStatusType(this.id, this.name, this.banglaName);
}

class ComplainStatusTypeService {
  final int SUBMIT = 1;
  final int IN_REVIEW = 2;
  final int IN_PROCESS = 3;
  final int REJECT = 4;
  final int SOLVE = 5;
  final int CITIZEN_FEED_BACK = 6;
  final int COMPLAIN_ROLL_BACK = 10;
  final int FORWARD = 11;

  List<ComplainStatusType> getList() {
    List<ComplainStatusType> list = [];
    list.add(ComplainStatusType(SUBMIT, 'Submit', 'জমা'));
    list.add(ComplainStatusType(IN_REVIEW, 'In Review', 'পর্যালোচনা'));
    list.add(ComplainStatusType(IN_PROCESS, 'In Process', 'প্রক্রিয়াধীন'));
    list.add(ComplainStatusType(REJECT, 'Reject', 'প্রত্যাখ্যান'));
    list.add(ComplainStatusType(SOLVE, 'Solve', 'সমাধান'));
    list.add(ComplainStatusType(CITIZEN_FEED_BACK, 'Citizen Feed Back', 'সিটিজেন ফিড ব্যাক'));
    list.add(ComplainStatusType(COMPLAIN_ROLL_BACK, 'Complain Roll Back', 'অভিযোগ রোল ব্যাক'));
    list.add(ComplainStatusType(FORWARD, 'Forward', 'ফরওয়ার্ড'));
    return list;
  }
}