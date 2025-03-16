import 'package:flutter/material.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _sellerPages = <Widget>[
    Center(child: Text('Seller Dashboard')),
    Center(child: Text('Orders')),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seller Dashboard")),
      //body: _sellerPages[_selectedIndex],
      body: SingleChildScrollView( // Removemos o const daqui
      child: Column(
        children: [
          ImageSection(
            image: 'assets/coco_praia.png',
            wid: 600,
            hei: 240,
          ),
          TitleSection(
            name: 'Côco do Seu Gustavo',
            location: 'Praia de Boa Viagem',
          ),
          TextSection(
            description:
                'Se você está em busca de uma bebida natural, refrescante e cheia de benefícios para a sua saúde, a água de coco é a escolha perfeita! Além de deliciosa, ela é uma excelente fonte de hidratação e nutrição, ideal para qualquer momento do dia. '
                'A água de coco é rica em eletrólitos essenciais, como potássio, magnésio e sódio, que ajudam a manter seu corpo hidratado e cheio de energia. Perfeita para quem pratica esportes, trabalha sob o sol ou simplesmente deseja uma alternativa saudável às bebidas industrializadas. Além disso, é uma ótima opção para ajudar na digestão, melhorar a circulação e fortalecer o sistema imunológico. ',
          ),
          ImageSection(
            image: 'assets/Group40.png',
            wid: 350,
            hei: 50,
          ),
          SizedBox(height: 30),
          
          // Envolver a imagem do QR Code dentro de um GestureDetector
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QrCodePage()),
              );
            },
            child: ImageSection(
              image: 'assets/QRcodebutton.png',
              wid: 350,
              hei: 50,
            ),
          ),
        ],
      ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image, required this.wid, required this.hei});

  final String image;
  final double wid;
  final double hei;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: wid, height: hei, fit: BoxFit.cover);
  }
}
