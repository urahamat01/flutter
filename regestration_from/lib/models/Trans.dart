class Trans{
  int id;
  int transDate;
  String transName;
  String transType;
  int amount;

  Trans(this.id, this.transDate, this.transName, this.transType, this.amount);

  Map<String, dynamic> toMap() {

    return{
      'id':id,
      'date':transDate,
      'name':transName,
      'type':transType,
      'amount':amount
    };

}
String toSring(){
    return 'Trans{$id, transName: $transName, amount:$amount}';
}





}
