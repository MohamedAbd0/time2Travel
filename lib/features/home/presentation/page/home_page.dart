import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/home/presentation/widget/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  int bottomNavigationBarItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //leading: const SizedBox(),
            backgroundColor: Palette.white,
            elevation: 0,
            title: const ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: CachedNetworkImageProvider(
                      "https://www.powertrafic.fr/wp-content/uploads/2023/04/image-ia-exemple.png"),
                ),
                title: Text("Welcome 👋"),
                subtitle: Text(
                  "Mohamed",
                  textScaleFactor: 1.3,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CardIcon(
                      icon: Icons.notifications_none_outlined,
                    ),
                    CardIcon(
                      icon: Icons.sort_outlined,
                    ),
                  ],
                ))),
        body: DefaultTabController(
          length: 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeaderWidget(
                  onTapChange: (index) {
                    setState(() => tabIndex = index);
                    log(index.toString());
                  },
                ),
                SpacerV(
                  value: Dimens.space16,
                ),
                if (tabIndex == 0) const FlightsTabSection(),
                if (tabIndex == 1) const HotelsTabSection(),
                if (tabIndex == 2) const CarTabSection(),
                SectionTitle(
                  title: "Limited Offers",
                  onTap: () {},
                ),
                SizedBox(
                  height: 330,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: OfferCard(),
                      );
                    },
                  ),
                ),
                SectionTitle(
                  title: "Best Places",
                  onTap: () {},
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlaceCard(
                          imageUrl:
                              "https://www.sayidaty.net/sites/default/files/styles/900_scale/public/29/12/2015/1451371396_4189995104.jpg",
                          rate: 4.9,
                          name: "Burj Khalifa",
                          price: 255,
                        ),
                      );
                    },
                  ),
                ),
                SectionTitle(
                  title: "Best Packages",
                  onTap: () {},
                ),
                SizedBox(
                  height: 310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          child: PackageCard(
                            imageUrl:
                                "https://cdn.britannica.com/86/170586-050-AB7FEFAE/Taj-Mahal-Agra-India.jpg",
                            rate: 4.9,
                            name: "Taj Mahel",
                            price: "1.500",
                            location: "Agra, India",
                            date: "4D/3N",
                            peopleCount: 5,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: Palette.gray,
            onTap: (value) {
              setState(() => bottomNavigationBarItemIndex = value);
            },
            items: <BottomNavigationBarItem>[
              custom(
                isSelected: bottomNavigationBarItemIndex == 0,
                label: "Home",
                icon: Icons.home,
              ),
              custom(
                isSelected: bottomNavigationBarItemIndex == 1,
                label: "Wallet",
                icon: Icons.wallet,
              ),
              custom(
                isSelected: bottomNavigationBarItemIndex == 2,
                label: "Offers",
                icon: Icons.local_offer,
              ),
              custom(
                isSelected: bottomNavigationBarItemIndex == 3,
                label: "Booking",
                icon: Icons.work,
              ),
            ]),
      )
    ;
  }

  BottomNavigationBarItem custom(
      {bool isSelected = false,
      required String label,
      required IconData icon}) {
    if (isSelected) {
      return BottomNavigationBarItem(
        icon: Card(
          color: Palette.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              icon,
              color: Palette.white,
              size: 25,
            ),
          ),
        ),
        label: '',
      );
    } else {
      return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: Palette.gray,
        ),
        label: label,
      );
    }
  }
}

class CardIcon extends StatelessWidget {
  final IconData icon;
  const CardIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Palette.primaryWithOpacity,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Icon(
          icon,
          color: Palette.primary,
        ),
      ),
    );
  }
}
