import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  final String hint;
  
  const SearchBox({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.only(left: 26.w),
      ),
      leading: const Icon(Icons.search),
      hintText: hint,
    );
  }
}
