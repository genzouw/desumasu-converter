# desumasu-converter

Command line filter to convert between Japanese ですます調(敬体) and である調(常体) each other.Able to use as module.

「です・ます調(敬体)」と「だ・である調（常態)」を変換するコマンドラインツールです。
標準入力から受け取った文章を標準出力に出力します。

## Install

```bash
$ git clone https://github.com/genzouw/desumasu-converter.git

$ cd desumasu-conveter/

$ make pack

$ ls dist
cli.js*  desumasu-converter.js*  LICENSE  package.json  README.md

$ echo "今日もいい天気だった。" | dist/cli.js -k
今日もいい天気でした。
```

If you want to avoid typing the long command ( "node dist/cli.js" ), you can use an alias like this:

```bash
$ alias dmc="/path/to/desumasu-conveter/dist/cli.js"

$ echo "今日もいい天気だった。" | dmc -k
今日もいい天気でした。
```

Alternatively, you can add the `dist/` directory to your `PATH` environment variable.

```bash
export PATH=$PATH:/path/to/desumasu-conveter/dist

$ echo "今日もいい天気だった。" | cli.js -k
今日もいい天気でした。
```

## Usage

```
desumasu-converter [<options>]
version 0.1.1
Copyright(c) 2019,kssfilo(https://kanasys.com/tech/)
「です・ます調(敬体)」と「だ・である調（常態)」を変換します。 標準入力から受け取った文章を標準出力に出力します。

オプション:
	-d:デバッグ出力(現在未使用)
	-j:「です・ます調(敬体)」を「だ・である調（常態)」に変換します(デフォルト)
	-k:「だ・である調（常態)」を「です・ます調(敬体)」に変換します
	-n: 語尾の「ね。」を削除しません。
	-N: 語尾に「ね。」がある場合は変換しません。(-nとは併用不可)

注意点:
	句読点、。と括弧()を区切りとして認識します。行末は区切りとして認識しませんので注意してください。

例:
	>cat example.txt
	今日は晴れてます。
	明日は曇りでしょうね。

	>cat example.txt | cli.js -j
	今日は晴れている。
	明日は曇りだろう。

	>cat example.txt | cli.js -jn
	今日は晴れている。
	明日は曇りだろうね。

	>cat example.txt | cli.js -jN
	今日は晴れている。
	明日は曇りでしょうね。

	>cat example2.txt
	今日は休みだ。
	明日も休みだろう。

	>cat example.txt | cli.js -k
	今日は晴れています。
	明日は曇りでしょう。

```

## Use as module

```
var DesumasuConverter=require('desumasu-converter');

desumasuConverter=new DesumasuConverter();

var text="きょうはいい天気ですね。";
var result=desumasuConverter.convert2joutai(text);
console.log(result);

//output:今日はいい天気だ。

var text2="きょうはいい天気だ。";
var result2=desumasuConverter.convert2keitai(text2);
console.log(result2);

//output:今日はいい天気です。

var result3=desumasuConverter.convert2joutai(text,{removeNe:false});
console.log(result3);
//output:今日はいい天気だね。

//See cli.coffee to know more options :)
```
