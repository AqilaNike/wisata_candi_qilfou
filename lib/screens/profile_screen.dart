import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../providers/auth_provider.dart';
import 'sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = 'qilfou';

  @override
  Widget build(BuildContext context) {
    // Membaca data dari Provider di dalam method build
    final favoriteCount = context.watch<FavoriteProvider>().count;
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          // Background ungu bagian atas
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // Header Foto Profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (auth.isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Baris 1: Pengguna (Username dari AuthProvider)
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Pengguna', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': ${auth.isSignedIn ? auth.username : ''}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),

                // Baris 2: Nama
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Nama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': ${auth.isSignedIn ? fullName : ''}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    if (auth.isSignedIn) const Icon(Icons.edit),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),

                // Baris 3: Favorit (Membaca jumlah favorit dari FavoriteProvider)
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Favorit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': ${favoriteCount > 0 ? favoriteCount : 0}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 20),

                // Tombol Sign Out / Sign In
                auth.isSignedIn
                    ? TextButton(
                        onPressed: () {
                          context.read<AuthProvider>().signOut();
                          context.read<FavoriteProvider>().clearAll();
                        },
                        child: const Text('Sign Out'),
                      )
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()),
                          );
                        },
                        child: const Text('Sign In'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}