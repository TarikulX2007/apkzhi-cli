#!/data/data/com.termux/files/usr/bin/bash
set -e

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
ROOT="${PREFIX}/share/apkzhi"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pkg install -y bash coreutils findutils sed grep gum openjdk-17
termux-setup-storage || true
mkdir -p "$ROOT" "$PREFIX/bin" /storage/emulated/0/apkbuilder
rm -rf "$ROOT/lib" "$ROOT/templates"
cp -a "$REPO_DIR/lib" "$REPO_DIR/templates" "$ROOT/"
cp "$REPO_DIR/apkzhi" "$ROOT/apkzhi"
cp "$REPO_DIR/LICENSE" "$ROOT/LICENSE"
cat > "$PREFIX/bin/apkzhi" <<'LAUNCHER'
#!/data/data/com.termux/files/usr/bin/bash
exec /data/data/com.termux/files/usr/share/apkzhi/apkzhi "$@"
LAUNCHER
chmod +x "$PREFIX/bin/apkzhi" "$ROOT/apkzhi"
chmod +x "$ROOT/templates"/*/gradlew 2>/dev/null || true
printf '\nInstalled apkzhi. Project root: /storage/emulated/0/apkbuilder\nRun: apkzhi\n'
