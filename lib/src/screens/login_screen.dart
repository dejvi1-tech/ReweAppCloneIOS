import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/auth/auth_service.dart';
import '../providers/providers.dart';
import '../routes.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = useState(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final isLoading = useState(false);
    final errorMessage = useState<String?>(null);

    Future<void> handleSubmit() async {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        errorMessage.value = 'Bitte füllen Sie alle Felder aus';
        return;
      }

      if (!isLogin.value && (firstNameController.text.isEmpty || lastNameController.text.isEmpty)) {
        errorMessage.value = 'Bitte füllen Sie alle Felder aus';
        return;
      }

      isLoading.value = true;
      errorMessage.value = null;

      try {
        final authService = ref.read(authServiceProvider);

        late final AuthResult result;
        if (isLogin.value) {
          result = await authService.signInWithEmail(
            email: emailController.text.trim(),
            password: passwordController.text,
          );
        } else {
          result = await authService.signUpWithEmail(
            email: emailController.text.trim(),
            password: passwordController.text,
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
          );
        }

        if (result.isSuccess) {
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          }
        } else {
          errorMessage.value = result.error;
        }
      } catch (e) {
        errorMessage.value = 'Ein Fehler ist aufgetreten: $e';
      } finally {
        isLoading.value = false;
      }
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Anmeldung'),
        border: null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(
                CupertinoIcons.shopping_cart,
                size: 80,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(height: 24),
              const Text(
                'REWE',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemRed,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              if (!isLogin.value) ...[
                CupertinoTextField(
                  controller: firstNameController,
                  placeholder: 'Vorname',
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 16),
                CupertinoTextField(
                  controller: lastNameController,
                  placeholder: 'Nachname',
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              CupertinoTextField(
                controller: emailController,
                placeholder: 'E-Mail',
                keyboardType: TextInputType.emailAddress,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 16),
              CupertinoTextField(
                controller: passwordController,
                placeholder: 'Passwort',
                obscureText: true,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              if (errorMessage.value != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    errorMessage.value!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 24),
              CupertinoButton.filled(
                onPressed: isLoading.value ? null : handleSubmit,
                child: isLoading.value
                    ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                    : Text(isLogin.value ? 'Anmelden' : 'Registrieren'),
              ),

              const SizedBox(height: 24),
              CupertinoButton(
                onPressed: () {
                  isLogin.value = !isLogin.value;
                  errorMessage.value = null;
                },
                child: Text(
                  isLogin.value
                      ? 'Noch kein Konto? Jetzt registrieren'
                      : 'Bereits ein Konto? Anmelden',
                  style: const TextStyle(color: CupertinoColors.systemGrey),
                ),
              ),

              const SizedBox(height: 16),
              CupertinoButton.filled(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                },
                child: const Text('App ohne Anmeldung testen'),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}