import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Métodos de Pago',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaymentMethodsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MÉTODOS DE PAGO'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildPaymentCard(
                  Icons.credit_card,
                  'Pago con tarjeta',
                  () => _showPaymentDetails(context, 'Tarjeta'),
                ),
                const SizedBox(height: 20),
                _buildPaymentCard(
                  Icons.local_shipping,
                  'Pago contra-entrega',
                  () => _showPaymentDetails(context, 'Contraentrega'),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 250,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.asset(
              'assets/pizza.jpg',
              fit: BoxFit.contain,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(IconData icon, String text, VoidCallback onTap) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 35),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showPaymentDetails(BuildContext context, String metodo) {
    final mensajes = {
      'Tarjeta':
          'Ha seleccionado pagar con tarjeta. '
          '\n\nPor favor, introduzca los datos de su tarjeta '
          'en el siguiente formulario.',
      'Contraentrega':
          'Ha seleccionado pago contra entrega. '
          '\n\nEl pago se realizará al momento de recibir '
          'el producto en su domicilio.',
    };

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Método seleccionado: $metodo'),
            content: Text(mensajes[metodo] ?? 'Método no reconocido'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Aceptar'),
              ),
            ],
          ),
    );
  }
}
