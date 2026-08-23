import 'dart:io';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/profile/application/bloc/profile_bloc.dart';
import 'package:rb_jewellers/profile/domain/kyc.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  KYCScreenState createState() => KYCScreenState();
}

class KYCScreenState extends State<KYCScreen> {
  File? _aadharFront;
  File? _aadharBack;
  File? _panFront;
  File? _panBack;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, String type) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        switch (type) {
          case 'aadharFront':
            _aadharFront = File(pickedFile.path);
            break;
          case 'aadharBack':
            _aadharBack = File(pickedFile.path);
            break;
          case 'panFront':
            _panFront = File(pickedFile.path);
            break;
          case 'panBack':
            _panBack = File(pickedFile.path);
            break;
        }
      });
    }
  }

  RxBool kycUploaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.kycSubmitFailedOrSuccess.fold(
          () {},
          (either) {
            either.fold((failure) {
              FlushbarHelper.createError(
                message: failure.maybeMap(
                  unexpected: (e) => 'Unexpected Error\n${e.message}',
                  orElse: () => '',
                ),
              ).show(context);
            }, (unit) {
              toastMessage('KYC data uploaded');
              Get.back();
            });
          },
        );
      },
      builder: (context, state) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              leading: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: primaryColor,
                  ),
                ),
              ),
              titleSpacing: 0,
              title: Text(
                'KYC',
                style: titleText,
              ),
              backgroundColor: secondaryColor, // Customize as needed
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.kycResponseFailedOrSuccess.fold(() => Container(),
                        (either) {
                      return either.fold((failure) {
                        kycUploaded.value = false;
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text('Upload KYC',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        );

                        // SizedBox(
                        //   height: screenHeight / 4,
                        //   width: screenWidth,
                        //   child: CommonServerErrorWidget('Failure', () {
                        //     context
                        //         .read<ProfileBloc>()
                        //         .add(const ProfileEvent.getKYC());
                        //   }),
                        // );
                      }, (KYC kyc) {
                        kycUploaded.value = true;
                        return Column(
                          children: [
                            ImageWidget(
                              title: 'Aadhar Front',
                              imageUrl: kyc.aadharFront,
                            ),
                            ImageWidget(
                              title: 'Aadhar Back',
                              imageUrl: kyc.aadharBack,
                            ),
                            ImageWidget(
                              title: 'PAN Front',
                              imageUrl: kyc.panFront,
                            ),
                            ImageWidget(
                              title: 'PAN Back',
                              imageUrl: kyc.panBack,
                            ),
                          ],
                        );
                      });
                    }),
                    kycUploaded.value
                        ? Container()
                        : Column(
                            children: [
                              _buildImageSection(
                                  'Aadhar Front', _aadharFront, 'aadharFront'),
                              _buildImageSection(
                                  'Aadhar Back', _aadharBack, 'aadharBack'),
                              _buildImageSection(
                                  'PAN Front', _panFront, 'panFront'),
                              _buildImageSection(
                                  'PAN Back', _panBack, 'panBack'),
                              thickSpace,
                              thickSpace,
                              thickSpace,
                              thickSpace,
                              SizedBox(
                                // width: double.infinity,
                                height: screenWidth * .6 / 5,
                                child: AppButtonWidget(
                                  onTap: () {
                                    if (_aadharFront == null) {
                                      toastMessage('Upload Aadhar front image');
                                      return;
                                    }
                                    if (_aadharBack == null) {
                                      toastMessage('Upload Aadhar back image');
                                      return;
                                    }
                                    if (_panFront == null) {
                                      toastMessage('Upload PAN front image');
                                      return;
                                    }
                                    if (_panBack == null) {
                                      toastMessage('Upload PAN back image');
                                      return;
                                    }

                                    context.read<ProfileBloc>().add(
                                          ProfileEvent.uploadKYC(
                                            _aadharFront,
                                            _aadharBack,
                                            _panFront,
                                            _panBack,
                                          ),
                                        );
                                  },
                                  buttonText: 'Upload KYC',
                                ),
                              ),
                              thickSpace,
                              thickSpace,
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection(String title, File? image, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            image != null
                ? Image.file(image, width: 100, height: 100, fit: BoxFit.cover)
                : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child:
                        const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
            const SizedBox(width: 10),
            SizedBox(
              // width: double.infinity,
              // height: screenWidth * .6 / 5,
              child: AppButtonWidget(
                onTap: () => _pickImage(ImageSource.gallery, type),
                buttonText: 'Pick Image',
              ),
            ),
            thickSpace,
            SizedBox(
              // width: double.infinity,
              // height: screenWidth * .6 / 5,
              child: AppButtonWidget(
                onTap: () => _pickImage(ImageSource.camera, type),
                buttonText: 'Capture',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imageUrl,
    required this.title,
  });
  final String title;

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth,
          child: Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        thickSpace,
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
