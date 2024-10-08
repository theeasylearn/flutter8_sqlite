import 'package:flutter/material.dart';

void main() {
  runApp(ResponsiveDesign());
}
class ResponsiveDesign extends StatelessWidget {
  List<Map<String, String>> fruits = [
    {
      'name': 'Apple',
      'nutrition': '52 calories per 100g, high in fiber and Vitamin C',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg',
    },
    {
      'name': 'Banana',
      'nutrition': '89 calories per 100g, rich in potassium and Vitamin B6',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
    },
    {
      'name': 'Orange',
      'nutrition': '43 calories per 100g, high in Vitamin C and fiber',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Orange-fruit.jpg',
    },
    {
      'name': 'Strawberry',
      'nutrition': '32 calories per 100g, rich in Vitamin C and antioxidants',
      'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Strawberries.jpg/1280px-Strawberries.jpg',
    },
    {
      'name': 'Grapes',
      'nutrition': '67 calories per 100g, high in vitamins and minerals',
      'photoUrl': 'https://picsum.photos/400?random=1',
    },
    {
      'name': 'Pineapple',
      'nutrition': '50 calories per 100g, high in Vitamin C and manganese',
      'photoUrl': 'https://picsum.photos/400?random=2',
    },
    {
      'name': 'Watermelon',
      'nutrition': '30 calories per 100g, high in Vitamin C and hydration',
      'photoUrl': 'https://picsum.photos/400?random=3',
    },
    {
      'name': 'Mango',
      'nutrition': '60 calories per 100g, rich in Vitamin A and C',
      'photoUrl': 'https://picsum.photos/400?random=4',
    },
    {
      'name': 'Papaya',
      'nutrition': '43 calories per 100g, high in Vitamin C and folate',
      'photoUrl': 'https://picsum.photos/400?random=5',
    },
    {
      'name': 'Kiwi',
      'nutrition': '61 calories per 100g, rich in Vitamin C and Vitamin K',
      'photoUrl': 'https://picsum.photos/400?random=6',
    },
    {
      'name': 'Blueberry',
      'nutrition': '57 calories per 100g, high in antioxidants and Vitamin C',
      'photoUrl': 'https://picsum.photos/400?random=7',
    },
    {
      'name': 'Pomegranate',
      'nutrition': '83 calories per 100g, high in Vitamin C and antioxidants',
      'photoUrl': 'https://picsum.photos/400?random=8',
    },
    // {
    //   'name': 'Pear',
    //   'nutrition': '57 calories per 100g, rich in fiber and Vitamin C',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Pear.jpg',
    // },
    // {
    //   'name': 'Peach',
    //   'nutrition': '39 calories per 100g, high in Vitamin C and Vitamin A',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Peach.jpg',
    // },
    // {
    //   'name': 'Plum',
    //   'nutrition': '46 calories per 100g, rich in Vitamin C and Vitamin K',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Plum.jpg',
    // },
    // {
    //   'name': 'Avocado',
    //   'nutrition': '160 calories per 100g, high in healthy fats and fiber',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/2/29/Avocado.jpg',
    // },
    // {
    //   'name': 'Cherry',
    //   'nutrition': '50 calories per 100g, rich in antioxidants and Vitamin C',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Cherry.jpg',
    // },
    // {
    //   'name': 'Lemon',
    //   'nutrition': '29 calories per 100g, high in Vitamin C and antioxidants',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Lemon.jpg',
    // },
    // {
    //   'name': 'Raspberry',
    //   'nutrition': '52 calories per 100g, rich in fiber and Vitamin C',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/6/68/Raspberry.jpg',
    // },
    // {
    //   'name': 'Coconut',
    //   'nutrition': '354 calories per 100g, high in healthy fats and fiber',
    //   'photoUrl': 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Coconut.jpg',
    // },
  ];
  List<Map<String, String>> vegetables = [
    {
      'name': 'Carrot',
      'nutrition': '41 calories per 100g, high in Vitamin A and fiber',
      'photoUrl': 'https://example.com/carrot.jpg',
    },
    {
      'name': 'Broccoli',
      'nutrition': '34 calories per 100g, rich in Vitamin C and Vitamin K',
      'photoUrl': 'https://example.com/broccoli.jpg',
    },
    {
      'name': 'Spinach',
      'nutrition': '23 calories per 100g, high in iron and Vitamin A',
      'photoUrl': 'https://example.com/spinach.jpg',
    },
    {
      'name': 'Potato',
      'nutrition': '77 calories per 100g, rich in carbohydrates and Vitamin C',
      'photoUrl': 'https://example.com/potato.jpg',
    },
    {
      'name': 'Tomato',
      'nutrition': '18 calories per 100g, high in Vitamin C and antioxidants',
      'photoUrl': 'https://example.com/tomato.jpg',
    },
    {
      'name': 'Cabbage',
      'nutrition': '25 calories per 100g, rich in Vitamin C and fiber',
      'photoUrl': 'https://example.com/cabbage.jpg',
    },
    {
      'name': 'Cauliflower',
      'nutrition': '25 calories per 100g, high in Vitamin C and folate',
      'photoUrl': 'https://example.com/cauliflower.jpg',
    },
    {
      'name': 'Cucumber',
      'nutrition': '16 calories per 100g, high in hydration and Vitamin K',
      'photoUrl': 'https://example.com/cucumber.jpg',
    },
    {
      'name': 'Bell Pepper',
      'nutrition': '20 calories per 100g, rich in Vitamin C and antioxidants',
      'photoUrl': 'https://example.com/bellpepper.jpg',
    },
    {
      'name': 'Eggplant',
      'nutrition': '25 calories per 100g, high in fiber and antioxidants',
      'photoUrl': 'https://example.com/eggplant.jpg',
    },
    {
      'name': 'Zucchini',
      'nutrition': '17 calories per 100g, rich in Vitamin C and potassium',
      'photoUrl': 'https://example.com/zucchini.jpg',
    },
    {
      'name': 'Onion',
      'nutrition': '40 calories per 100g, high in Vitamin C and antioxidants',
      'photoUrl': 'https://example.com/onion.jpg',
    },
    {
      'name': 'Garlic',
      'nutrition': '149 calories per 100g, rich in manganese and Vitamin B6',
      'photoUrl': 'https://example.com/garlic.jpg',
    }
  ];

  ResponsiveDesign({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Responsive Design Example"),
        ),
        body: LayoutBuilder(
          builder: (context,screen) {
            if(screen.maxWidth>800) {
              return BigScreenDesign(screen);
            } else {
              return MobileScreenDesign(screen);
            }

          },
        ),
      ),
    );
  }
}
class BigScreenDesign extends StatelessWidget {
  //instance variable
  BoxConstraints screen = const BoxConstraints();
  BigScreenDesign(BoxConstraints screen, {super.key})
  {
    this.screen = screen;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: screen.maxWidth * 0.30,
          height: screen.maxHeight,
          child: LayoutBuilder(
            builder: (ctx,parent) {
              return Column(
                children: [
                  Container(
                    height: parent.maxHeight * 0.20,
                    width: parent.maxWidth,
                    color: Colors.cyan,
                  ),
                  Container(
                    height: parent.maxHeight * 0.80,
                    width: parent.maxWidth,
                    color: Colors.red,
                  ),
                ],
              );
            },
          ),
        ),
        Container(
          width: screen.maxWidth * 0.70,
          height: screen.maxHeight,
          color: Colors.orange,
        ),
      ],
    );
  }

}
class MobileScreenDesign extends StatelessWidget {
  BoxConstraints screen = const BoxConstraints();
  MobileScreenDesign(BoxConstraints screen, {super.key})
  {
    this.screen = screen;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screen.maxWidth,
          height: screen.maxHeight * 0.20,
          color: Colors.red,
        ),
        Container(
          width: screen.maxWidth,
          height: screen.maxHeight * 0.60,
          color: Colors.yellow,
        ),
        Container(
          width: screen.maxWidth,
          height: screen.maxHeight * 0.20,
          color: Colors.green,
        )
      ],
    );
  }

}
