import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_flutter/models/category_model.dart';

// minuto 12:42
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          SizedBox(
            height: 40,
          ),
          _categoriesSection(categories: categories)
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(26, 156, 93, 96),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Buscar recetas',
            hintStyle:
                TextStyle(color: Color.fromARGB(130, 37, 15, 64), fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(11),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icons/Filter.svg'),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Recetario',
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(12)),
            child: SvgPicture.asset(
              'assets/icons/Arrow - Left 2.svg',
              height: 22,
              width: 22,
            )),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 38,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12)),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 6,
                width: 6,
              )),
        ),
      ],
    );
  }
}

class _categoriesSection extends StatelessWidget {
  const _categoriesSection({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Categorias',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: 15,
              right: 15
            ),
            separatorBuilder: (context, index) => SizedBox(width: 20,),
            itemBuilder: (context, index) {
            return Container(
              width: 120,
              decoration: BoxDecoration(
                color: categories[index].boxColor.withValues(),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SvgPicture.asset(categories[index].iconPath),
                    ),
                  ),
                  Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
              ],)
            );
          }),
        )
      ],
    );
  }
}
