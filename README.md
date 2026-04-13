# report

LaTeX でレポートを作成するためのリポジトリです。  
現在は `4S_1` ディレクトリに本文一式があり、必要に応じて `graphs` 配下で Go と `gonum/plot` を使って図を生成できます。

## ディレクトリ構成

```text
4S_1/
  main.tex        レポート本体
  cover.tex       表紙
  part10.tex      本文
  part20.tex      本文
  part30.tex      本文
  ref.tex         参考文献
  Makefile        TeX ビルド用
  graphs/         図生成用の Go コード
```

## 必要な環境

- TeX Live
- `latexmk`
- `uplatex`
- `dvipdfmx`
- Go

この文書は `uplatex + dvipdfmx` を前提にしています。

## TeX のビルド

ルートディレクトリから、対象フォルダを指定して実行します。

```bash
make DIR=4S_1
```

生成物:

- `4S_1/main.pdf`

補助ファイルの削除:

```bash
make clean DIR=4S_1
```

PDF も含めて削除:

```bash
make distclean DIR=4S_1
```

対象フォルダが `4S_2` などに増えても、同じように指定できます。

```bash
make DIR=4S_2
```

フォルダに入って作業したい場合は、各ディレクトリ内の `Makefile` でもビルドできます。

```bash
cd 4S_1
make
```

## 図の生成

`4S_1/graphs` では Go と `gonum/plot` を使って図を生成できます。

依存関係の取得:

```bash
cd 4S_1/graphs
go mod tidy
```

サンプルの実行:

```bash
go run .
```

現在のサンプルでは `sin.png` を出力します。

## メモ

- TeX の補助ファイルは `.gitignore` で無視しています。
- `*.pdf` も無視しているため、ビルドした PDF は通常 Git 管理の対象になりません。
