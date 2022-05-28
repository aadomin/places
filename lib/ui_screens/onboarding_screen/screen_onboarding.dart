import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/onboarding_screen/widget_selected_page_indicator.dart';
import 'package:places/ui_screens/onboarding_screen/widgets_all_onboarding_pages.dart';

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
                  ? const SizedBox.shrink() // на последней кнопку не отображаем 
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
            padding: const EdgeInsets.only(bottom: 85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widgetsAllOnboardingPages.length; i++)
                  if (i == currentPage) ...[
                    WidgetSelectedPageIndicator(
                      isActive: true,
                      kActiveColor: Theme.of(context).colorScheme.secondary,
                      kNonActiveColor: Theme.of(context).unselectedWidgetColor,
                    )
                  ] else
                    WidgetSelectedPageIndicator(
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
