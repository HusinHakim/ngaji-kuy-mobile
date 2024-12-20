
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


# Tugas 8

1. **Apa kegunaan `const` di Flutter?**

   **Jawab:**  
   `const` digunakan untuk membuat objek yang immutable (tidak berubah). Keuntungannya adalah peningkatan performa dan efisiensi memori karena objek `const` hanya dibuat sekali dan disimpan dalam cache. Sebaiknya gunakan `const` pada elemen yang tidak akan berubah selama aplikasi berjalan, seperti teks atau ikon statis. Namun, hindari penggunaan `const` pada elemen yang membutuhkan perubahan data atau reaktivitas.

2. **Jelaskan dan bandingkan penggunaan `Column` dan `Row` pada Flutter.**

   **Jawab:**  
   * **Column** menyusun widget secara vertikal (dari atas ke bawah), ideal untuk daftar elemen atau form yang memanjang ke bawah.
   * **Row** menyusun widget secara horizontal (dari kiri ke kanan), cocok untuk elemen yang berdampingan seperti ikon dan teks dalam satu baris.  
   * **Perbandingan**: `Column` berfungsi untuk layout vertikal, sedangkan `Row` untuk layout horizontal. Keduanya bisa menyebabkan overflow jika jumlah elemen terlalu banyak pada sumbu masing-masing sehingga tidak sesuai dengan ruang layar.

3. **Apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas ini?**

   **Jawab:**  
   Digunakan **TextFormField** untuk menerima input teks dan **ElevatedButton** untuk submit data. Elemen input lain, seperti **Checkbox** untuk pilihan berganda dan **Slider** untuk memilih nilai dalam rentang tertentu, tidak digunakan karena tidak sesuai dengan kebutuhan form kali ini.

4. **Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten?**

   **Jawab:**  
   Tema diatur pada `MaterialApp` menggunakan `ThemeData` untuk mengatur warna utama, latar belakang, serta gaya teks agar aplikasi tampak konsisten. Dengan menggunakan tema, setiap halaman memiliki tampilan dan nuansa yang seragam, sehingga memberikan pengalaman visual yang terstruktur.

5. **Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**

   **Jawab:**  
   Navigasi diatur menggunakan widget `Navigator` dengan metode seperti `push()`, `pop()`, dan `pushReplacement()` untuk perpindahan antar halaman. `push()` menambah halaman ke dalam stack, sedangkan `pushReplacement()` menggantinya tanpa menambah stack, memastikan pengguna dapat kembali atau langsung berpindah halaman sesuai kebutuhan aplikasi.


# Tugas 9
# Tugas 9

1. **Mengapa kita perlu membuat model untuk pengambilan atau pengiriman data JSON? Apakah akan terjadi error jika tidak membuat model terlebih dahulu?**

   **Jawab:**  
   Model berfungsi sebagai representasi terstruktur dari data yang dikirim atau diterima. Dengan menggunakan model, kita dapat memastikan setiap atribut data memiliki tipe yang benar, meminimalkan risiko error tipe data, dan membuat proses manipulasi data lebih mudah dan aman. Tanpa model, kita harus menangani JSON secara manual, yang meningkatkan risiko kesalahan seperti salah ketik atau ketidaksesuaian tipe data. Dalam proyek yang besar, hal ini dapat menyebabkan kode sulit dipelihara dan berantakan.

2. **Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini**

   **Jawab:**  
   Library `http` digunakan untuk mengirim permintaan HTTP seperti `GET`, `POST`, dan lainnya ke server. Library ini memfasilitasi pertukaran data dalam format JSON antara Flutter dan backend Django. Selain itu, library ini mendukung pengaturan header untuk autentikasi atau konfigurasi lainnya, memastikan komunikasi antara klien dan server berjalan lancar dan aman.

3. **Jelaskan fungsi dari CookieRequest dan alasan instance-nya perlu dibagikan ke seluruh komponen Flutter**

   **Jawab:**  
   `CookieRequest` bertugas untuk mengelola cookie autentikasi berbasis sesi. Dengan `CookieRequest`, aplikasi dapat memastikan bahwa setiap permintaan HTTP menggunakan sesi yang sama, memungkinkan pengguna tetap login tanpa harus autentikasi ulang. Membagikan instance `CookieRequest` ke seluruh komponen memastikan konsistensi sesi dan efisiensi dalam pengelolaan autentikasi di seluruh aplikasi.

4. **Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan di Flutter**

   **Jawab:**  
   - Pengguna memasukkan data ke elemen input seperti formulir di Flutter.  
   - Data divalidasi secara lokal sebelum dikirimkan ke server.  
   - Aplikasi mengubah data menjadi format JSON dan mengirimkan permintaan HTTP ke backend Django menggunakan library `http`.  
   - Django memproses data, menyimpannya ke database, dan mengirimkan respons dalam format JSON.  
   - Flutter menerima respons tersebut, memparsingnya menjadi objek Dart, lalu memperbarui UI menggunakan mekanisme seperti `setState`.

5. **Jelaskan mekanisme autentikasi dari login, register, hingga logout**

   **Jawab:**  
   - **Login/Register**: Data akun dikirim dari Flutter ke Django melalui `POST`. Django memvalidasi data, menyimpan cookie sesi untuk login, atau membuat akun baru untuk register.  
   - **Sesi Aktif**: Flutter menyimpan cookie sesi dan menggunakannya untuk semua permintaan autentikasi.  
   - **Logout**: Permintaan dikirim dari Flutter ke Django untuk menghapus sesi, dan Flutter menghapus cookie sesi secara lokal.

6. **Bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step?**

   **Jawab:**  
   - **Setup Proyek Django**: Membuat endpoint JSON untuk daftar item dan detail item, serta menambahkan middleware autentikasi berbasis cookie.  
   - **Model dan View**: Membuat model untuk product dan memastikan struktur data JSON sesuai dengan model.  
   - **Integrasi dengan Flutter**: Menggunakan `http` library untuk mengambil dan mengirim data. Menambahkan `CookieRequest` untuk autentikasi.  
   - **Membangun UI**:  
     - Halaman login dan registrasi dengan autentikasi Django.  
     - Halaman daftar item yang menampilkan atribut seperti `name`, `price`, dan `description`.  
     - Halaman detail item dengan semua atribut model dan tombol kembali.  
   - **Filter Data**: Menambahkan filter untuk menampilkan item yang terasosiasi dengan pengguna yang login.  
     