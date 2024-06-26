import 'package:flutter/material.dart';

class Consept extends StatelessWidget {
  const Consept({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> moji = [
      '　四柱推命の知識は、通常師弟関係を通じて伝承されていきます。通常何ヶ月もかけて学び、さらに200人以上の人を実際に鑑定してから、ようやく身についていくものです。',
      '　私は今まで百数十件の相談を受けましたが、その殆どは、夫婦・親子・兄弟・上司部下等の人間関係の悩みでした。',
      '　四柱推命の知識で整理していくと、自分と相手との関係性が明確になり、悩みを解決していくことができました。',
      '　中には、こうした四柱推命の知識に関心を持ち、学びたいという人も出てきました。',
      '　しかし、実際に学ぶとなると、学ぶ側も、教える側も多大な時間と、労力を要します。',
      '　学び始めても挫折する人も多く、知識と知恵の伝承は極めて難しいものがありました。',
      '　このアプリは、数人の四柱推命の簡単な鑑定をする中で、四柱推命の有効性を確認することができます。',
      '　更に四柱推命に関心を持ったユーザーは、「易占クイズ」を解きながら、四柱推命の知識を楽しく習得していくことができるようにアプリを設計しました。',
      '　私がデータベース上に、徐々に質問をアップロードし、ユーザーは、それを解くことで、四柱推命の知識を生活に役立てていくことができます。',
      '　現在は５問ですが、５０問、１００問、それ以上と増やしていく予定です。',
      '　これから追加していく質問の一部を紹介します。',
      '　日本において、２月４日の「立春」を迎えると、「暦（こよみ）の上では、今日から春ですが、今年一番の冷え込みに気をつけて下さい。',
      '　８月７日ごろの「立秋」を迎えると、「暦の上では、今日から秋ですが、最高気温34℃熱中症にお気をつけ下さい。」',
      '　これらのメーッセージはよくテレビやラジオで聞く文です。',
      '　これらの矛盾する文章も、四柱推命で用いる暦（こよみ）の概念を知ると、矛盾なく理解することができるようになっていきます。',
      '　また、7月23日ごろから8月7日頃にかけて、「土用の丑」の日にはうなぎを食べる」という日本の風習も深くこの暦に関係していますが、こうした文化の由来も学んで行くことができます。',
      '　四柱推命の知識と知恵を、一部の占いの先生と呼ばれる人たちだけのものに留めず、アプリを通して、多くの人が利用できるようにするところにこのアプリを作成した狙いがあります。',
      '　　　　　　　　　以上'
    ];
    List<int> iroMoji = [
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'アプリのコンセプト ',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            //height: 400,
            child: ListView.builder(
              itemCount: 18,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      tileColor: Colors.black,
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          moji[index],
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 16,
                            color: Color(iroMoji[index]),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    //color: Colors.black,

                    /*SizedBox(
                      height: takasaZu[index],
                      child: ListTile(
                        //tileColor: Colors.indigo,
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Image.asset(zu[index]),
                        ),
                        tileColor: Colors.black,
                      ),
                    ),*/
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 90,
              height: 36,
              child: ElevatedButton(
                child: const Text('戻る'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          Container(
            height: 0,
          ),

          //バナー広告追加
          //if (banner == null)
          SizedBox(
            height: 0,
            child: Container(
              color: Colors.black,
            ),
          ), // Ads
          //else
          // SizedBox(
          //   height: 50,
          //  child: AdWidget(ad: banner),
          // ),

          //バナー広告ここまで

          Container(
            height: 0,
          ),
        ],
      ),
    );
  }
}
