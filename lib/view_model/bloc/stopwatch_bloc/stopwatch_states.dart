abstract class StopwatchStates{}

class StartSate extends StopwatchStates{
  bool isStarted=true;
  final String hour;
  final String min;
  final String sec;
  StartSate(this.hour,this.min,this.sec);
}

class PauseSate extends StopwatchStates{
  bool isStarted=false;
  final String hour;
  final String min;
  final String sec;
  PauseSate(this.hour,this.min,this.sec);
}

class StopSate extends StopwatchStates{
  bool isStarted=false;
  final String hour;
  final String min;
  final String sec;
  StopSate(this.hour,this.min,this.sec);
}

