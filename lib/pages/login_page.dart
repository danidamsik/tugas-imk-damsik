import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulasi proses login
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login berhasil!')));
        // Navigator.pushReplacement(...) // Untuk pindah ke home
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 80, // Setengah dari diameter
                backgroundImage: AssetImage('assets/images/my_logoo.jpg'),
              ),
              // const SizedBox(height: 40),
              // // const FlutterLogo(size: 100),
              const SizedBox(height: 40),
              const Text(
                'Selamat Datang di Aplikasi Damsik',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 7, 65, 255),
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Masuk ke Akun Anda',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email Input
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 2, 2)), // Warna label
                  hintText: 'contoh@email.com',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                  ), // Warna hint text
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue[800],
                  ), // Warna icon
                  border: OutlineInputBorder(), // Aktifkan outline border
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[300]!,
                    ), // Warna saat tidak aktif
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[700]!,
                    ), // Warna saat fokus
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red[400]!,
                    ), // Warna saat error
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red[700]!,
                    ), // Warna saat error + fokus
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true, // Aktifkan background fill
                  fillColor: Colors.blue[50], // Warna background
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ), // Padding internal
                ),
                style: TextStyle(color: Colors.black87), // Warna text input
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password Input
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 2, 2)), // Warna label
                  hintText: 'Masukkan password Anda',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                  ), // Warna hint text
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue[800],
                  ), // Warna icon
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.blue[800], // Warna icon visibility
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(), // Aktifkan outline border
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[300]!,
                    ), // Warna saat tidak aktif
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[700]!,
                    ), // Warna saat fokus
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red[400]!,
                    ), // Warna saat error
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red[700]!,
                    ), // Warna saat error + fokus
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true, // Aktifkan background fill
                  fillColor: Colors.blue[50], // Warna background
                ),
                obscureText: _obscurePassword,
                style: TextStyle(color: Colors.black87), // Warna text input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Lupa Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Aksi lupa password
                  },
                  child: const Text('Lupa Password?'),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Login
              ElevatedButton(
                onPressed:
                    _isLoading
                        ? null
                        : () {
                          if (_formKey.currentState!.validate()) {
                            setState(() => _isLoading = true);

                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() => _isLoading = false);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardPage(),
                                ),
                              );
                            });
                          }
                        },
                child:
                    _isLoading
                        ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                        : const Text('MASUK', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'ATAU',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),

              // Tombol Register
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('BUAT AKUN BARU'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
