part of second_screen;

class SecondViewBody extends StatefulWidget {
   WorldTime? worldTime;

  SecondViewBody({Key? key, required this.worldTime,}) : super(key: key);

  @override
  State<SecondViewBody> createState() => _SecondViewBodyState();
}

class _SecondViewBodyState extends State<SecondViewBody> {

  //method to configure the numbers according to the format shown in the figma
  String checkNum(int x){
    return x<10?"0${x}":x.toString();
  }
  late double screenWidth;
  late double screenHeight;
  late double containerWidth;
  late double containerHeight;



  @override
  Widget build(BuildContext context) {
    screenHeight = Dimensions().getScreenHeight(context);
    screenWidth = Dimensions().getScreenWidth(context);
    containerHeight = Dimensions().getScreenHeight(context)*(140/812); // The proportions of the dimensions given in the figma file
    containerWidth =  Dimensions().getScreenWidth(context)*(140/375); // The proportions of the dimensions given in the figma file
    return Stack(
      clipBehavior: Clip.none,
      children: [
        buildBodyBackground(),
        buildHourContainer(),
        buildPoint1(),
        buildPoint2(),
        buildMinuteContainer(),
        buildCountryInfo(),
        buildGmtInfo(),
      ],
    );
  }

  //Second view body background
  Widget buildBodyBackground(){
    return Container(
        height: screenHeight*(701/812), // The proportions of the dimensions given in the figma file
    width: screenWidth,
    color: Theme.of(context).scaffoldBackgroundColor,);
  }

  //container showing the hour
  Widget buildHourContainer(){
    final line = widget.worldTime?.utcDatetime.toString();
    DateTime x = DateTime.parse(line!);
    return Positioned(
        left: screenWidth*(33/375), // The proportions of the dimensions given in the figma file
        right: screenWidth*(202/375), // The proportions of the dimensions given in the figma file
        top: screenHeight*(161/812), // The proportions of the dimensions given in the figma file
       // bottom: screenHeight*(511/701),
      child: Container(
            width: containerWidth,
            height: containerHeight,
             decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: myDarkBlue, width: 2)
            ),
            child: Center(
              child: Text(checkNum(x.hour) ?? "xx", style: bigTimeStyle.copyWith(color: Theme.of(context).canvasColor),
              ),
            ),
          ),
    );
  }


  //container showing the minute
  Widget buildMinuteContainer(){
    final line = widget.worldTime?.utcDatetime.toString();
    DateTime x = DateTime.parse(line!);
    return Positioned(
        left: screenWidth*(202/375), // The proportions of the dimensions given in the figma file
        right: screenWidth*(33/375), // The proportions of the dimensions given in the figma file
        top: screenHeight*(161/812), // The proportions of the dimensions given in the figma file
        //bottom: screenHeight*(511/701),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: myDarkBlue, width: 2)
        ),
        child: Center(child: Text(checkNum(x.minute) ?? "xx" , style: bigTimeStyle.copyWith(color: Theme.of(context).canvasColor),)),
      ),
    );

  }


  // points between minutes and hours
  Widget buildPoint1(){
    return Positioned(
        top: screenHeight*(216/812), // The proportions of the dimensions given in the figma file
        //bottom: screenHeight*(587/701),
        right: screenWidth*(183/375), // The proportions of the dimensions given in the figma file
        left: screenWidth*(183/375), // The proportions of the dimensions given in the figma file
      child: Container(
        width: screenWidth*(9/375), // The proportions of the dimensions given in the figma file
        height: screenHeight*(9/375), // The proportions of the dimensions given in the figma file
        decoration: BoxDecoration(
          shape: BoxShape.circle,
            color: Theme.of(context).canvasColor
        ),
      ),
    );
  }

  //points between minutes and hours
  Widget buildPoint2(){
    return Positioned(
        top: screenHeight*(241/812), // The proportions of the dimensions given in the figma file
        //bottom: screenHeight*(562/701),
        right: screenWidth*(183/375), // The proportions of the dimensions given in the figma file
        left: screenWidth*(183/375), // The proportions of the dimensions given in the figma file
      child: Container(
        width: screenWidth*(9/375), // The proportions of the dimensions given in the figma file
        height: screenHeight*(9/375), // The proportions of the dimensions given in the figma file
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).canvasColor
        ),

      ),
    );
  }


  // country info shown in figma file
  Widget buildCountryInfo(){
    //get timezone
    String timezone =  widget.worldTime!.timezone.toString();
    // split timezone of country
    String country = timezone.characters.contains("/") == false  ? timezone : widget.worldTime!.timezone.toString().split("/")[1];
    // split timezone of continent
    String continent = timezone.characters.contains("/") == false  ? timezone :widget.worldTime!.timezone.toString().split("/")[0];
    return Positioned(
      top: screenHeight*(329/812), // The proportions of the dimensions given in the figma file
      //bottom: screenHeight*(418/701),
      right: screenWidth*(139/375), // The proportions of the dimensions given in the figma file
      left: screenWidth*(140/375), // The proportions of the dimensions given in the figma file
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text(country, style: countryStyle, overflow: TextOverflow.ellipsis, ),
           Text( continent, style: continentStyle, overflow: TextOverflow.ellipsis,)
         ],
       ),
    );
  }


  //gmt info shown in figma file
  Widget buildGmtInfo(){
    // utcDateTime for parsing
    final utcDateTime = widget.worldTime?.utcDatetime.toString();
    // converting to Datetime
    DateTime parsedDate = DateTime.parse(utcDateTime!);
    //format and break up to parsedDate
    var date = DateFormat.yMMMMEEEEd('tr').format(parsedDate);
    // day of date
    String day = date.toString().split(" ")[3];
    // month of date
    String month = date.toString().split(" ")[1];
    return Positioned(
      top: screenHeight*(404/812), // The proportions of the dimensions given in the figma file
      //bottom: screenHeight*(381/701),
      right: screenWidth*(82/375), // The proportions of the dimensions given in the figma file
      left: screenWidth*(82/375), // The proportions of the dimensions given in the figma file
      child: Container(
        child: Center(
          child: Column(
            children: [
              Text("${day}, GMT ${widget.worldTime?.utcOffset.toString()}", style: gmtStyle,),
              Text("${month} ${parsedDate.day}, ${parsedDate.year}", style: gmtStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
