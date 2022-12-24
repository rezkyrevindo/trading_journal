import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_enum.dart';
import '../../../../widgets/text.dart';

class PersyaratanView extends StatefulWidget {
  final String persyaratan;
  const PersyaratanView({
    super.key,
    required this.persyaratan,
  });

  @override
  State<PersyaratanView> createState() => _PersyaratanViewState();
}

class _PersyaratanViewState extends State<PersyaratanView> {
  bool isExpanded = false;
  @override
  void initState() {
    setState(() {
      isExpanded = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: ColorsCustom.greyMudaColor,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                if (isExpanded) {
                  setState(() {
                    isExpanded = false;
                  });
                } else {
                  setState(() {
                    isExpanded = true;
                  });
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextCustom(
                    text: "Persyaratan (Click Here)",
                    type: TextEnum.HEADLINE6,
                  ),
                  Icon(
                    isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Html(
                shrinkWrap: true,
                data: widget.persyaratan,
              ),
            )
          ]
        ],
      ),
    );
  }
}
