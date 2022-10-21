part of second_screen;

class SecondViewBody extends StatefulWidget {
   WorldTime? worldTime;

  SecondViewBody({Key? key, required this.worldTime,}) : super(key: key);

  @override
  State<SecondViewBody> createState() => _SecondViewBodyState();
}

class _SecondViewBodyState extends State<SecondViewBody> {

  String checkNum(int x){
    return x<10?"0${x}":x.toString();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.only(top: 50),
      height: 450,
      child: Stack(
        children: [
          buildHourContainer(),
          buildPoints(),
          buildMinuteContainer(),
          buildCountryInfo(),
          buildGmtInfo(),
        ],
      ),
    );
  }



  Widget buildHourContainer(){
    final line = widget.worldTime?.utcDatetime.toString();
    DateTime x = DateTime.parse(line!);
    return Positioned(
        left: 45,
        child: buildTimeContainer(checkNum(x.hour) ?? "xx")
    );
  }


  Widget buildMinuteContainer(){
    final line = widget.worldTime?.utcDatetime.toString();
    DateTime x = DateTime.parse(line!);
    return Positioned(
        right: 45,
        child: buildTimeContainer(checkNum(x.minute) ?? "xx")
    );
  }


  Widget buildPoints(){
    return Center(
        heightFactor: 1.3,
        child: Text(":", style: bigTimeStyle.copyWith(color: Theme.of(context).canvasColor), textAlign: TextAlign.center,));
  }

  Widget buildTimeContainer(String data){
    return  Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(14),
        border: Border.all(color: myDarkBlue, width: 2)
      ),
      child: Center(child: Text(data , style: bigTimeStyle.copyWith(color: Theme.of(context).canvasColor),),),
    );
  }



  Widget buildCountryInfo(){
    String line =  widget.worldTime!.timezone.toString();
    String country = line.characters.contains("/") == false  ? line : widget.worldTime!.timezone.toString().split("/")[1];
    String kita = line.characters.contains("/") == false  ? line :widget.worldTime!.timezone.toString().split("/")[0];

    return Container(
      margin: EdgeInsets.only(top: 168),
      child: Center(
        child: Column(
          children: [
            Text(country, style: countryStyle,),
            Text( kita, style: continentStyle,)
          ],
        ),
      ),
    );
  }


  Widget buildGmtInfo(){
    return Container(
      margin: EdgeInsets.only(top: 243),
      child: Center(
        child: Column(
          children: [
            Text(", GMT ${widget.worldTime?.utcOffset.toString()}", style: gmtStyle,),
            Text("", style: gmtStyle,)
          ],
        ),
      ),
    );
  }
}
