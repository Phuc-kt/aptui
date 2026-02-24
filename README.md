# APTUI - APT Package Manager TUI

## English:

### Overview

**APTUI** is a terminal user interface (TUI) for searching and installing APT packages interactively using `fzf`. It provides a fast and intuitive way to find and install packages from the command line.

### Features

- 🔍 **Fast Search**: Search packages in real-time using fuzzy finding
- 📦 **Package Info**: Preview detailed package information before installation
- ✅ **Multi-Select**: Select multiple packages and install them at once
- 🎨 **User-Friendly**: Clean, intuitive TUI interface
- 🔐 **Safe**: Requires confirmation before installation

### Requirements

Before using APTUI, you need to install the following dependencies:

| Package              | Purpose                             |
| -------------------- | ----------------------------------- |
| `fzf`              | Fuzzy finder for interactive search |
| `apt-xapian-index` | APT package search backend          |

### Quick Installation

**Option 1: Automated Installation (Recommended)**

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/aptui/main/install.sh | bash
```

**Option 2: Manual Installation**

```bash
sudo apt update
sudo apt install -y fzf apt-xapian-index
sudo update-apt-xapian-index
sudo cp ./aptui /usr/local/bin/aptui
sudo chmod +x /usr/local/bin/aptui
```

### Usage

**Basic search:**

```bash
aptui
```

**Search with query:**

```bash
aptui firefox
```

**Installation workflow:**

1. Enter your search query (or press Enter for empty search)
2. Use arrow keys to navigate and Tab to select multiple packages
3. Press Enter when done selecting
4. Preview package information in the right panel
5. Confirm installation when prompted

### Requirements Summary

- **Linux distribution with APT** (Debian, Ubuntu, Linux Mint, etc.)
- **curl** (for automated installation)
- **sudo access** (required for installation)

---

## Tiếng Việt:

### Tổng Quan

**APTUI** là công cụ giao diện dòng lệnh (TUI) để tìm kiếm và cài đặt các gói APT một cách tương tác bằng `fzf`. Nó cung cấp một cách nhanh và trực quan để tìm và cài đặt gói từ dòng lệnh.

### Tính Năng

- 🔍 **Tìm Kiếm Nhanh**: Tìm kiếm gói theo thời gian thực bằng fuzzy finding
- 📦 **Thông Tin Gói**: Xem thông tin chi tiết về gói trước khi cài đặt
- ✅ **Chọn Nhiều**: Chọn và cài đặt nhiều gói cùng một lúc
- 🎨 **Thân Thiện**: Giao diện TUI sạch sẽ và dễ sử dụng
- 🔐 **An Toàn**: Yêu cầu xác nhận trước khi cài đặt

### Các Yêu Cầu Hệ Thống

Trước khi sử dụng APTUI, bạn cần cài đặt các phụ thuộc sau:

| Gói                 | Mục Đích                                          |
| -------------------- | ---------------------------------------------------- |
| `fzf`              | Công cụ tìm kiếm mờ cho tìm kiếm tương tác |
| `apt-xapian-index` | Công cụ tìm kiếm gói APT                        |

### Cài Đặt Nhanh

**Lựa Chọn 1: Cài Đặt Tự Động (Khuyến Nghị)**

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/aptui/main/install.sh | bash
```

**Lựa Chọn 2: Cài Đặt Thủ Công**

```bash
sudo apt update
sudo apt install -y fzf apt-xapian-index
sudo update-apt-xapian-index
sudo cp ./aptui /usr/local/bin/aptui
sudo chmod +x /usr/local/bin/aptui
```

### Cách Sử Dụng

**Tìm kiếm cơ bản:**

```bash
aptui
```

**Tìm kiếm với từ khóa:**

```bash
aptui firefox
```

**Quy trình cài đặt:**

1. Nhập từ khóa tìm kiếm (hoặc nhấn Enter để hiển thị tất cả gói)
2. Sử dụng các phím mũi tên để điều hướng và Tab để chọn nhiều gói
3. Nhấn Enter khi hoàn tất lựa chọn
4. Xem thông tin chi tiết gói ở bên phải
5. Xác nhận cài đặt khi được nhắc

### Yêu Cầu Hệ Thống

- **Bản phân phối Linux sử dụng APT** (Debian, Ubuntu, Linux Mint, v.v.)
- **curl** (để cài đặt tự động)
- **quyền sudo** (cần thiết để cài đặt)

---

## License

MIT
