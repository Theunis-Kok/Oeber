import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:oeber/widgets/back_arrow.dart';

class CardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CardPageState();
  }
}

class CardPageState extends State<CardPage> {
  String cardNumber = '5555 55555 5555 4444';
  String expiryDate = '12/05';
  String cardHolderName = 'John Doe';
  String cvvCode = '123';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: <Widget>[
            const BackArrow(),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              bottom: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, i) => CreditCardWidget(
                  cardBgColor: Colors.orange,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  bankName: '',
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                ),
                itemCount: 5,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Add new card',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_forward),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
