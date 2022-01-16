import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui/screens/onboarding_screen/widget_circle_bar.dart';
import 'package:places/ui/screens/onboarding_screen/widgets_all_onboarding_pages.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Экран "Добро пожаловать",
/// включающий в себя 3 подвкладки
///
class ScreenOnboarding extends StatefulWidget {
  const ScreenOnboarding({Key? key}) : super(key: key);
  @override
  _ScreenOnboardingState createState() => _ScreenOnboardingState();
}

class _ScreenOnboardingState extends State<ScreenOnboarding> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Row(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            //
            // Кнопка "Пропустить"
            //
            Expanded(
              child: currentPage == 2
                  ? const SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, ROUTE_HOME);
                      },
                      style: TextButton.styleFrom(
                        primary: const Color(0xFF4CAF50),
                      ),
                      child: const Align(
                        child: Text(
                          UiStrings.miss,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          //
          // Открытая вкладка
          //
          PageView(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (int page) {
              currentPage = page;
              setState(() {});
            },
            controller: _pageController,
            children: widgetsAllOnboardingPages,
          ),

          //
          // Индикатор выбранной (текущей) страницы
          //
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 72),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widgetsAllOnboardingPages.length; i++)
                  if (i == currentPage) ...[
                    WidgetCircleBar(
                      isActive: true,
                      kActiveColor: Theme.of(context).colorScheme.secondary,
                      kNonActiveColor: Theme.of(context).unselectedWidgetColor,
                    )
                  ] else
                    WidgetCircleBar(
                      isActive: false,
                      kActiveColor: Theme.of(context).colorScheme.secondary,
                      kNonActiveColor: Theme.of(context).unselectedWidgetColor,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
