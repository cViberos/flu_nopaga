import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart' as ul;

import 'package:flu_nopaga/page_pagar.dart';
import 'package:flu_nopaga/mod_lgastos.dart';

class HomePage extends StatefulWidget {
  static const nombreRuta = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  // final ScrollController _scrollLista = ScrollController();
  final List<GastosOption> _lGasDiario = [
    GastosOption(
      colorbase: Colors.red,
      icono: Icons.account_balance_rounded,
      titulo: 'Red Bancaria',
      subtitle: '\$365.89',
      fecha: 'Hoy',
    ),
    GastosOption(
      colorbase: Colors.orange,
      icono: Icons.fastfood_rounded,
      titulo: 'Comida y Bebidas',
      subtitle: '\$165.99',
      fecha: '26 Jun, 2023',
    ),
    GastosOption(
      colorbase: Colors.green,
      icono: Icons.sailing_rounded,
      titulo: 'Ropa',
      subtitle: '\$65.09',
      fecha: '15 Jun, 2019',
    ),
    GastosOption(
      colorbase: Colors.indigo,
      icono: Icons.checkroom_rounded,
      titulo: 'Prendas',
      subtitle: '\$365.89',
      fecha: '26 Jun, 2023',
    ),
  ];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Row(
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _mostrarAlerta(context);
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/perfil.jpg'),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Tarjeta1(),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'GASTOS DIARIOS',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF868686),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todo',
                      style: TextStyle(color: Color.fromARGB(255, 39, 85, 211)),
                    ),
                  )
                ],
              ),
              Tarjeta2(scrollController: scrollController, lista: _lGasDiario),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'LISTA BLANCA',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF868686),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todo',
                      style: TextStyle(color: Color.fromARGB(255, 39, 85, 211)),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  ItemOption(
                    colorbase: Colors.indigo,
                    titulo: 'Viajes',
                    icono: Icons.sailing_rounded,
                  ),
                  Spacer(),
                  ItemOption(
                    colorbase: Colors.green,
                    titulo: 'Gym',
                    icono: Icons.sports_gymnastics_rounded,
                  ),
                  Spacer(),
                  ItemOption(
                    colorbase: Colors.orange,
                    titulo: 'Transporte',
                    icono: Icons.bike_scooter_rounded,
                  ),
                  Spacer(),
                  ItemOption(
                    colorbase: Colors.pink,
                    titulo: 'Apps',
                    icono: Icons.mobile_friendly_rounded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // shape: const CircleBorder(),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        elevation: 4,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PagarPage()),
          );
        },
        child: const Icon(Icons.add_rounded, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            const SizedBox(width: 10),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.location_on_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.person_outline)),
          ],
        ),
      ),
    );
  }
}

void _showSources() {
  ul.launchUrlString(
    'https://www.linkedin.com/in/cristianviberos/',
    mode: LaunchMode.externalApplication,
  );
}

void _mostrarAlerta(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text('Tec. Cristian Gustavo Viberos'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                'Desarrollado con las intenciones de poner en práctica un meme que vi en youtube.'),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/perfil.jpg'),
              radius: 90.0,
            )
          ],
        ),
        actions: const <Widget>[
          TextButton(
            onPressed: _showSources,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Mi perfil de linkeding'),
                Icon(Icons.link_rounded),
              ],
            ),
          ),
          // ElevatedButton(
          //   child: Text('Cerrar'),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
        ],
      );
    },
  );
}

class ItemOption extends StatelessWidget {
  const ItemOption({
    super.key,
    required this.titulo,
    required this.colorbase,
    required this.icono,
  });

  final IconData icono;
  final Color colorbase;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 85,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorbase,
        boxShadow: [
          BoxShadow(
            color: colorbase.withAlpha(100),
            blurRadius: 10,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icono,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(height: 3),
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class Tarjeta2 extends StatelessWidget {
  const Tarjeta2({
    super.key,
    required this.scrollController,
    required this.lista,
  });

  final ScrollController scrollController;
  final List<GastosOption> lista;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 7,
      shadowColor: Colors.white54,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 240,
        child: ListView.builder(
          itemCount: lista.length,
          controller: scrollController,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lista[index].colorbase,
                ),
                child: Icon(
                  lista[index].icono,
                  color: Colors.white,
                ),
              ),
              title: Text(lista[index].titulo),
              subtitle: Text(
                lista[index].subtitle,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
              trailing: Text(
                lista[index].fecha,
                style: const TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class Tarjeta1 extends StatelessWidget {
  const Tarjeta1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color(0xFF265AE9),
      shadowColor: const Color(0xFF265AE9).withAlpha(150),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Viernes',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Row(
              children: const [
                Text(
                  '\$ 500',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.white30,
                    value: 0.7,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '70%',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              'Objetivo de gasto diario: \$16.67',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
