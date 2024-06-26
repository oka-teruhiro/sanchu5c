import 'package:flutter/material.dart';

import '../kaisetu/tenti_tokugou.dart';
import '../nikkan/nikkan_hinoe.dart';
import '../nikkan/nikkan_hinoto.dart';
import '../nikkan/nikkan_kanoe.dart';
import '../nikkan/nikkan_kanoto.dart';
import '../nikkan/nikkan_kinoe.dart';
import '../nikkan/nikkan_kinoto.dart';
import '../nikkan/nikkan_mizunoe.dart';
import '../nikkan/nikkan_mizzunoto.dart';
import '../nikkan/nikkan_tutinoe.dart';
import '../nikkan/nikkan_tutinoto.dart';
import 'kansuu.dart';
import 'meisiki_page4.dart';

class Output4 extends StatefulWidget {
  const Output4({
    super.key,
    required this.titleSeinengappi,
  });

  final String titleSeinengappi;

  @override
  State<Output4> createState() => _Output4State();
}

class _Output4State extends State<Output4> {
  //■■　変数初期設定　■■
  String titleSeinengappi = '';
  int nikkan = -1;
  String jukkan = "甲乙丙丁戊己庚辛壬癸"; //十干リスト
  String jukkanYomi = "甲【きのえ】　乙【きのと】　丙【ひのえ】　丁【ひのと】　戊【つちのえ】"
      "己【つちのと】庚【かのえ】　辛【かのと】　壬【みずのえ】癸【みずのと】"; //十干リスト【よみ】
  String juunisi = "子丑寅卯辰巳午未申酉戌亥"; //十二支リスト
  String rokujukkansi = "甲子乙丑丙寅丁卯戊辰己巳庚午辛未壬申癸酉"
      "甲戌乙亥丙子丁丑戊寅己卯庚辰辛巳壬午癸未"
      "甲申乙酉丙戌丁亥戊子己丑庚寅辛卯壬辰癸巳"
      "甲午乙未丙申丁酉戊戌己亥庚子辛丑壬寅癸卯"
      "甲辰乙巳丙午丁未戊申己酉庚戌辛亥壬子癸丑"
      "甲寅乙卯丙辰丁巳戊午己未庚申辛酉壬戌癸亥"; //
  int seinen = 1920;
  int seigatu = 1;
  int seiniti = 1;
  int setuirinen = 1920;
  int setuirigatu = 1;
  int setuiriniti = 1;
  int setuiriji = 0;
  int setuirihun = 0;
  int setuirinitisuu = 0;
  String nenchu = '甲子';
  String gechu = '甲子';
  String nichu = '甲子';
  int nichuNo = 0;
  List<int> tenun = [0, 0, 0, 0, 0, 0, 0];
  List<int> tenunNen = [1900, 1901, 1902, 1903, 1904, 1905, 1906];
  List<int> tenunNenrei = [0, 0, 0, 0, 0, 0, 0];
  List<int> tenunMei = [1, 1, 1, 1, 1, 1, 1];
  List<String> tenunMeiMoji = [
    '干支併臨',
    '干支併臨',
    '干支併臨',
    '干支併臨',
    '干支併臨',
    '干支併臨',
    '干支併臨'
  ];
  List<String> tenunKansi = ['甲子', '甲子', '甲子', '甲子', '甲子', '甲子', '甲子'];
  List<String> tenunText = ['1', '2', '3', '4', '5', '6', '7'];
  String seinenMoji = '1900';
  String seigatuMoji = '01';
  String seinitiMoji = '01';
  String seinengappiMoji = '1900-01-01';
  String jukkanNameYomi = 'きのえ';
  String nikkanMoji = "甲";
  String nissiMoji = '子';
  String tokugouTenMoji = '甲';
  String tokugouTiMoji = '子';
  String tentiTokugouMoji = '甲子';
  int nissi = -1;

  // statefullWidget に変更するため追加
  int _counter = 0;
  double setuiriButtonWidth = 0;
  int zenGo = 2; //0:節入り時刻後　1:節入り時刻前 2:節入り日以外
  List<int> iroBotan = [-14575885, -12627531, -14575885];
  List<int> iroTitle = [-1294214, -5767189, -1294214];
  List<String> botanMoji = ['節入り時刻前', '節入り時刻後', '節入り時刻前'];
  List<String> meisikiTitle = ['節入り時刻後の天運の年', '節入り時刻前の天運の年', 'あなたの天運の年は'];
  List<int> nenchuNo = [1, 0, 1];
  List<int> gechuNo = [1, 0, 1];
  int nenchuNoH = 0;
  int gechuNoH = 0;
  String nenchuS = '甲子';
  String gechuS = '甲子';

  void _incrementCounter() {
    setState(() {
      _counter++;
      zenGo = _counter % 2;
    });
  }
  // statefullWidget に追加するために追加　ここまで

  @override
  Widget build(BuildContext context) {
    //
    titleSeinengappi = widget.titleSeinengappi;

    //■■画面生成のための各種データを生成する■■
    //　受けっとった　生年月日をタイトル型から文字列に変換する
    seinenMoji = titleSeinengappi.substring(0, 4);
    seigatuMoji = titleSeinengappi.substring(5, 7);
    seinitiMoji = titleSeinengappi.substring(8, 10);
    seinengappiMoji = '$seinenMoji-$seigatuMoji-$seinitiMoji';

    // 新しい関数の試験をする
    seinen = int.parse(seinenMoji); // 生年
    seigatu = int.parse(seigatuMoji); // 生月
    seiniti = int.parse(seinitiMoji); // 生日
    // 関数meisikiAで、命式・節入り年月日時分・節入り日からの日数を算出する
    String x = meisikiA(seinen, seigatu, seiniti);
    // 出力から必要データを取り出す
    nikkanMoji = x.substring(4, 5); // 日干の文字
    nissiMoji = x.substring(5, 6); // 日支の文字
    nikkan = juKanNo(nikkanMoji); // 日干No.
    nissi = juuniSiNo(nissiMoji); // 日支No.
    setuirinitisuu = int.parse(x.substring(19, 21)); // 節入り日からの日数
    nenchu = x.substring(0, 2); // 年柱の文字
    gechu = x.substring(2, 4); //  月柱の文字
    nichu = x.substring(4, 6); //  日柱の文字
    setuirinen = int.parse(x.substring(6, 10)); //   節入り年の数字
    setuirigatu = int.parse(x.substring(10, 12)); // 節入り月の数字
    setuiriniti = int.parse(x.substring(12, 14)); // 節入り日の数字
    setuiriji = int.parse(x.substring(14, 16)); //   節入り時の文字
    setuirihun = int.parse(x.substring(17, 19)); //  節入り分の文字
    nenchuNoH = rokujuKansiNoA(nenchu); // 年柱No.
    gechuNoH = rokujuKansiNoA(gechu); // 月柱No.
    nichuNo = rokujuKansiNoA(nichu); // 月柱No.

    // 十干の読み仮名を算出する
    jukkanNameYomi =
        jukkanYomi.substring(nikkan * 7, (nikkan + 1) * 7).trimRight();

    // statefullWidget に変更するために　追加
    // 節入り日の時節入り時刻前ボタンを表示する
    if (setuirinitisuu == 1) {
      setuiriButtonWidth = 90;
    } else {
      setuiriButtonWidth = 0;
    }

    nenchuNo[0] = nenchuNoH;
    if (seigatu == 2) {
      nenchuNo[1] = (nenchuNo[0] - 1) % 60;
    } else {
      nenchuNo[1] = nenchuNo[0];
    }
    nenchuNo[2] = nenchuNo[0];

    gechuNo[0] = gechuNoH;
    gechuNo[1] = (gechuNo[0] - 1) % 60;
    gechuNo[2] = gechuNo[0];

    //月柱の六十干支を算出する
    gechu =
        rokujukkansi.substring((gechuNo[zenGo] * 2), (gechuNo[zenGo] * 2) + 2);
    gechuS = rokujukkansi.substring((gechuNo[2] * 2), (gechuNo[2] * 2) + 2);
    //年柱の六十干支を算出する
    nenchu = rokujukkansi.substring(
        (nenchuNo[zenGo] * 2), (nenchuNo[zenGo] * 2) + 2);
    nenchuS = rokujukkansi.substring((nenchuNo[2] * 2), (nenchuNo[2] * 2) + 2);
    // 干支併臨(日)を算出する
    var nitiKansiHeirin = kansiHeirin(nichuNo, seinengappiMoji);
    var getuKansiHeirin = kansiHeirin(gechuNo[zenGo], seinengappiMoji);
    // 干支併臨(年)を算出する
    var nenKansiHeirin = kansiHeirin(nenchuNo[zenGo], seinengappiMoji);
    // statefullWidget に変更するために追加　ここまで

    // 天地徳合を算出する
    var tokugouTen = (nikkan + 5) % 10;
    var tokugouTi = (13 - nissi) % 12;
    tokugouTenMoji = jukkan.substring(tokugouTen, tokugouTen + 1);
    tokugouTiMoji = juunisi.substring(tokugouTi, tokugouTi + 1);
    tentiTokugouMoji = '$tokugouTenMoji$tokugouTiMoji';
    int tentiTokugouSuu = rokujuKansiNoA(tentiTokugouMoji);
    var tentiTokugou = kansiHeirin(tentiTokugouSuu, seinengappiMoji);
    // 干支併臨リスト・天地徳合リストから年と年齢を生成する
    List tenunList = tenUn(nenKansiHeirin, getuKansiHeirin, nitiKansiHeirin,
        tentiTokugou, seinengappiMoji);
    // 天運リストの要素数を7にするため0を追加する
    int tenunLength = tenunList.length;
    for (int i = 0; i < (7 - tenunLength); ++i) {
      tenunList.add(0);
    }
    // 天運リストの１番目のテキスト文を作成する
    for (int i = 0; i < 7; ++i) {
      tenun[i] = tenunList.removeAt(0);
      tenunNen[i] = tenun[i] ~/ 10000;
      tenunNenrei[i] = tenun[i] % 10000 ~/ 10;
      tenunMei[i] = tenun[i] % 10;
      if (tenunMei[i] == 1) {
        tenunMeiMoji[i] = '干支併臨';
        tenunKansi[i] = nenchu;
      } else if (tenunMei[i] == 2) {
        tenunMeiMoji[i] = '干支併臨';
        tenunKansi[i] = gechu;
      } else if (tenunMei[i] == 3) {
        tenunMeiMoji[i] = '干支併臨';
        tenunKansi[i] = nichu;
      } else if (tenunMei[i] == 4) {
        tenunMeiMoji[i] = '天地徳合';
        tenunKansi[i] = tentiTokugouMoji;
      } else {}

      tenunText[i] =
          '${tenunNen[i]}（${tenunKansi[i]}）年（${tenunNenrei[i]}歳）：${tenunMeiMoji[i]}';
    }

    //■■　画面を生成する　■■

    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.1)),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            meisikiTitle[zenGo],
            style: TextStyle(
              color: Color(iroTitle[zenGo]),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: setuiriButtonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(iroBotan[zenGo]),
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  onPressed: () {
                    _incrementCounter();
                  },
                  child: Text(
                    botanMoji[zenGo],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.black,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                ListTile(
                  title: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '$seinengappiMoji 生まれの',
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'あなたの日干は、$jukkanNameYomiです。',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 220,
                                  height: 36,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (nikkan == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanKinoe(),
                                            ));
                                      } else if (nikkan == 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanKinoto(),
                                            ));
                                      } else if (nikkan == 2) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanHinoe(),
                                            ));
                                      } else if (nikkan == 3) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanHinoto(),
                                            ));
                                      } else if (nikkan == 4) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanTutinoe(),
                                            ));
                                      } else if (nikkan == 5) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanTutinoto(),
                                            ));
                                      } else if (nikkan == 6) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanKanoe(),
                                            ));
                                      } else if (nikkan == 7) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanKanoto(),
                                            ));
                                      } else if (nikkan == 8) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanMizunoe(),
                                            ));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NikkanMizunoto(),
                                            ));
                                      }
                                    },
                                    child: const Text(
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      '日干からみた性格は',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              const Text(
                                '天運の年は、',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                tenunText[0],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                tenunText[1],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                tenunText[2],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                tenunText[3],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                tenunText[4],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                tenunText[5],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                tenunText[6],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SizedBox(
                                  width: 220,
                                  height: 36,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TentiTokugou(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                      '天地徳合/干支併臨とは',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            width: 220,
                            height: 36,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MeisikiPage4(
                                      nenchu: nenchuS,
                                      gechu: gechuS,
                                      nichu: nichu,
                                      seinen: seinen,
                                      seigatu: seigatu,
                                      seiniti: seiniti,
                                      setuirinen: setuirinen,
                                      setuirigatu: setuirigatu,
                                      setuiriniti: setuiriniti,
                                      setuiriji: setuiriji,
                                      setuirihun: setuirihun,
                                      setuirinitisuu: setuirinitisuu,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  '命式を表示する',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 220,
                            height: 36,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                '戻る',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
