import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screens/update_information_screen.dart';
import 'package:foodtek/view/screens/widgets/avatar_widget.dart';
import 'package:foodtek/view/screens/widgets/custom_container_profile.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../cubit/theme_cubit.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool pushNotifications = false;
  bool promotionalNotifications = false;

  @override
  Widget build(BuildContext context) {
    return

        Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                 // BackButton(color: Theme.of(context).iconTheme.color),

                  // Text(
                  //   'Profile'.tr(),
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .titleLarge
                  //       ?.copyWith(fontSize: 20),
                  // ),
                ],
              ),
              AvatarWidget(),
              SizedBox(height: 24),
              customContainer(
                context,
                _buildSection(
                  title: 'My Account'.tr(),
                  children: [
                    _buildListTile(
                      'Personal information'.tr(),
                      Icons.person,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateInformationScreen(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(Icons.language,
                              color: Theme.of(context).iconTheme.color),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Language'.tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Locale newLocale =
                                  context.locale.languageCode == 'en'
                                      ? const Locale('ar')
                                      : const Locale('en');
                              context.setLocale(newLocale);
                            },
                            child: Text(
                              context.locale.languageCode == 'en'
                                  ? 'العربية'
                                  : 'English',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildListTile('Privacy Policy'.tr(), Icons.lock),
                    _buildListTile('Setting'.tr(), Icons.settings),
                  ],
                ),
              ),
              customContainer(
                context,
                _buildSection(
                  title: 'Notifications'.tr(),
                  children: [
                    _buildSwitchTile(
                      'Push Notifications'.tr(),
                      Icons.notifications,
                      pushNotifications,
                      (value) {
                        setState(() {
                          pushNotifications = value;
                        });
                      },
                    ),
                    _buildSwitchTile(
                      'Promotional Notifications'.tr(),
                      Icons.notifications,
                      promotionalNotifications,
                      (value) {
                        setState(() {
                          promotionalNotifications = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              customContainer(
                context,
                _buildSection(
                  title: 'theme'.tr(),
                  children: [
                    SwitchListTile(
                      title: Text('Dark Mode'.tr(),
                          style: Theme.of(context).textTheme.bodyMedium),
                      value: Theme.of(context).brightness == Brightness.dark,
                      onChanged: (bool value) {
                        context.read<ThemeCubit>().toggleTheme(value);
                      },
                      secondary: Icon(Icons.dark_mode,
                          color: Theme.of(context).iconTheme.color),
                    ),
                  ],
                ),
              ),
              customContainer(
                context,
                _buildSection(
                  title: 'More'.tr(),
                  children: [
                    _buildListTile('Help Center'.tr(), Icons.help),
                    _buildListTile(
                      'Log Out'.tr(),
                      Icons.logout,
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color ??
                    Colors.white),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildListTile(String text, IconData icon,
      {Color? textColor, IconData? suffixIcon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                    color: Theme.of(context).iconTheme.color
                ),
              ),
            ),
            if (suffixIcon != null)
              Icon(suffixIcon,
                  size: 16, color: Theme.of(context).iconTheme.color),
          ],
        ),
      ),
    );
  }

  // Widget _buildSwitchTile(String title, IconData icon, bool value, Function(bool) onChanged) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 12.0),
  //     child: Row(
  //       children: [
  //         Icon(icon),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: Text(
  //             title,
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ),
  //         Switch(
  //           value: value,
  //           onChanged: onChanged,
  //           activeColor: Color(0xff09CA67),
  //           inactiveTrackColor: Color(0xffAFAFAF),
  //           inactiveThumbColor: Colors.white,
  //           thumbColor: MaterialStateProperty.resolveWith<Color>(
  //                 (Set<MaterialState> states) {
  //               return Colors.white;
  //             },
  //           ),
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }
  Widget _buildSwitchTile(
      String title, IconData icon, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).iconTheme.color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).iconTheme.color),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xff09CA67),
            inactiveTrackColor: const Color(0xffAFAFAF),
            inactiveThumbColor: Colors.white,
            thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) => Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
