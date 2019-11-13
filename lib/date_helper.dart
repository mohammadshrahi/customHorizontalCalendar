
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

DateTime getCurrentDate(int index,int baseIndex,DateTime base)
{
  if(baseIndex==index)return base;
  if(index>baseIndex)return base.add(Duration(days: index-baseIndex));
  else return base.add(Duration(days: index-baseIndex));

}

double getGreedyWidth(BuildContext context,double width)
{
  if(width==double.infinity)
  {
    return MediaQuery.of(context).size.width;
  }
  else{
    return width;
  }
}
String getDay(DateTime dateTime,String local)
{
  DateFormat dateFormat = DateFormat('dd',local);
  return dateFormat.format(dateTime);
}
String getMounth(DateTime dateTime,String local){
    DateFormat dateFormat = DateFormat('MMN',local);
  return dateFormat.format(dateTime);
}
String getYear(DateTime dateTime,String local)
{
    DateFormat dateFormat = DateFormat('yyyy',local);
  return dateFormat.format(dateTime);

}
String getWeekDay(DateTime dateTime,String local){
  DateFormat dateFormat = DateFormat('ZZZ',local);
  return dateFormat.format(dateTime);

}