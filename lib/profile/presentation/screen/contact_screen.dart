import 'package:flutter/material.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  ContactUsScreenState createState() => ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade200,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,

          // color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Contact Us',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                      'Don\'t hesistate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 20,
                        child: InkWell(
                          onTap: () async {
                            makePhoneCall('(+91) 8167495756');
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusGeometry.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 21),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Image.asset(
                                      'assets/icons/telephone-call.png',
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Call Us',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w900)),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '11:30 am - 06:30 pm (Except Thursday)',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 2 - 20,
                        child: InkWell(
                          onTap: () async {
                            final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: 'rbjewellers2407@gmail.com');

                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri);
                            } else {
                              throw 'Could not launch dialer';
                            }
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusGeometry.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 21),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Image.asset(
                                      'assets/icons/gmail.png',
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Email Us',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w900)),
                                  const SizedBox(height: 8),
                                  const Text(
                                      '11:30 am - 06:30 pm (Except Thursday)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text('Address',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                      '423/41, Sahabharangbazar, Midnapore,\nWest Medinipur- 721101, WB, India.',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 32),
                  const Text('Contact us in Social Media',
                      style: TextStyle(fontSize: 16)),
                  // FaIcon(FontAwesomeIcons.magnifyingGlass),
                  const SizedBox(height: 8),
                  ListTile(
                    onTap: () => _launchWebsite('https://rbjeweller.in/'),
                    contentPadding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: const BorderSide()),
                    leading: Image.asset('assets/icons/internet.png'),
                    title: const Text(
                      'Website',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // subtitle: const Text('Official Website'),
                    trailing: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.link,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    onTap: () => _launchWebsite(
                        'https://www.instagram.com/rbjewellersmedinipur/'),
                    contentPadding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: const BorderSide()),
                    leading: Image.asset(
                      'assets/icons/instagram.png',
                    ),
                    title: const Text(
                      'Instagram',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.link,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  ListTile(
                    onTap: () => _launchFacebook(),
                    contentPadding: const EdgeInsets.all(9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: const BorderSide()),
                    leading: Image.asset('assets/icons/facebook.png'),
                    title: const Text(
                      'Facebook',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.link,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    onTap: () => openWhatsAppChat('+918167495756'),
                    contentPadding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        side: const BorderSide()),
                    leading: Image.asset(
                      'assets/icons/whatsapp.png',
                    ),
                    title: const Text(
                      'Whatsapp',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.link,
                      ),
                    ),
                  ),
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       const SizedBox(
                  //         width: 15,
                  //       ),
                  //       InkWell(
                  //           onTap: () {
                  //             makePhoneCall('+918167495756');
                  //           },
                  //           child: const Icon(
                  //             Icons.call,
                  //             size: 30,
                  //           )),
                  //       const SizedBox(
                  //         width: 20,
                  //       ),
                  //       InkWell(
                  //           onTap: () {
                  //             openWhatsAppChat('+918167495756');
                  //           },
                  //           child: Image.asset(
                  //             'assets/icons/whatsapp.png',
                  //             height: 30,
                  //             width: 30,
                  //           )),
                  //       const SizedBox(
                  //         width: 20,
                  //       ),
                  //       InkWell(
                  //           onTap: () {},
                  //           child: Image.asset(
                  //             'assets/icons/ic_facebook.png',
                  //             height: 30,
                  //             width: 30,
                  //           )),
                  //       const SizedBox(
                  //         width: 20,
                  //       ),
                  //       InkWell(
                  //           onTap: () {
                  //             _launchWebsite();
                  //           },
                  //           child: Image.asset(
                  //             'assets/icons/ic_web.png',
                  //             height: 30,
                  //             width: 30,
                  //           ))
                  //     ],
                  //   ),
                  // ],
                ]),
          ),
        ),
      ),
    );
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch dialer';
    }
  }

  Future<void> openWhatsAppChat(String phone) async {
    final uri = Uri.parse(
      'https://wa.me/$phone',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  Future<void> _launchFacebook() async {
    final Uri url = Uri.parse(
        'https://www.facebook.com/rbjewellersmedinipur/'); // Replace with your link
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchWebsite(String link) async {
    final Uri url = Uri.parse(link); // 🔗 Replace with your URL
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
