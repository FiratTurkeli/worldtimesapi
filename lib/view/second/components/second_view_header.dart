  part of second_screen;

class SecondViewHeader extends StatefulWidget{

  Color? theme;
  SecondViewHeader({Key? key,required this.theme}) : super(key: key);

  @override
  State<SecondViewHeader> createState() => _SecondViewHeaderState();


}

class _SecondViewHeaderState extends State<SecondViewHeader> {

  late double appBarHeight;
  late double screenWidth;
  late double screenHeight;


  @override
  Widget build(BuildContext context) {
    appBarHeight = Dimensions().getScreenHeight(context)*(111/812); // The proportions of the dimensions given in the figma file
    screenHeight = Dimensions().getScreenHeight(context);
    screenWidth = Dimensions().getScreenWidth(context);
    return  Stack(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.topCenter,
        children: [
          buildAppBarBackground(),
          buildPreviousPageButton(context),
          buildTitle()
        ],
    );
  }


  //appbar background
  Widget buildAppBarBackground(){
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
          width: screenWidth,
          height: appBarHeight,
          decoration:  BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(32)))
      ),
    );
  }




  // previous page button
  Widget buildPreviousPageButton(BuildContext contextt){
    return Positioned(
      top: screenHeight*(72/812), // The proportions of the dimensions given in the figma file
      bottom: screenHeight*(726/812), // The proportions of the dimensions given in the figma file
      left: screenWidth*(38/375), // The proportions of the dimensions given in the figma file
      right: screenWidth*(323/375), // The proportions of the dimensions given in the figma file
      child:  InkWell(
        customBorder: const CircleBorder(),
          onTap: (){
            Navigator.of(contextt).pop();
          },
          child: Icon(Icons.arrow_back_outlined, color: Theme.of(context).textTheme.bodyText2!.color,)),
      );
  }

  // title of app bar
  Widget buildTitle(){
    String color = widget.theme == myDarkBlue ? "dark" : "white" ;
    return Positioned(
        top: screenHeight*(71/812), // The proportions of the dimensions given in the figma file
        //bottom: screenHeight*(725/812),
        right: screenWidth*(113/375), // The proportions of the dimensions given in the figma file
        left: screenWidth*(113/375), // The proportions of the dimensions given in the figma file
        child: Image.asset("images/WORLDTIME${color.toString()}.png",
          width: screenWidth*(149/375), // The proportions of the dimensions given in the figma file
          height: appBarHeight*(16/111),// The proportions of the dimensions given in the figma file
        ) );
  }
}
