abstract class TimeStates{}
class UpdateTime extends TimeStates{
  String hour;
   String min;
  final String state;
  UpdateTime(this.hour, this.min, this.state){
   if(hour.length<2){
     hour='0$hour';
   }
   if(min.length<2){
     min='0$min';
   }
  }
}