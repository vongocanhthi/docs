import '../models/app_info.dart';

/// Danh sách ứng dụng – mỗi app có link Điều khoản sử dụng và Chính sách bảo mật.
List<AppInfo> get appsData => [
      // ChickenFarm – Nông Trại Gà. URL: /docs/<id>/terms.html, /docs/<id>/privacy.html
      const AppInfo(
        id: 'chicken-farm',
        name: 'Nông Trại Gà',
        termsUrl: 'chicken-farm/terms.html',
        privacyUrl: 'chicken-farm/privacy.html',
      ),
      // Thêm app: tạo web/<tên-app>/terms.html + privacy.html, rồi thêm AppInfo với id = tên-app.
    ];
