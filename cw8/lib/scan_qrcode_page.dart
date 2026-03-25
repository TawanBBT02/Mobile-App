import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrcodePage extends StatefulWidget {
  const ScanQrcodePage({super.key});

  @override
  State<ScanQrcodePage> createState() => _ScanQrcodePageState();
}

class _ScanQrcodePageState extends State<ScanQrcodePage>
    with SingleTickerProviderStateMixin {
  String _scanResult = 'No data';
  bool _isScanning = false;
  bool _qrOnly = true;

  final MobileScannerController _controller = MobileScannerController();

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _startScan({required bool qrOnly}) async {
    setState(() {
      _isScanning = true;
      _qrOnly = qrOnly;
    });

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text(
              'Scanning',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.pink,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: const Icon(Icons.flash_on),
                onPressed: _controller.toggleTorch,
              ),
              IconButton(
                icon: const Icon(Icons.cameraswitch),
                onPressed: _controller.switchCamera,
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final double overlayWidth = constraints.maxWidth * 0.8;
              final double overlayHeight = constraints.maxHeight * 0.4;

              final Rect window = Rect.fromCenter(
                center: Offset(
                  constraints.maxWidth / 2,
                  constraints.maxHeight / 2,
                ),
                width: overlayWidth,
                height: overlayHeight,
              );

              return Stack(
                fit: StackFit.expand,
                children: [
                  MobileScanner(
                    controller: _controller,
                    fit: BoxFit.cover,
                    scanWindow: window,
                    onDetect: (capture) {
                      final barcode = capture.barcodes.first;

                      if (_qrOnly && barcode.format != BarcodeFormat.qrCode) {
                        return;
                      }

                      final String? code = barcode.rawValue;
                      if (code == null) return;

                      setState(() {
                        _scanResult = code;
                      });

                      Navigator.pop(context);
                    },
                  ),
                  IgnorePointer(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: _ScannerOverlayPainter(
                            window: window,
                            animationValue: _animationController.value,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );

    if (!mounted) return;
    setState(() {
      _isScanning = false;
    });
  }

  Widget _buildButton(String text, VoidCallback? onPressed) {
    return Container(
      width: 230,
      height: 55,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.pink, Colors.pinkAccent],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'QR & Barcode Scanner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              'Start QR Scan',
              _isScanning ? null : () => _startScan(qrOnly: true),
            ),
            const SizedBox(height: 20),
            _buildButton(
              'Start Barcode Scan',
              _isScanning ? null : () => _startScan(qrOnly: false),
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Scan Result",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _scanResult,
                      style: const TextStyle(fontSize: 16, color: Colors.pink),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  const _ScannerOverlayPainter({
    required this.window,
    required this.animationValue,
  });

  final Rect window;
  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    final Path background = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectXY(window, 16, 16))
      ..fillType = PathFillType.evenOdd;

    final dimPaint = Paint()..color = Colors.black.withOpacity(0.6);
    canvas.drawPath(background, dimPaint);

    final borderPaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRRect(RRect.fromRectXY(window, 16, 16), borderPaint);

    final lineY = window.top + (window.height * animationValue);

    final linePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.transparent, Colors.red, Colors.transparent],
      ).createShader(Rect.fromLTWH(window.left, lineY, window.width, 4))
      ..strokeWidth = 4;

    canvas.drawLine(
      Offset(window.left + 12, lineY),
      Offset(window.right - 12, lineY),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScannerOverlayPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.window != window;
  }
}
