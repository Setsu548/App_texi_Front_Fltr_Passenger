import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends HookWidget {
  final XFile? initialImage;
  final ValueChanged<XFile>? onPhotoCaptured; 

  const ProfileImagePicker({
    super.key,
    this.initialImage,
    this.onPhotoCaptured,
  });

  @override
  Widget build(BuildContext context) {
    final image = useState<XFile?>(initialImage);
    final picker = ImagePicker();

    Future<void> captureImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image.value = pickedFile;
        onPhotoCaptured?.call(pickedFile); // 📤 Notifica al padre
      }
    }

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (initialImage == null) ...[
            Icon(Icons.camera_alt, size: 50, color: Colors.black54),
            SizedBox(height: 10),
            Text(
              "Sube una foto para tu perfil (Opcional)",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[100],
                foregroundColor: Colors.black,
              ),
              onPressed: captureImage,
              child: Text("Seleccionar imagen"),
            ),
          ] else ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(image.value!.path),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[100],
                foregroundColor: Colors.black,
              ),
              onPressed: captureImage,
              child: Text("Cambiar imagen"),
            ),
          ]
        ],
      ),
    );
  }
}
