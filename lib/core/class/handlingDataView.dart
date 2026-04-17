import 'package:app1/core/class/StatusRequest.dart';
import 'package:flutter/material.dart';

class handlingDataView extends StatelessWidget {

  final Statusrequest statusrequest;
  final Widget widget;
  const handlingDataView({super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 
    statusrequest == Statusrequest.loading ?
      Center(child: CircularProgressIndicator(),):
    statusrequest == Statusrequest.offlinefailure ?
      Center(child: Text("offlinefailure"),):
    statusrequest == Statusrequest.serverfailure ?
      Center(child: Text("serverfailure"),):
    statusrequest == Statusrequest.empty ?
      Center(child: Text("empty"),):
      statusrequest == Statusrequest.failure ?
      Center(child: Text("failure  no data"),):
      widget;
  }
}