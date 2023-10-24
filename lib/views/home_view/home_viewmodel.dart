import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_provider/image_provider.dart' as imgprov;
import 'package:package_tester/app/router/router.dart';

import '../../app/blueprints/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  @override
  void disposeModel() {}

  @override
  Future<void> getData() async {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setViewDidLoad(true);
      EasyLoading.showSuccess('It is homeview!');
    });
  }

  Future<void> pushToDetailView() async {
    await appRouter.push(const DetailViewRoute());
    debugPrint('Returned from Detail View');
  }

  Future<void> pushToImageProviderView() async {
    const widget = imgprov.RepositoryTypeSelectionWidget(
      title: Text("Resim Ekle"),
      cameraOption: Text("Kamera"),
      galleryOption: Text("Galeri"),
      backButton: Text("Geri"),
    );

    final imageProvider = imgprov.ImageProvider(context, widget: widget);

    final images = await imageProvider.getImages();

    if (images?.hasImage ?? false) {
      for (var img in images?.images ?? []) {
        debugPrint('Image: ${img.path}');
      }
    }

    notifyListeners();
  }
}
