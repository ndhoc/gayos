# Cấu Trúc Repo Nhị Phân

## Tiếng Việt

`repo/` dùng để lưu các binary package được build local và các file pacman database.

### Cấu Trúc Đề Xuất

```text
repo/
  x86_64/
  staging/
  testing/
```

Hiện tại các script build local đang hướng vào `repo/x86_64`.

## English

`repo/` stores locally built binary packages and pacman database files.

### Suggested Layout

```text
repo/
  x86_64/
  staging/
  testing/
```

Local build scripts currently target `repo/x86_64`.
