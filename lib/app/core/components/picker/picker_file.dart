// ignore_for_file: unnecessary_null_comparison, avoid_print

part of components_lib;

typedef OnFilePickerCallBack = Function(
    String filePath, String? filename, String? message);

class PickerFile extends StatelessWidget {
  const PickerFile({Key? key, required this.onSelect}) : super(key: key);

  final OnFilePickerCallBack onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 120,
      decoration: const BoxDecoration(
        color: Color(0xFF232323),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async => _pickPDF(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocalAssets.svg(folder),
                SizedBox(height: 6),
                Text('File',
                    style: TextStyle(fontSize: 12, color: Color(0xFFA3A3A3))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _pickPDF(BuildContext context) async {
    Get.back();
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.single;
        String? filePath = result.files.single.path;
        String? fileName = result.files.single.name;
        // Uint8List fileBytes = result.files.single.bytes ?? Uint8List(0);
        log("TERSELECT");
        if (file.size != null && file.size > 5 * 1024 * 1024) {
          onSelect('', '', 'Ukuran file lebih dari 5 MB');
        } else {
          onSelect(filePath ?? '', fileName, null);
        }
      } else {
        // Tangani ketika pengguna membatalkan pemilihan file
        print('Pengguna membatalkan pemilihan file.');
      }
    } catch (e) {
      print("Error picking PDF: $e");
    }
  }
}
