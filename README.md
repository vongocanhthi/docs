# Docs – Điều khoản & Chính sách (GitHub Pages)

Trang web Flutter liệt kê link **Điều khoản sử dụng** và **Chính sách bảo mật** cho các app. Host trên GitHub Pages, không cần domain riêng.

## Chạy local

```bash
flutter pub get
flutter run -d chrome
```

## Deploy lên GitHub Pages

1. Build với `base-href` đúng với repo của bạn:
   - Nếu repo là **`<username>.github.io/docs`** (site nằm tại `/docs/`):
     ```bash
     flutter build web --base-href "/docs/"
     ```
   - Nếu repo là **`<username>.github.io`** (site tại root):
     ```bash
     flutter build web --base-href "/"
     ```

2. Thư mục cần deploy: **`build/web/`** (gồm `index.html`, `terms.html`, `privacy.html`, `main.dart.js`, ...).

3. Trên GitHub: **Settings → Pages → Source** chọn branch (vd. `main`) và thư mục chứa `build/web` (dùng GitHub Actions hoặc copy nội dung `build/web` vào branch `gh-pages` / folder `/docs` tùy cách bạn cấu hình).

## Link legal cho app Nông Trại Gà

- **Điều khoản:** `https://<username>.github.io/docs/terms.html`  
- **Chính sách:** `https://<username>.github.io/docs/privacy.html`

Sau khi deploy, trong project **ChickenFarm** cập nhật `lib/utils/app_urls.dart`: thay `YOUR_GITHUB_USERNAME` bằng GitHub username thật để app mở đúng link khi user bấm Điều khoản / Chính sách.
# docs
