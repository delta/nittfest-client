import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xff121222),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Expanded(
            flex: 3,
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintText: 'Search Events...'),
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
        Flexible(
            flex: 1,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                )))
      ]));
}
