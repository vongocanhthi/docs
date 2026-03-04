# Docs – Điều khoản & Chính sách (GitHub Pages)

Trang web Flutter liệt kê link **Điều khoản sử dụng** và **Chính sách bảo mật** cho các app. Host trên GitHub Pages, không cần domain riêng.

## Chạy local

```bash
flutter pub get
flutter run -d chrome
```

## Deploy lên GitHub Pages

### Bước 1: Build Flutter web

Repo **docs** → site sẽ ở `https://<username>.github.io/docs/`, nên dùng `base-href "/docs/"`:

```bash
cd /path/to/docs
flutter pub get
flutter build web --base-href "/docs/"
```

Kết quả nằm trong **`build/web/`** (có `index.html`, `main.dart.js`, `chicken-farm/terms.html`, `chicken-farm/privacy.html`, ...).

---

### Bước 2: Đưa nội dung build lên GitHub

Chọn **một** trong hai cách.

**Cách A – Deploy từ branch `main`, thư mục `/docs`**

1. Copy **toàn bộ nội dung** trong `build/web/` vào một thư mục tên **`docs`** ngay tại root của repo (cùng cấp với `lib/`, `web/`).  
   Ví dụ: `docs/index.html`, `docs/main.dart.js`, `docs/chicken-farm/terms.html`, ...
2. Commit và push:
   ```bash
   git add docs/
   git commit -m "Deploy web to GitHub Pages"
   git push origin main
   ```
3. Trên GitHub: vào repo → **Settings** → **Pages** (menu trái).
4. Phần **Build and deployment**:
   - **Source:** chọn **Deploy from a branch**.
   - **Branch:** chọn **main**, **Folder:** chọn **/docs**.
   - Bấm **Save**.
5. Đợi vài phút, site sẽ có tại: `https://<username>.github.io/docs/`.

**Cách B – Deploy từ branch `gh-pages`, thư mục gốc**

1. Build xong, copy nội dung `build/web/` sang một thư mục tạm (vd. `../docs-deploy`). Tạo branch `gh-pages`, đặt nội dung đó làm root rồi push:
   ```bash
   cp -r build/web ../docs-deploy
   git checkout --orphan gh-pages
   git rm -rf . 2>/dev/null || true
   cp -r ../docs-deploy/* .
   git add .
   git commit -m "Deploy GitHub Pages"
   git push -u origin gh-pages
   git checkout main
   ```
2. Trên GitHub: **Settings** → **Pages** → **Build and deployment**:
   - **Source:** **Deploy from a branch**.
   - **Branch:** **gh-pages**, **Folder:** **/ (root)**.
   - Bấm **Save**.
3. Site: `https://<username>.github.io/docs/`.

---

### Bước 3: Kiểm tra

- Mở `https://<username>.github.io/docs/` → thấy trang Điều khoản & Chính sách.
- Thử link: `https://<username>.github.io/docs/chicken-farm/terms.html` và `.../chicken-farm/privacy.html`.

Sau mỗi lần sửa code và build lại, làm lại **Bước 2** (cập nhật nội dung trong `docs/` hoặc branch `gh-pages`) rồi push.

## Cấu trúc URL (mỗi app một path)

- **Mẫu:** `https://<username>.github.io/docs/<tên-app>/terms.html` và `.../docs/<tên-app>/privacy.html`
- **Ví dụ Nông Trại Gà:**  
  - Điều khoản: `https://<username>.github.io/docs/chicken-farm/terms.html`  
  - Chính sách: `https://<username>.github.io/docs/chicken-farm/privacy.html`

Thêm app mới: tạo thư mục `web/<tên-app>/` với `terms.html` và `privacy.html`, rồi thêm entry trong `lib/data/apps_data.dart` (id = tên-app, termsUrl = `<tên-app>/terms.html`, privacyUrl = `<tên-app>/privacy.html`).

Sau khi deploy, trong từng app (vd. ChickenFarm) cập nhật `lib/utils/app_urls.dart`: thay `YOUR_GITHUB_USERNAME` và `_appSlug` cho đúng.
