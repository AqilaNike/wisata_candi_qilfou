import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi/providers/favorite_provider.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/widgets/item_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteNames = context.watch<FavoriteProvider>().favorites;

    final favoriteCandis = candiList
        .where((candi) => favoriteNames.contains(candi.name))
        .toList();

    return Scaffold(
      body: favoriteCandis.isEmpty
          ? const Center(
              child: Text(
                'Belum ada candi favorit',
                style: TextStyle(fontSize: 16),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: favoriteCandis.length,
              itemBuilder: (context, index) {
                return ItemCard(candi: favoriteCandis[index]);
              },
            ),
    );
  }
}