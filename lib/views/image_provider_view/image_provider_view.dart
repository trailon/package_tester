import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/blueprints/base_page_view.dart';
import 'image_provider_viewmodel.dart';

@RoutePage(name: 'imageProviderViewRoute')
class ImageProviderView extends StatelessWidget {
  const ImageProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageProviderViewModel(),
      builder: (context, _) {
        return BasePageView<ImageProviderViewModel>(
          appBar: AppBar(
            title: const Text('Image Provider View'),
          ),
          content: const _ViewContent(),
        );
      },
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Center(
          child: ElevatedButton(
            onPressed:
                context.read<ImageProviderViewModel>().imageProviderTrigger,
            child: const Text('Image Provider Package Test'),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 9,
            child: GridView.count(
                crossAxisCount: 4,
                children: context
                        .watch<ImageProviderViewModel>()
                        .imageExportResult
                        ?.images
                        .map((e) => Image.memory(e!.data!))
                        .toList() ??
                    [])),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
