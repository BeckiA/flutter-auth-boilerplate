import 'package:flutter_auth_boilerplate/core/configs/router-configs/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_boilerplate/core/helpers/src/error_toaster.dart';
import 'package:flutter_auth_boilerplate/widgets/app_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/auth/auth_provider.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final isConfirmPasswordVisible = useState(false);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutQuart,
    ));
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutQuart,
    ));

    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    String? validateName(String? value) {
      if (value == null || value.isEmpty) {
        return 'Name is required';
      }
      if (value.length < 2) {
        return 'Name must be at least 2 characters';
      }
      return null;
    }

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }
      if (!value.contains('@') || !value.contains('.')) {
        return 'Please enter a valid email';
      }
      return null;
    }

    String? validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }
      if (value.length < 6) {
        return 'Password must be at least 6 characters';
      }
      return null;
    }

    String? validateConfirmPassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      }
      if (value != passwordController.text) {
        return 'Passwords do not match';
      }
      return null;
    }

    Future<void> onSignUp() async {
      if (formKey.currentState?.validate() != true) return;

      await ref.read(authNotifierProvider.notifier).signUp(
            nameController.text,
            emailController.text,
            passwordController.text,
          );
    }

    ref.listen(authNotifierProvider, (prev, next) {
      next.maybeMap(
        errorSigningUp: (state) =>
            ErrorToaster.showError(context, message: state.message),
        orElse: () {},
      );
    });

    final isSigningUp = ref.watch(authNotifierProvider).maybeMap(
          signingUp: (_) => true,
          orElse: () => false,
        );

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start your fitness journey today',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).textTheme.labelSmall?.color,
                          ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                      textInputAction: TextInputAction.next,
                      validator: validateName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => isPasswordVisible.value =
                              !isPasswordVisible.value,
                        ),
                      ),
                      obscureText: !isPasswordVisible.value,
                      textInputAction: TextInputAction.next,
                      validator: validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Confirm Password',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => isConfirmPasswordVisible.value =
                              !isConfirmPasswordVisible.value,
                        ),
                      ),
                      obscureText: !isConfirmPasswordVisible.value,
                      textInputAction: TextInputAction.done,
                      validator: validateConfirmPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onFieldSubmitted: (_) => onSignUp(),
                    ),
                    const SizedBox(height: 32),
                    AppButton(
                      text: 'Create Account',
                      onPressed: isSigningUp ? null : onSignUp,
                      isLoading: isSigningUp,
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.pushNamed(RouteNames.signIn);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).textTheme.labelSmall?.color,
                                ),
                            children: const [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
