import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vocabyte/domains/entry/page_1.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:flutter/material.dart';

class PageOnboard extends StatefulWidget {
  const PageOnboard({required this.onStart, super.key});
  final Function() onStart;

  @override
  State<PageOnboard> createState() => _State();
}

class _State extends State<PageOnboard> {
  late PageController _pageController;
  final tag = 'PageEntry';

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var size = MediaQuery.of(context).size;
      return SafeArea(
          child: Container(
              color: Theme.of(context).colorScheme.baseColor1,
              width: size.width,
              height: size.height,
              child: Column(children: [
                Expanded(
                    child: PageView.builder(
                        itemCount: EntyryType.values.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          switch (EntyryType.values[index]) {
                            case EntyryType.first:
                              return Page1(
                                  type: EntyryType.values[index],
                                  key: ValueKey(EntyryType.values[index]),
                                  iconPath: 'assets/pig_pos_1.png',
                                  header: 'Practice English with VocaByte',
                                  description:
                                      'The spaced repetition method will help you learn new words, and examples will help you remember words using context',
                                  onSkip: () {
                                    _pageController.jumpToPage(index + 1);
                                  },
                                  onStart: () {
                                    widget.onStart();
                                  });
                            case EntyryType.book:
                              return Page1(
                                  type: EntyryType.values[index],
                                  key: ValueKey(EntyryType.values[index]),
                                  iconPath: 'assets/book.png',
                                  header: '1. Read books or watch movies',
                                  description:
                                      'Whenever you encounter words you don\'t know, just open the app',
                                  onSkip: () {
                                    _pageController.jumpToPage(index + 1);
                                  });
                            case EntyryType.seacrh:
                              return Page1(
                                  type: EntyryType.values[index],
                                  key: ValueKey(EntyryType.values[index]),
                                  iconPath: 'assets/search.png',
                                  header: '2. Search the words',
                                  description:
                                      'Find a word in the search, listen and see its meaning and examples',
                                  onSkip: () {
                                    _pageController.jumpToPage(index + 1);
                                  });
                            case EntyryType.study:
                              return Page1(
                                  type: EntyryType.values[index],
                                  key: ValueKey(EntyryType.values[index]),
                                  iconPath: 'assets/thought.png',
                                  header:
                                      '3. VocaByte will keep track of the word',
                                  description:
                                      'If after this you still feel that you do not know the word, click the "Should learn" button and the word will be added to your study',
                                  onStart: () {
                                    widget.onStart();
                                  });
                          }
                        })),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                              controller: _pageController,
                              count: EntyryType.values.length,
                              effect: WormEffect(
                                  dotColor: Theme.of(context)
                                      .colorScheme
                                      .buttonOption1,
                                  activeDotColor: Theme.of(context)
                                      .colorScheme
                                      .buttonOption2))
                        ]))
              ])));
    });
  }
}
