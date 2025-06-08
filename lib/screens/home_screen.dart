import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double revenusFixes = 0;
  double chargesFixes = 0;
  double revenusPonctuels = 0;
  double depensesPonctuelles = 0;

  final TextEditingController _revenuController = TextEditingController();
  final TextEditingController _chargeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double soldeDisponible = (revenusFixes + revenusPonctuels) - (chargesFixes + depensesPonctuelles);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Budget Facile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Solde disponible : €${soldeDisponible.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text('Revenus fixes : €$revenusFixes'),
            Text('Charges fixes : €$chargesFixes'),
            Text('Revenus ponctuels : €$revenusPonctuels'),
            Text('Dépenses ponctuelles : €$depensesPonctuelles'),
            SizedBox(height: 20),
            TextField(
              controller: _revenuController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ajouter revenu ponctuel (€)'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  revenusPonctuels += double.tryParse(_revenuController.text) ?? 0;
                  _revenuController.clear();
                });
              },
              child: Text('Ajouter revenu ponctuel'),
            ),
            TextField(
              controller: _chargeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ajouter dépense ponctuelle (€)'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  depensesPonctuelles += double.tryParse(_chargeController.text) ?? 0;
                  _chargeController.clear();
                });
              },
              child: Text('Ajouter dépense ponctuelle'),
            ),
          ],
        ),
      ),
    );
  }
}
