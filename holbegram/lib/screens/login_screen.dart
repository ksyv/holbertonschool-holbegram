import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. Déclaration des variables demandées
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true; // Par défaut le mot de passe est caché (logique inversée plus bas)
  }

  // 2. Nettoyage de la mémoire (Dispose)
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SingleChildScrollView demandé dans le body
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Horizontally : min (selon consigne pour Column principale)
          mainAxisAlignment: MainAxisAlignment.center, // Verticale : center
          children: [
            const SizedBox(height: 28),
            
            // Titre Holbegram (Billabong Font)
            const Text(
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50,
              ),
            ),
            
            // Logo Image
            // ⚠️ Assure-toi que ton image s'appelle bien logo.png ou change le nom ici
            Image.asset(
              'assets/images/logo.png', 
              width: 80,
              height: 60,
            ),

            // Padding horizontal 20
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  
                  // --- CHAMP EMAIL ---
                  TextFieldInput(
                    controller: emailController,
                    hintText: 'Email',
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // --- CHAMP MOT DE PASSE ---
                  TextFieldInput(
                    controller: passwordController,
                    hintText: 'Password',
                    // Note: La consigne dit "obscureText takes ispassword".
                    // Si _passwordVisible est true (par défaut), on veut voir le texte ? 
                    // Non, la convention c'est: true = caché.
                    // On suit la logique standard : si visible = false, on cache.
                    isPassword: _passwordVisible, 
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      // Changement d'icône selon l'état
                      icon: Icon(
                        _passwordVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // --- BOUTON LOGIN ---
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(218, 226, 37, 24),
                        ),
                      ),
                      onPressed: () {
                        // Vide pour le moment
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // --- ROW: Forgot details ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Forgot your login details? '),
                      const Text(
                        'Get help logging in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Flexible(flex: 0, child: Container()), // Container vide demandé
                    ],
                  ),

                  const SizedBox(height: 24),
                  
                  // --- Divider ---
                  const Divider(thickness: 2),
                  
                  // --- Sign Up Link ---
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                             // Vide pour le moment
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(218, 226, 37, 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // --- OR Divider ---
                  const Row(
                    children: [
                      Flexible(child: Divider(thickness: 2)),
                      Text(" OR "),
                      Flexible(child: Divider(thickness: 2)),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // --- Google Sign in ---
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image Google (Lien réseau demandé)
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                      ),
                      const SizedBox(width: 8), 
                      const Text("Sign in with Google"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}