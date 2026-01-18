import 'package:flutter/material.dart';
import '../styles/color.dart';
import '../styles/typo.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrActionRow extends StatelessWidget {
  const QrActionRow({
    super.key,
    this.qrData,                // если есть строка/ID юзера -> генерим QR
    this.qrImageAsset,          // если хочешь просто картинку QR
    required this.scanIconAsset, // PNG иконка сканера из Figma
    this.onQrTap,
    this.onScanTap,
  });

  final String? qrData;
  final String? qrImageAsset;
  final String scanIconAsset;
  final VoidCallback? onQrTap;
  final VoidCallback? onScanTap;

  @override
  Widget build(BuildContext context) {
    // Figma width 292 при left 16 на экране 375.
    // В Flutter делаем так: максимум 292, но не больше ширины экрана - 32.
    final maxWidth = MediaQuery.sizeOf(context).width - 32;
    final width = maxWidth < 292 ? maxWidth : 292;

    return Container(
      color: primaryColor,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: _Tile(
                  radius: 12,
                  background: white,
                  onTap: onQrTap,
                  child: _QrContent(
                    qrData: qrData,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Scanner block
              SizedBox(
                width: 160,
                height: 120,
                child: Material(
                  color: purple2,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: onScanTap,
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            scanIconAsset,
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            'Сканер',
                            style: actionPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.child,
    required this.background,
    required this.radius,
    this.onTap,
  });

  final Widget child;
  final Color background;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: child,
        ),
      ),
    );
  }
}

class _QrContent extends StatelessWidget {
  const _QrContent({required this.qrData});

  final String? qrData;

  @override
  Widget build(BuildContext context) {
    final data = (qrData == null || qrData!.isEmpty) ? 'demo-user' : qrData!;

    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: 104,
      backgroundColor: white,
      eyeStyle: QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: darkPurple, 
      ),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.circle,
        color: darkPurple,             
      ),
    );
  }
}
