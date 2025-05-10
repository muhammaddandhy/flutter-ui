import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo Menu',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onMenuSelected(String value, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$value dipilih')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'title': 'Text Widget', 'page': const TextWidgetPage()},
      {'title': 'Container Widget', 'page': const ContainerWidgetPage()},
      {'title': 'ElevatedButton Widget', 'page': const ButtonWidgetPage()},
      {'title': 'Icon Widget', 'page': const IconWidgetPage()},
      {'title': 'Image Widget', 'page': const ImageWidgetPage()},
      {'title': 'CircleAvatar Widget', 'page': const AvatarWidgetPage()},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text('Menu Widget Dasar'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur pencarian belum tersedia')),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) => _onMenuSelected(value, context),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Pengaturan',
                child: Text('Pengaturan'),
              ),
              const PopupMenuItem(
                value: 'Bantuan',
                child: Text('Bantuan'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text('Menu Navigasi', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ...menuItems.map((item) => ListTile(
                  title: Text(item['title']),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => item['page']),
                    );
                  },
                )),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menuItems[index]['title']),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => menuItems[index]['page']),
              );
            },
          );
        },
      ),
    );
  }
}

// Halaman-halaman berikut tetap sama seperti kode Anda:
class TextWidgetPage extends StatelessWidget {
  const TextWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Widget')),
      body: const Center(
        child: Text(
          'Ini adalah Text Widget',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ContainerWidgetPage extends StatelessWidget {
  const ContainerWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Widget')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.blue[100],
          child: const Text('Ini di dalam Container'),
        ),
      ),
    );
  }
}

class ButtonWidgetPage extends StatelessWidget {
  const ButtonWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ElevatedButton Widget')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tombol ditekan!')),
            );
          },
          child: const Text('Tekan Saya'),
        ),
      ),
    );
  }
}

class IconWidgetPage extends StatelessWidget {
  const IconWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Widget')),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 40),
            SizedBox(width: 20),
            Icon(Icons.favorite, size: 40, color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class ImageWidgetPage extends StatelessWidget {
  const ImageWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Widget')),
       body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: 180,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset('assets/images/gambar.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarWidgetPage extends StatelessWidget {
  const AvatarWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CircleAvatar Widget')),
      body: const Center(
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
      ),
    );
  }
}