import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: const [
          FadeInImage(
            placeholder: AssetImage('assets/img.png'),
            image: AssetImage('assets/img.png'),
          ),
          _TitleSubtitleStar(),
          _ButtonsCallRouteShare(),
          _Paragraph()
        ],
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: const Text(
        'Do consectetur exercitation proident labore fugiat officia officia exercitation aute. Deserunt consectetur culpa in culpa sint ipsum adipisicing dolor duis ut. Duis adipisicing reprehenderit adipisicing eu elit magna consectetur sunt consectetur adipisicing magna. Reprehenderit consequat et nulla culpa. Anim velit voluptate eiusmod laboris dolore laborum ipsum.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _ButtonsCallRouteShare extends StatelessWidget {
  const _ButtonsCallRouteShare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(
                Icons.phone,
                color: Colors.blue[500],
                size: 25,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'CALL',
                style: TextStyle(color: Colors.blue[400]),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.directions_rounded,
                color: Colors.blue[500],
                size: 25,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'ROUTE',
                style: TextStyle(color: Colors.blue[400]),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.share,
                color: Colors.blue[500],
                size: 25,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'SHARE',
                style: TextStyle(color: Colors.blue[400]),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _TitleSubtitleStar extends StatelessWidget {
  const _TitleSubtitleStar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Kandersteg, Switerland',
                style: TextStyle(fontSize: 14, color: Colors.black38),
                textAlign: TextAlign.left,
              )
            ],
          ),
          const SizedBox(
            width: 90,
          ),
          const Icon(
            Icons.star_sharp,
            color: Colors.red,
          ),
          const Text('41')
        ],
      ),
    );
  }
}
