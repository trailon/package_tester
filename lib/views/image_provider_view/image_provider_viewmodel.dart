import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_provider/image_provider.dart' as imgprov;

import '../../app/blueprints/base_viewmodel.dart';

class ImageProviderViewModel extends BaseViewModel {
  imgprov.ImageExport? imageExportResult;
  @override
  void disposeModel() {}

  @override
  Future<void> getData() async {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setViewDidLoad(true);
      EasyLoading.showSuccess('It is imageproviderview!');
    });
  }

  Future<void> imageProviderTrigger() async {
    const widget = imgprov.RepositoryTypeSelectionWidget(
      title: Text("Resim Ekle"),
      cameraOption: Text("Kamera"),
      galleryOption: Text("Galeri"),
      backButton: Text("Geri"),
    );

    final imageProvider = imgprov.ImageProvider(context, widget: widget);
    imageExportResult = await imageProvider.getImages(maxImage: 5);
    notifyListeners();
  }
}
