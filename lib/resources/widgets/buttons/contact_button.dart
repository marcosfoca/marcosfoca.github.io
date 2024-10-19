import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../colors.dart';
import '../contact_dialog_box.dart';

class ContactButton extends StatefulWidget {
  const ContactButton({super.key});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  _requestContact() {
    showDialog(context: context, builder: (context) => const ContactDialogBox());
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(defaultRed),
        foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
      ),
      onPressed: () {
        _requestContact();
      },
      child: Row(
        children: [
          const Icon(Icons.account_circle),
          SizedBox(width: 10),
          const Text("Contact", style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
