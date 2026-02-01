import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _nameController.text = 'Sarah Connor';
    _emailController.text = 'sarah.connor@example.com';
    _passwordController.text = 'password123';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _changePhoto() {
    // Implement photo change functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Profile Photo'),
        content: const Text('Choose an option to update your profile photo.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement camera functionality
            },
            child: const Text('Take Photo'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement gallery functionality
            },
            child: const Text('Choose from Gallery'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _changePassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('A password reset link will be sent to your email address.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement password reset functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password reset email sent!'),
                ),
              );
            },
            child: const Text('Send Reset Link'),
          ),
        ],
      ),
    );
  }

  void _saveChanges() {
    // Validate and save changes
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Save changes (in a real app, this would call an API)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back after saving
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161022),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Container(
              color: const Color(0xFF161022),
              padding: const EdgeInsets.all(16).copyWith(bottom: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Edit Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Spacer for balance
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildProfilePhotoSection(),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Name Field
                    _buildFormField(
                      label: 'Name',
                      controller: _nameController,
                      icon: Icons.person,
                      isPassword: false,
                    ),

                    const SizedBox(height: 16),

                    // Email Field
                    _buildFormField(
                      label: 'Email',
                      controller: _emailController,
                      icon: Icons.email,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    // Password Field
                    _buildPasswordField(),

                    const SizedBox(height: 24),

                    // Action Buttons
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhotoSection() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBM_1Ejv6NfYvI2z0CaKOqd8P6478z3M5kKbPt5ciWFTP7qVpa9Luh35UH6x0kvjaSJ1TSNom38zDlW1tYk6qASDr4WFGhpdl2S0jrURBD_3lo8MNAjBaKMh2jtMLeLWJSXkBDk8BUsYnBapcr5SChO32PMVkr9lRJ2b41p1ZnL1H_L0DiZCkuktxfEIRNRVAr04rosgeDprMBCtQBoI0VsdX-9OGntdWe4W_N50txie5-sZpvYZ7KIGT0dfszkIEoj1yBXuJyIR2k',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: _changePhoto,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFF5b13ec),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required bool isPassword,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF2e2839),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword && _obscurePassword,
            keyboardType: keyboardType,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              prefixIcon: Icon(
                icon,
                color: const Color(0xFFa69db9),
              ),
              hintStyle: const TextStyle(
                color: Color(0xFFa69db9),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF2e2839),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFFa69db9),
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xFFa69db9),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFFa69db9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Change Password Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _changePassword,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5b13ec).withOpacity(0.2),
              foregroundColor: const Color(0xFF5b13ec),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Change Password'),
          ),
        ),

        const SizedBox(height: 12),

        // Save Changes Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _saveChanges,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5b13ec),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Save Changes'),
          ),
        ),
      ],
    );
  }
}