import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  const ExpandableText({super.key, required this.text, required this.maxLines});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: RichText(
          maxLines: _isExpanded ? 1000 : 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'Опис: ',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFffffff),
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFffffff),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
}
