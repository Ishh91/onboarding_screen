import 'package:flutter/material.dart';
import 'package:onboarding_screen/app_styles.dart';
import 'package:onboarding_screen/model/onboard_data.dart';
import 'package:onboarding_screen/size_configs.dart';
import './pages.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double siezH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage == value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Text(
                      onboardingContents[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Container(
                      height: sizeV * 50,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: kBodyText1,
                        children: [
                          TextSpan(text: 'WE CAN '),
                          TextSpan(
                              text: 'HELP YOU ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              )),
                          TextSpan(text: 'TO BE A BETTER '),
                          TextSpan(text: 'VERSION OF '),
                          TextSpan(
                            text: 'YOURSELF ',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? MyTextButton(buttonName: 'Get Started', onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage())
                        );
                  }, bgColor: kPrimaryColor,)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OnBoardNavBtn(
                              name: 'Skip',
                              onPressed: () {},
                            ),
                            Row(
                              children: List.generate(onboardingContents.length,
                                  (index) => dotIndicator(index)),
                            ),
                            OnBoardNavBtn(
                                name: 'Next',
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }),
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


class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  final String name;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors.black12,
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            name,
            style: kBodyText1,
          ),
        ));
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, required this.buttonName, required this.onPressed, required this.bgColor}) : super(key: key);

  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeH! * 100 ,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(
              backgroundColor: bgColor),
        ),
      ),
    );
  }
}

