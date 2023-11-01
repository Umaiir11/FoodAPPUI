import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/MVVM/ViewModel/Vm_Home.dart';

import '../Mode/ModCategories.dart';
import '../Mode/ModDiet.dart';
import '../Mode/ModPopuler.dart';

class Vw_Home extends StatefulWidget {
  const Vw_Home({super.key});

  @override
  State<Vw_Home> createState() => _Vw_HomeState();
}

class _Vw_HomeState extends State<Vw_Home> {
  VM_Home l_VM_Home = new VM_Home();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    l_VM_Home.getdata();
    l_VM_Home.getdiets();
    l_VM_Home.getPopulerdiets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Breakfast",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
            margin: EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 5,
                width: 5,
              ),
              margin: EdgeInsets.all(10),
              width: 37,
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: const Color(0xff1D1617).withOpacity(0.11), blurRadius: 40, spreadRadius: 0.0)
            ]),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/Search.svg'),
                  ),
                  suffixIcon: Container(
                    width: 100,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          VerticalDivider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.black54,
                            thickness: 0.1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset('assets/icons/Filter.svg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Category",
              style: TextStyle(fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 150,
            child: ListView.separated(
              itemCount: l_VM_Home.l_ListCategoryModel!.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => SizedBox(
                width: 25,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: l_VM_Home.l_ListCategoryModel![index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: SvgPicture.asset(l_VM_Home.l_ListCategoryModel![index].iconPath),
                      ),
                      Text(
                        l_VM_Home.l_ListCategoryModel![index].name,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Recomendations\nfor Diet",
                  style: TextStyle(fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 240,
                child: ListView.separated(
                  itemCount: l_VM_Home.l_DietModel!.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        color: l_VM_Home.l_DietModel![index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(l_VM_Home.l_DietModel![index].iconPath),
                          Text(
                            l_VM_Home.l_DietModel![index].name,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                          Text(
                            l_VM_Home.l_DietModel![index].level +
                                '|' +
                                l_VM_Home.l_DietModel![index].duration +
                                '|' +
                                l_VM_Home.l_DietModel![index].calorie,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xff9DCEFF), Color(0xff92A3FD)],
                                ),
                                borderRadius: BorderRadius.circular(50)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Popular',
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemCount: l_VM_Home.l_PopularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          l_VM_Home.l_PopularDiets[index].iconPath,
                          width: 65,
                          height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l_VM_Home.l_PopularDiets[index].name,
                              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                            ),
                            Text(
                              l_VM_Home.l_PopularDiets[index].level +
                                  ' | ' +
                                  l_VM_Home.l_PopularDiets[index].duration +
                                  ' | ' +
                                  l_VM_Home.l_PopularDiets[index].calorie,
                              style:
                                  const TextStyle(color: Color(0xff7B6F72), fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0)
                    ]),
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
