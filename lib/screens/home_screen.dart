import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtypet/models/doctor_model.dart';
import 'package:healtypet/models/service_model.dart';

const services = ['Vaccine', 'Surgery', 'SPA & Treatment', 'Consultation'];
const selected = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 22),
          const Greeting(),
          const SizedBox(height: 17),
          const Card(),
          const SizedBox(height: 21),
          const Search(),
          const SizedBox(height: 21),
          const Services(),
          const SizedBox(height: 27),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(21),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 11,
                  ),
              itemCount: doctors.length)
        ],
      )),
    );
  }
}

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: selected == index
                        ? const Color(0xff818AF9)
                        : const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(10),
                    border: selected == index
                        ? Border.all(color: const Color(0xffF1E5E5))
                        : null),
                child: Center(
                    child: Text(
                  Service.all()[index],
                  style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: selected == index ? Colors.white : Colors.grey),
                )),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: Service.all().length),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
          color: const Color(0xffEBEBEB),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              FeatherIcons.search,
              color: Color(0xffADACAD),
            ),
            hintText: "Find best vaccinate, treatment...",
            hintStyle: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xffCACACA),
                height: 150 / 100)),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xff818af9)),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_card.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Your ",
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: const Color(0xffDEE1FE),
                              height: 150 / 100),
                          children: const [
                        TextSpan(
                            text: 'Catrine',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        TextSpan(text: " will get \n vacinnation"),
                        TextSpan(
                            text: 'tomorrow \n at 07.00 am!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                      ])),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                            color: Colors.white.withOpacity(.12), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "See Detail",
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Human!",
            style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xff3f3f3f)),
          ),
          Stack(children: [
            const IconButton(
                onPressed: null,
                icon: Icon(
                  FeatherIcons.shoppingBag,
                  color: Color(0xff818af9),
                )),
            Positioned(
              right: 8,
              top: 4,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: const Color(0xffef6497),
                    borderRadius: BorderRadius.circular(15 / 2)),
                child: const Center(
                    child: Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 10),
                )),
              ),
            )
          ])
        ],
      ),
    );
  }
}
