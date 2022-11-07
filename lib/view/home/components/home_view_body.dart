part of home_screen;

class HomeViewBody extends StatefulWidget {
  List? worldTimes ;
  HomeViewBody({Key? key, required this.worldTimes,}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late double screenWidth;
  late double screenHeight;
  late double appBarHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = Dimensions().getScreenHeight(context);
    screenWidth = Dimensions().getScreenWidth(context);
    appBarHeight = Dimensions().getScreenHeight(context)*(199/812);
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * (241/812)),
      child: ListView.builder(
          controller: ScrollController(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.worldTimes?.length,
          itemBuilder: (context, index) {
          return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Second(
                  time: widget.worldTimes![index].toString(),

                )));
              },
              child: buildTimeZoneContainer(widget.worldTimes?[index]));
        }
      ),
    );

  }


  //time zone container
  Widget buildTimeZoneContainer(String timeZone){
    late double containerWidth = screenWidth*(309/375);
    late double containerHeight = screenHeight*(54/812);
    late double extraWidth = screenWidth*(31/375);
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight*(10/812) ,
        left: screenWidth*(33/375),
        right: screenWidth*(18/375),
      ),
      child: Stack(
        children: [
            Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor
            ),
            child: Container(
                margin:  EdgeInsets.only(  top: containerHeight * (18/54),
                    bottom: containerHeight * (18/54),
                    left: containerWidth * (20/309),),
                child: Text(timeZone.toString() , style: listStyle)),
            ),
          SizedBox(
            height: containerHeight,
            width: containerWidth + extraWidth,
          ),
          buildNextButton()
          ],
      ),
    );
  }

  // next button on Timezone container
  Widget buildNextButton(){
    late double containerHeight = screenHeight*(54/812);
    late double containerWidth = screenWidth*(309/375);
    late double extraWidth = screenWidth*(31/375);
    return Positioned(
      bottom: containerHeight*(11/54),
      top: containerHeight*(12/54),
      right: 0,
      child: Container(
        width: containerWidth*(31/309),
        height: containerHeight*(31/54),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3)
        ),
          child: Icon(Icons.arrow_forward_ios, color:Theme.of(context).textTheme.bodyText2!.color , size: 9.92,),
      ),
    );
  }
}
