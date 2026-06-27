import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Gallery', style: AppTextStyles.title.copyWith(fontSize: 20)),
            TextButton(
              onPressed: () {},
              child: Text('View All (${images.length})', style: AppTextStyles.interactive),
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (_, _) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final image = images[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => GalleryPreviewScreen(image: image),
                    ),
                  );
                },
                child: Hero(
                  tag: image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      image,
                      width: 150,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class GalleryPreviewScreen extends StatelessWidget {
  const GalleryPreviewScreen({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: image,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Material(
                color: Colors.white24,
                shape: const CircleBorder(),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
