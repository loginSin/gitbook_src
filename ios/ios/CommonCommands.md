# iOS 常见命令

## 统计代码行数

find . "(" -name "*.m" -or -name "*.mm" -or -name "*.cpp" -or -name "*.h" -or -name "*.rss" ")" -print | xargs wc -l

find . "(" -name "*.m" -or -name "*.mm" -or -name "*.cpp" -or -name "*.rss" ")" -print | xargs wc -l