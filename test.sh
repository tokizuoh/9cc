#!/bin/bash

assert() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

# ステップ1: 整数1個をコンパイルする言語の作成
echo "- step 1"
assert 0 0
assert 42 42
echo ""

# ステップ2: 加減算のできるコンパイラの作成
echo "- step 2"
assert 21 "5+20-4"
assert 6 "7-1"
echo ""

# ステップ3：トークナイザを導入
echo "- step 3"
assert 41 " 12 + 34 - 5 "
assert 20 "8+2-45+55"
echo ""

echo OK
