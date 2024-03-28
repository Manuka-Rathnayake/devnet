import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart' as dotted;
import 'package:flutter/material.dart';
import 'package:devnet2/core/constants/constants.dart';
import 'package:devnet2/core/utils.dart';
import 'package:devnet2/responsive/responsive.dart';
import 'package:devnet2/theme/pallete.dart';
import 'package:devnet2/responsive/responsive.dart';

class EditCommunityScreen extends StatefulWidget {
  final String name;
  const EditCommunityScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  _EditCommunityScreenState createState() => _EditCommunityScreenState();
}

class _EditCommunityScreenState extends State<EditCommunityScreen> {
  File? bannerFile;
  File? profileFile;
  Uint8List? bannerWebFile;
  Uint8List? profileWebFile;

  void selectBannerImage() async {
    // Implement image picking logic here
  }

  void selectProfileImage() async {
    // Implement image picking logic here
  }

  void saveCommunity() {
    // Implement save community logic here
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Edit Community'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => saveCommunity(),
            child: const Text('Save'),
          ),
        ],
      ),
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: selectBannerImage,
                      child: dotted.DottedBorder(
                        borderType: dotted.BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        color: currentTheme.textTheme.bodyText2!.color!,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: bannerWebFile != null
                              ? Image.memory(bannerWebFile!)
                              : bannerFile != null
                                  ? Image.file(bannerFile!)
                                  : const Center(
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40,
                                      ),
                                    ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: GestureDetector(
                        onTap: selectProfileImage,
                        child: profileWebFile != null
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(profileWebFile!),
                                radius: 32,
                              )
                            : profileFile != null
                                ? CircleAvatar(
                                    backgroundImage: FileImage(profileFile!),
                                    radius: 32,
                                  )
                                : const CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                      ),
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
}

// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:devnet2/core/constants/constants.dart';
// import 'package:devnet2/core/utils.dart';
// import 'package:dotted_border/dotted_border.dart' as dotted;

// class EditCommunityScreen extends StatefulWidget {
//   final String name;
//   const EditCommunityScreen({
//     Key? key,
//     required this.name,
//   }) : super(key: key);

//   @override
//   _EditCommunityScreenState createState() => _EditCommunityScreenState();
// }

// class _EditCommunityScreenState extends State<EditCommunityScreen> {
//   File? bannerFile;
//   File? profileFile;
//   Uint8List? bannerWebFile;
//   Uint8List? profileWebFile;

//   void selectBannerImage() async {
//     // Implement image picking logic here
//   }

//   void selectProfileImage() async {
//     // Implement image picking logic here
//   }

//   void saveCommunity() {
//     // Implement save community logic here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Community'),
//         centerTitle: false,
//         actions: [
//           TextButton(
//             onPressed: () => saveCommunity(),
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final currentTheme = Theme.of(context);
//           final double imageWidth = constraints.maxWidth * 0.9;
//           final double imageHeight = constraints.maxHeight * 0.3;

//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: imageHeight,
//                   child: Stack(
//                     children: [
//                       GestureDetector(
//                         onTap: selectBannerImage,
//                         child: dotted.DottedBorder(
//                           borderType: dotted.BorderType.RRect,
//                           radius: const Radius.circular(10),
//                           dashPattern: const [10, 4],
//                           strokeCap: StrokeCap.round,
//                           color: currentTheme.textTheme.bodyText2!.color!,
//                           child: Container(
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: bannerWebFile != null
//                                 ? Image.memory(bannerWebFile!)
//                                 : bannerFile != null
//                                     ? Image.file(
//                                         bannerFile!,
//                                         width: imageWidth,
//                                         height: imageHeight,
//                                       )
//                                     : const Center(
//                                         child: Icon(
//                                           Icons.camera_alt_outlined,
//                                           size: 40,
//                                         ),
//                                       ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 20,
//                         left: 20,
//                         child: GestureDetector(
//                           onTap: selectProfileImage,
//                           child: profileWebFile != null
//                               ? CircleAvatar(
//                                   backgroundImage: MemoryImage(profileWebFile!),
//                                   radius: 32,
//                                 )
//                               : profileFile != null
//                                   ? CircleAvatar(
//                                       backgroundImage: FileImage(profileFile!),
//                                       radius: 32,
//                                     )
//                                   : const CircleAvatar(
//                                       radius: 32,
//                                       backgroundColor: Colors.grey,
//                                       child: Icon(
//                                         Icons.person,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
