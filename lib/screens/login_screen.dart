import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/district_explorer_screen.dart';
import 'package:flutter_application_2/screens/registration_screen.dart';
import 'package:flutter_application_2/services/auth_service.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/text_styles.dart';
import 'package:flutter_application_2/widgets/custom_textfield.dart';
import 'package:flutter_application_2/widgets/primary_button.dart';
import 'package:flutter_application_2/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    }

    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (value.trim().length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _onSignInTap() async {
    if (_formKey.currentState?.validate() ?? false) {
      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);
      FocusScope.of(context).unfocus();
      try {
        await AuthService.signIn(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
        if (!mounted) return;
        navigator.pushReplacement(
          MaterialPageRoute(builder: (_) => const DistrictExplorerScreen()),
        );
      } catch (error) {
        if (!mounted) return;
        messenger.showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 800;
    final horizontalPadding = isWide ? size.width * 0.18 : 24.0;
    final topSpacing = isWide ? 72.0 : 48.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: topSpacing),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 520),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandHeader(),
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'assets/images/images/logo.png',
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildCard(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandHeader() {
    return Row(
      children: [
        Container(
          height: 58,
          width: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: AppColors.primaryGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(46),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.explore, color: Colors.white, size: 28),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('DeshExplorer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.text)),
            SizedBox(height: 4),
            Text('Smart Travel Guide', style: TextStyle(fontSize: 14, color: AppColors.hint)),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.text.withAlpha(20),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Welcome Back', style: AppTextStyles.title),
          const SizedBox(height: 10),
          Text('Sign in to continue your journey', style: AppTextStyles.subtitle),
          const SizedBox(height: 28),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined, color: AppColors.primary),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 18),
                CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: 'Enter your password',
                  obscureText: _obscurePassword,
                  prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primary),
                  suffixIcon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: AppColors.hint),
                  onSuffixTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: _validatePassword,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(80, 36),
                    ),
                    child: const Text('Forgot Password?', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(height: 16),
                PrimaryButton(label: 'Sign In', onPressed: _onSignInTap),
                const SizedBox(height: 22),
                _buildDivider(),
                const SizedBox(height: 22),
                SocialButton(
                  label: 'Continue with Google',
                  type: SocialButtonType.google,
                  onPressed: () {},
                ),
                const SizedBox(height: 14),
                SocialButton(
                  label: 'Continue with Facebook',
                  type: SocialButtonType.facebook,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text('Don\'t have an account?', style: TextStyle(color: AppColors.hint)),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RegistrationScreen()),
                    );
                  },
                  child: const Text('Sign Up', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.border, thickness: 1)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('OR', style: TextStyle(color: AppColors.hint, fontWeight: FontWeight.w600)),
        ),
        Expanded(child: Divider(color: AppColors.border, thickness: 1)),
      ],
    );
  }
}
