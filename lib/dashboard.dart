import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Simple Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 40,
              ),
            ),
          )
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white.withAlpha(
          200,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Rate Us",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "More Apps",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage("assets/images/banner.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildCard(
                            "Camera",
                            const Color.fromARGB(255, 223, 94, 85),
                            Icons.camera),
                        _buildCard(
                            "Gallery",
                            const Color.fromARGB(141, 133, 18, 228),
                            Icons.photo_library),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildCard(
                            "Templates",
                            const Color.fromARGB(255, 69, 232, 74),
                            Icons.theater_comedy),
                        _buildCard(
                            "Samples",
                            const Color.fromARGB(255, 99, 150, 238),
                            Icons.apps),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildCard("RateUS", Colors.indigo, Icons.star),
                        _buildCard("Settings", Colors.blueGrey, Icons.settings),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCard(String s, color, icon) {
    return Expanded(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 120,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.solid)
              ]),
          alignment: Alignment.center,
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  s,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
