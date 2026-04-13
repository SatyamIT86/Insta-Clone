import 'dart:typed_data';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StorageMethods {
  // function to upload image to cloudinary
  Future<String> uploadImageToCloudinary(Uint8List file, bool isPost) async {
    try {
      final String cloudName = dotenv.get('CLOUDINARY_CLOUD_NAME');
      final String uploadPreset = dotenv.get(
        'CLOUDINARY_UPLOAD_PRESET',
        fallback: 'insta_preset',
      );

      final cloudinary = CloudinaryPublic(
        cloudName,
        uploadPreset,
        cache: false,
      );

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          file,
          identifier: 'profile_pic',
          folder: isPost ? 'posts' : 'profilePics',
        ),
      );

      return response.secureUrl;
    } catch (e) {
      print(e.toString());
      return "";
    }
  }
}
