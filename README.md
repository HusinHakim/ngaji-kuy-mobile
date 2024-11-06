
# Ngaji Kuy
E-commerce terbaik untuk segala kalangan umur

- [Profile](#profile)
- [Tugas 7](#tugas-7)

## Profile

Nama    : Husin Hidayatul Hakim  
NPM     : 2306152481  
Kelas   : PBP D 

# Tugas 7


1. **Apa yang dimaksud dengan Stateless dan Stateful Widget, serta perbedaannya?**

    **Jawab:**
    *   **Stateless Widget** adalah widget yang tampilannya tidak akan berubah selama aplikasi berjalan. Artinya, data yang ditampilkan tetap sama dan tidak bergantung pada interaksi atau perubahan dari pengguna. Contoh sederhana adalah ikon yang selalu tampil sama tanpa pengaruh apa pun.

    *   **Stateful Widget**, di sisi lain, punya kemampuan untuk menyesuaikan tampilannya berdasarkan perubahan data. Jadi, widget ini bisa memperbarui dirinya sendiri saat ada perubahan. Misalnya, jika kamu membuat Checkbox, kotak itu bisa berubah menjadi "checked" atau "unchecked" tergantung pada aksi pengguna.

    Perbedaannya terletak pada kemampuannya untuk menyimpan dan memperbarui state (data) yang mempengaruhi tampilan. Stateless widget selalu tetap sama, sedangkan stateful bisa berubah-ubah.

2. **Widget yang Digunakan di Proyek Ini dan Fungsinya:**

    **Jawab:**
    *   **Scaffold**: Kerangka utama halaman, menyediakan AppBar, body, dan elemen-elemen dasar lainnya.
    *   **AppBar**: Bagian atas halaman yang berfungsi sebagai judul atau header.
    *   **Padding**: Menyediakan jarak di sekitar widget, supaya tampilan tidak mepet dengan batas layar.
    *   **Column**: Untuk menyusun widget secara vertikal (atas ke bawah).
    *   **Row**: Untuk menyusun widget secara horizontal (kiri ke kanan).
    *   **SnackBar**: Menampilkan pesan atau notifikasi sementara di bagian bawah layar.
    *   **InkWell**: Memberikan efek sentuhan (ripple) ketika widget ditekan, untuk memberikan umpan balik visual.
    *   **Card**: Kontainer yang dapat diatur untuk tampilan yang terstruktur.
    *   **Icon**: Untuk menampilkan ikon di dalam widget, seperti ikon produk atau tindakan.
    *   **GridView**: Menampilkan item dalam bentuk grid, cocok untuk menampilkan beberapa produk dalam bentuk kotak-kotak.

3. **Fungsi dari `setState()`**

    **Jawab:**
    `setState()` adalah fungsi penting dalam Stateful Widget yang memungkinkan perubahan data di dalam widget terlihat pada tampilan aplikasi. Misalnya, jika ada variabel yang menyimpan jumlah klik, ketika jumlah itu berubah, `setState()` akan memastikan tampilan UI juga memperbarui jumlah klik yang baru. Semua variabel yang berada dalam state widget itu akan terdampak dan di-refresh ulang dengan data terbaru setiap kali `setState()` dipanggil.

4. **Perbedaan antara `const` dan `final`**

    **Jawab:**
    *   **Const** digunakan untuk mendefinisikan nilai tetap (immutable) yang sudah harus diketahui di awal, saat kode dikompilasi. Jadi, variabel dengan `const` ini sudah pasti nilainya dari awal dan tidak akan berubah.

    *   **Final**, meski juga membuat variabel immutable, memberi lebih banyak fleksibilitas karena nilainya bisa baru ditentukan saat runtime. Jadi, `final` memungkinkan kita menunggu sampai aplikasi berjalan untuk menetapkan nilainya, yang memberi ruang untuk mengambil data yang mungkin baru muncul atau tergantung kondisi tertentu.


5. **Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**

    **Jawab:**

    1. Membuat `main.dart` untuk base dari app yang akan dibuat. Terdapat fungsi `main()` untuk menjalankan widget-widget yang sudah dibuat. Serta menentukan colorScheme dari app.
    ```dart
    void main() {
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple,)
            .copyWith(secondary: Colors.deepPurple[400]),
          ),
          home: MyHomePage(),
        );
      }
    }
    ```

    2. Membuat beberapa variabel final, constructor, dan list warna untuk memberikan warna yang berbeda di tiap button.
    ```dart
    MyHomePage({super.key});
    final String npm = '2306152481';
    final String name = 'Husin Hidayatul Hakim';
    final String className = 'PBP D';

    final List<ItemHomepage> items = [
      ItemHomepage("Lihat Daftar Produk", Icons.mood, Colors.blue),
      ItemHomepage("Tambah Produk", Icons.add, Colors.green),
      ItemHomepage("Logout", Icons.logout, Colors.red),
    ];
    ```

    3. Membuat class `ItemHomepage` yang memiliki atribut nama, ikon, dan warna.
    ```dart
    class ItemHomepage {
      final String name;
      final IconData icon;
      final Color color;

      ItemHomepage(this.name, this.icon, this.color);
    }
    ```

    4. Membuat class `ItemCard` untuk menampilkan `ItemHomepage` dengan styling. Terdapat juga fungsi `onTap()` untuk menampilkan snackbar dengan pesan sesuai nama tombol.
    ```dart
    class ItemCard extends StatelessWidget {
      final ItemHomepage item;
      const ItemCard(this.item, {super.key});

      @override
      Widget build(BuildContext context) {
        return Material(
          color: item.color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    ```

    5. Membuat fungsi utama di widget `MyHomePage`. Fungsi ini menampilkan NPM, nama, dan kelas dalam bentuk `InfoCard`, serta menampilkan `ItemCard` dalam GridView untuk setiap tombol dengan warna berbeda sesuai yang telah ditentukan.
    ```dart
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ngaji Kuy',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: name),
                  InfoCard(title: 'Class', content: className),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Welcome to Ngaji Kuy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    ```
