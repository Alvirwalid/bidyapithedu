class ApprovalStatus {
  final int id;
  final String name;

  ApprovalStatus(this.id, this.name);
}

class ApprovalStatusService {
  final int SUBMIT = 1;
  final int FORWARD = 2;
  final int BACK = 3;
  final int APPROVED = 4;
  final int REJECT = 5;
  String SUBMIT_NAME = 'Submit';
  String FORWARD_NAME = 'Forward';
  String BACK_NAME = 'Back';
  String APPROVED_NAME = 'Approved';
  String REJECT_NAME = 'Reject';

  List<ApprovalStatus> getList() {
    List<ApprovalStatus> list = [];
    list.add(ApprovalStatus(SUBMIT,SUBMIT_NAME));
    list.add(ApprovalStatus(FORWARD, FORWARD_NAME));
    list.add(ApprovalStatus(BACK, BACK_NAME));
    list.add(ApprovalStatus(APPROVED,APPROVED_NAME));
    list.add(ApprovalStatus(REJECT, REJECT_NAME));
    return list;
  }
}