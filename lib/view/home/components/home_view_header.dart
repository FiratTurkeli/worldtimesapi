part of home_screen;

class HomeViewHeader extends StatefulWidget {
  const HomeViewHeader({Key? key}) : super(key: key);

  @override
  State<HomeViewHeader> createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<HomeViewHeader> {
  late double appBarHeight;
  late double searchBarHeight;
  late double searchBarWidth;
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    appBarHeight = Dimensions().getScreenHeight(context)*(199/812);
    searchBarHeight = Dimensions().getScreenHeight(context)*(44/812);
    searchBarWidth = Dimensions().getScreenWidth(context)*(309/44);
    screenHeight = Dimensions().getScreenHeight(context);
    screenWidth = Dimensions().getScreenWidth(context);
    return SizedBox(
      height: appBarHeight + searchBarHeight/2,  // 199 + 22 (half of search bar because of search bar location)
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.antiAlias,
        children: [
          buildAppBarContainer(),
          buildGoodMorningMessage(),
          buildLocalTime(),
          buildCurrentDate(),
          buildThemeButton(context),
          buildSearchBar()
        ],
      ),
    );
  }

  Widget buildAppBarContainer(){
    return  Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32))),
      height: appBarHeight, // <--- app bar height in mobile view
    );
  }


  //good morning message in figma file
  Widget buildGoodMorningMessage() {
    return Positioned(
        left: screenWidth*(33/375),
        top: appBarHeight*(69/199),
        bottom: appBarHeight*(112/199),
        right: screenWidth*(212/375),
        child: Text("Günaydın, Özgür", style: gmStyle,)
    );
  }

  //local time in figma file
  Widget buildLocalTime() {
    var date = DateTime.now();
    var currentHour= DateFormat('hh : mm ').format(date);
    return Positioned(
        top: appBarHeight*(92/199),
        bottom: appBarHeight*(68/199),
        left: screenWidth*(33/375),
        right: screenWidth*(236/375),
        child: Text(currentHour.toString(), style: timeStyle,
        )
    );
  }

  //local time in figma file
  Widget buildCurrentDate() {
    var date = DateTime.now();
    var currentDate = DateFormat.yMMMMEEEEd('tr').format(date);
    String day = currentDate.toString().split(" ")[0];
    String month = currentDate.toString().split(" ")[1];
    String year = currentDate.toString().split(" ")[3];
    return Positioned(
        top: appBarHeight*(136/199),
        bottom: appBarHeight*(45/199),
        left: screenWidth*(33/375),
        child: Text("$day $month, $year", style: dateStyle
        )
    );
  }

  // search bar in figma file
  Widget buildSearchBar() {
    return Positioned(
      top: appBarHeight-searchBarHeight/2,
      right: screenWidth*(33/375),
      left: screenWidth*(33/375),
      child: Container(
          width: searchBarWidth,
          height: searchBarHeight,
          decoration: BoxDecoration(
              color: white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: myStrokeBlue, width: 1)
          ),
          child: buildSearchIcon()
      ),
    );
  }

  //search icon on search bar
  Widget buildSearchIcon(){
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(Icons.search, color: Colors.grey,),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Text("Arama", style: TextStyle(color: Colors.grey),),
        ),
      ],
    );
  }



  // theme changer button in figma file
  Widget buildThemeButton(BuildContext context){
    final themeProvider = Provider.of<ThemeModeProvider>(context, listen: false);
    return Positioned(
      right: screenWidth*(33/375),
      top: appBarHeight*(96/199),
      //bottom: screenHeight*(63/199),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        key: Key(Theme.of(context).brightness.toString()),
        child: InkWell(
                onTap: (){
                  themeProvider.toggleTheme(Theme.of(context).scaffoldBackgroundColor == myDarkBlue ? false : true);
                  print("theme changed");
                  setState((){

                  });
                },
                child: Container(
                        width: screenWidth*(41/375),
                        height: appBarHeight*(40/199),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor == myDarkBlue ? white : myDarkBlue,
                            border: Border.all(color: myStrokeBlue, width: 2),
                            shape: BoxShape.circle,
                        ),
                    child: Theme.of(context).scaffoldBackgroundColor == myDarkBlue ?
                    Icon(Icons.wb_sunny_outlined, color: Theme.of(context).cardColor,)
                        :Icon(Icons.nightlight_outlined, color: Theme.of(context).cardColor,)
                    ),
              ),
      ),
    );
  }

}