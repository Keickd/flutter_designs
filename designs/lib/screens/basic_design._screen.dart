import 'package:designs/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Text(
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
        children: const [
          CustomButton(icon: Icons.phone, name: 'CALL'),
          CustomButton(icon: Icons.map, name: 'ROUTE'),
          CustomButton(icon: Icons.share, name: 'SHARE'),
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
          Expanded(child: Container()),
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
