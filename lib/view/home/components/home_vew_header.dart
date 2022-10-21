part of home_screen;

class HomeViewHeader extends StatefulWidget {
  const HomeViewHeader({Key? key}) : super(key: key);

  @override
  State<HomeViewHeader> createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<HomeViewHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 221, // 199 + 22 (half of search bar)
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32))),
            height: 199, // <--- app bar height in mobile view
            child: Stack(
              children: [
                goodMorningMessage(),
                localTime(),
                currentDate(),
                themeChangerButton(context),
              ],
            ),
          ),
          searchBar()

        ],
      ),
    );
  }


  Widget goodMorningMessage() {
    return Positioned(
        left: 33,
        top: 69,
        bottom: 112,
        child: Text("Günaydın, Özgür", style: gmStyle,)
    );
  }

  Widget localTime() {
    return Positioned(
        top: 92,
        bottom: 69,
        left: 112,
        child: Text('', style: timeStyle,
        )
    );
  }

  Widget currentDate() {
    var date = DateTime.now();
    return Positioned(
        top: 136,
        bottom: 45,
        left: 33,
        child: Text('', style: dateStyle
        )
    );
  }

  Widget searchBar() {
    return Positioned(
      top: 177,
      right: 33,
      left: 33,
      child: Padding(
        padding: const  EdgeInsets.only(bottom: 10),
        child: Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
                color: white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(99),
                border: Border.all(color: strokeblue, width: 1)
            ),
            child: searchIcon()
        ),
      ),
    );
  }

  Widget searchIcon(){
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
  Widget themeChangerButton(BuildContext context){
    final themeProvider = Provider.of<ThemeModeProvider>(context, listen: false);
    return Positioned(
      right:33,
      top: 63,
      bottom: 96,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        key: Key(Theme.of(context).brightness.toString()),
        child: GestureDetector(
                onTap: (){
                  themeProvider.toggleTheme(Theme.of(context).scaffoldBackgroundColor == dark ? false : true);
                  print("theme changed");
                  setState((){

                  });
                },
                child: Container(
                        key: Key(Theme.of(context).brightness.toString()),
                        width: 41,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).textTheme.bodyText2?.color,
                            border: Border.all(color: strokeblue, width: 2),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: Theme.of(context).scaffoldBackgroundColor == dark ?
                        Icon(Icons.wb_sunny_outlined, color: Theme.of(context).cardColor,)
                            :Icon(Icons.nightlight_outlined, color: Theme.of(context).cardColor,)
                    ),
              )

        ),
      );
}
}