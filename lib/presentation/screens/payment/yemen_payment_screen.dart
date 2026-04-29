import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class YemenPaymentScreen extends StatefulWidget {
  const YemenPaymentScreen({super.key});

  @override
  State<YemenPaymentScreen> createState() => _YemenPaymentScreenState();
}

class _YemenPaymentScreenState extends State<YemenPaymentScreen> {
  String _selectedMethod = 'jeeb';
  double _amount = 5000;
  
  final List<Map<String, dynamic>> _wallets = [
    {'id': 'jeeb', 'name': 'جيب', 'icon': Icons.account_balance_wallet},
    {'id': 'jawaly', 'name': 'جوالي', 'icon': Icons.phone_android},
    {'id': 'floosak', 'name': 'فلوسك', 'icon': Icons.money},
    {'id': 'mtn_mobile', 'name': 'MTN Mobile Money', 'icon': Icons.sim_card},
    {'id': 'y_mobile', 'name': 'Y Mobile Cash', 'icon': Icons.contact_phone},
  ];
  
  final List<Map<String, dynamic>> _banks = [
    {'id': 'kuraimi', 'name': 'بنك الكريمي', 'account': '1234-5678-9012'},
    {'id': 'yemen_bank', 'name': 'البنك اليمني', 'account': '2345-6789-0123'},
    {'id': 'kuwait_bank', 'name': 'البنك اليمني الكويتي', 'account': '3456-7890-1234'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدفع الإلكتروني'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('المحافظ الإلكترونية', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _wallets.map((w) => FilterChip(
              label: Text(w['name']),
              selected: _selectedMethod == w['id'],
              onSelected: (_) => setState(() => _selectedMethod = w['id']),
              avatar: Icon(w['icon'], size: 16),
            )).toList(),
          ),
          const SizedBox(height: 16),
          const Text('البنوك اليمنية', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _banks.map((b) => FilterChip(
              label: Text(b['name']),
              selected: _selectedMethod == b['id'],
              onSelected: (_) => setState(() => _selectedMethod = b['id']),
            )).toList(),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('المبلغ'), Text('$_amount ريال')]),
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('الإجمالي', style: TextStyle(fontWeight: FontWeight.bold)), Text('$_amount ريال', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary))]),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 14)),
            child: const Text('تأكيد الدفع'),
          ),
        ],
      ),
    );
  }
}
