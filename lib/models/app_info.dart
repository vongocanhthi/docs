/// Thông tin một ứng dụng trong trang docs (Điều khoản + Chính sách).
class AppInfo {
  const AppInfo({
    required this.id,
    required this.name,
    required this.termsUrl,
    required this.privacyUrl,
  });

  final String id;
  final String name;
  final String termsUrl;
  final String privacyUrl;
}
