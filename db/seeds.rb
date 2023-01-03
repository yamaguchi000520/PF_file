# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.com',
    password: '123456',
)

# ジャンルseed
Genre.create!(
  [
    {
      name: 'ビール'
    },
    {
      name: 'ウイスキー'
    },
    {
      name: 'ブランデー'
    },
    {
      name: '焼酎'
    },
    {
      name: 'サワー'
    },
    {
      name: 'ワイン'
    },
    {
      name: '日本酒'
    },
    {
      name: 'リキュール'
    },
    {
      name: 'その他'
    }
  ]
)

#Customer
Customer.create!(
  [
    {
        name: 'ラーメン好き太郎',
        introduction: '初めまして、ラーメン好きの人です。',
        email: "i@i",
        password: 'iiiiii',
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/test.jpg"), filename: 'default-image.jpeg')
    },
    {
        name: 'ウイスキー毎日飲酒',
        introduction: '常飲酒はホワイトホースくんです。',
        email: 'a@a',
        password: 'aaaaaa',
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/test.jpg"), filename: 'default-image.jpeg')
    },
    {
        name: '華金が待ち遠しい',
        introduction: 'いつもはビールを飲んでいます。最近のお気に入りとしては、ギネスです。',
        email: 'b@b',
        password: 'bbbbbb',
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/bear.jpeg"), filename: 'default-image.jpeg')
    },
    {
        name: 'まち男',
        introduction: '常日頃から、美味しいものを探しております。情報共有ができれば幸いです',
        email: 'c@c',
        password: 'cccccc',
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/test.jpg"), filename: 'default-image.jpeg')
    },
    {
        name: 'グリ',
        introduction: 'ワインが一番好きです。',
        email: 'd@d',
        password: 'dddddd',
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/megane.jpeg"), filename: 'default-image.jpeg')
    },
    {
        name: '寿司たろう',
        introduction: 'アブサンや薬草系のお酒が好き。',
        email: 'e@e',
        password: 'eeeeee',
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/sushi.jpeg"), filename: 'default-image.jpeg')
    }
  ]
)

Home.create!(
  [
    {
      name: "ビール",
      introduction: "ビール（麦酒、Bier) は、様々な作り方があるが、主に大麦を発芽させた麦芽（デンプンがアミラーゼという酵素で糖化している）を、ビール酵母によりアルコール発酵させて作る製法が一般的である。現在は炭酸の清涼感とホップの苦味を特徴とするラガー、特にピルスナーが主流となっているが、ラガーはビールの歴史の中では比較的新参であり、ラガー以外にもエールなどの様々な種類のビールが世界各地で飲まれている。"
    },
    {
      name: "ウイスキー",
      introduction: "ウイスキーは、世界の酒の一つ。大麦、ライ麦、トウモロコシなどの穀物を麦芽の酵素で糖化し、これをアルコール発酵させ蒸留したものである。日本語ではウィスキーとも表記される。またスコッチ・ウイスキーは whisky、アイリッシュ・ウイスキーは whiskey と表記される。"
    },
    {
      name: "ブランデー",
      introduction: "ブランデーは、果実酒からつくった蒸留酒の総称。語源はオランダ語の「焼いたワイン」を意味する。主に白ブドウのワインを蒸留して樽に入れ、熟成して製造する（熟成期間は5 - 8年。種類によっては25年以上熟成させる。熟成させすぎたものは新しいものとブレンドして若返らせる場合もある）。単にブランデーと言った場合は通常ブドウが原料のワインを蒸留して作られたものを指すが、リンゴから作ったアップル・ブランデーやサクランボから作ったチェリー・ブランデーも存在する。アルコール度数は40度弱から50度程度である。"
    },
    {
      name: "焼酎",
      introduction: "焼酎は、日本の蒸留酒である。原料の違いで、米焼酎・麦焼酎・芋焼酎・黒糖焼酎・粕取り焼酎・そば焼酎・栗焼酎・泡盛など様々な種類がある。現代の日本で製造される焼酎のアルコール度数は25%が多いが、20%の製品もある。"
    },
    {
      name: "チューハイ",
      introduction: "チューハイ（酎ハイ）は、日本で最も広く飲用されるカクテル。 基本的に、焼酎、フレーバー、炭酸水で構成される。1980年代、酒税が高かったウイスキーでつくるハイボールの代用品として、焼酎を用いた低アルコール飲料が広まり、チューハイブームと呼ばれた。それ以前から下町で親しまれていた、甲種焼酎を炭酸水で割ったものからはじまり、様々なフレーバーや、さらにはウーロン茶などの炭酸を含まないソフトドリンクで割ったものなど多岐にわたる。 居酒屋のメニューとしてビールジョッキで供される形態から、2000年代以降に缶入り飲料（レディ・トゥ・ドリンク）として売り上げを伸ばし、現在では家庭でも広く飲まれるようになった。 ベースの蒸留酒も、ウォッカ、ジン、さらには本義であるウイスキーまでも含め、日本のアルコール飲料の主役と言えるほどに広まっている。"
    },
    {
      name: "ワイン",
      introduction: "ワインは瓶に詰められた後でも熟成が進み、風味は変化を続ける。熟成期間はボルドーワインなどの一部のワインでは50年以上もの熟成に耐えるものもあるが、多くは1年から10年ほど、長いものでも20年から30年である。安価なワインでは熟成によって品質が向上することはあまりなく、むしろ早く飲まないと劣化してしまう。長い熟成に耐えるものを長熟、逆に早く飲むものは早飲みという。作られて間もないワイン（「若いワイン」と表現する）は、ブドウの生の味が強く、渋すぎたり、酸味がきつすぎたりするということもあるが、熟成が進むと角が取れてまろやかになる。また、年数が経てば総数が減るため希少価値により価格も高くなる傾向にある。ただし、熟成したワインがどれも同じように高くなるというわけではなく、生産年、地域、作り手の知名度などにより価格は大きく異なる。"
    },
    {
      name: "白ワイン",
      introduction: "主に無色に近い色調から（時に緑色がかった）黄色みを帯びたワインを白ワインと呼ぶ。白ブドウなど主に色の薄い果皮のブドウを原料とし、発酵には果汁のみを使用する。酸味の強いものは、一般的に魚料理に合うとされる。白ワインは、料理と合わせる辛口からデザートワインにする極甘口まで甘さに幅がある。"
    },
    {
      name: "赤ワイン",
      introduction: "透き通った赤や濃い紫、あるいは赤褐色のワインを赤ワインと呼ぶ。一般に白ワインよりも渋みの成分であるタンニンを多く含み、長期保存が可能である。主として黒ブドウや赤ブドウを原料とし、果実を丸ごとアルコール発酵させる。濃厚な風味のものは一般的に肉料理に合うとされる。また冷やすと香りの成分が揮発しにくくなったり苦味が増したりするため、冷やさないのが普通である。一般的に赤ワインには辛口しかなく、コクとタンニンにより、ライトボディーからフルボディーといった分類がなされる。"
    },
    {
      name: "ロゼワイン",
      introduction: "ロゼとはフランス語で「ピンク色」を意味し、時にピンク・ワインとも呼ばれる赤みを帯びた淡い色調のワインを指す。製法には、果皮の色の薄いブドウを赤ワインのように醸造する方法や、赤ワインと同じブドウを白ワインのように醸造する方法、赤と白の双方のブドウによる混醸、赤ワインの醸造途上で色の素である果皮を取り除く方法などがあり、味わいも様々である。中には赤ワインと白ワインを混合したものや白ワインに着色しただけの製品もある。ほかに発泡ワイン、オレンジワインなどの特殊な製法のものがある。ワインの風味を構成する味覚は、白ワインでは酸味・甘味であり、赤ではそれに渋みが加わる。加えて、香りが風味の重要な要素であり、これらのバランスが取れているワインが一般的に良いものとされる。"
    },
    {
      name: "日本酒",
      introduction: "日本酒は米・麹・水というシンプルな原料で作られた文字通り日本独自のお酒で一般的に「清酒」と呼ばれています。 酒税法の下、清酒はアルコール22度未満で次の要件が備わっているものと決められています。 さらに日本酒は突き詰めていくと、同じ銘柄の日本酒でも複数種類があるのです。"
    },
    {
      name: "リキュール",
      introduction: "リキュールとは「混成酒」のひとつリキュールの語源は、ラテン語で「溶かし込む」という意味の「Liquefacere（リケファケレ）」、あるいは液体という意味の「Liquor（リクォル）」がフランス風になまってできた単語だといわれています。具体的には、蒸留酒や醸造酒に果実、薬草・香草、ナッツなどの香り成分を溶かし込んで造る混成酒をリキュールと呼びます。ストレートで飲めますが、割って楽しめるものが多いのが特徴です。お酒として飲む他、料理やお菓子作りに用いる場合もあります。"
    }
  ]
)

Tag.create!(
  [
    {
      name: "蒸留酒"
    }
  ]
)

Sake.create!(
  [
    {
      customer_id: 1,
      genre_id: 1,
      name: "シメイ・ブルー",
      price: 500,
      # tag_id: 1,
      introduction: "コクが深く少し高めの値段ですがとてもお勧めです。",
      rate: 4.5,
      sake_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/chimay.jpeg"), filename: 'default-image.jpeg')
    },
    {
      customer_id: 1,
      genre_id: 2,
      name: "black label",
      price: 2100,
      # tag_id: 1,
      introduction: "値段の割の味わいとしてはとてもお勧めです。",
      rate: 4.0,
      sake_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/blacklabel.jpeg"), filename: 'default-image.jpeg')
    },
    {
      customer_id: 3,
      genre_id: 1,
      name: "GUINNESS",
      price: 300,
      # tag_id: 1,
      introduction: "黒ビールとしては、値段もリーズナブルで重く美味しい味わいです。",
      rate: 4.0,
      sake_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/guinness.jpeg"), filename: 'default-image.jpeg')
    },
    {
      customer_id: 4,
      genre_id: 2,
      name: "daruma old",
      price: 1500,
      # tag_id: 1,
      introduction: "サントリーの古くからあるウイスキーです。個人的にはとても美味しく感じます。",
      rate: 3.5,
      sake_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/blacklabel.jpeg"), filename: 'default-image.jpeg')
    },
    {
      customer_id: 5,
      genre_id: 9,
      name: "PERNOD",
      price: 4500,
      # tag_id: 1,
      introduction: "アブサンという薬草酒です。お水で加水すると甘さと香りが花開くかのごとく広がるのでおすすめです。",
      rate: 4.5,
      sake_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/pernod.jpeg"), filename: 'default-image.jpeg')
    },
    {
      customer_id: 4,
      genre_id: 6,
      name: "SED",
      price: 1600,
      rate: 3.5,
      introduction: "白ワインで値段と味を比べるととても良い品です。少し辛口ですがあっさりしていて飲みやすいです。。",
      # evaluation: 0
      sake_image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/sed.jpeg"), filename: 'default-image.jpeg')
    }
  ]
)

SakeComment.create!(
  [
    {
      customer_id: 1,
      sake_id: 1,
      comment: "とても美味しいお酒ですね！"
    },
    {
      customer_id: 2,
      sake_id: 1,
      comment: "最高でした"
    },
    {
      customer_id: 4,
      sake_id: 1,
      comment: "コスパ○"
    },
    {
      customer_id: 3,
      sake_id: 1,
      comment: "次回買ってみようと思います"
    },
    {
      customer_id: 1,
      sake_id: 5,
      comment: "コスパ○"
    },
    {
      customer_id: 4,
      sake_id: 3,
      comment: "楽しみです"
    },
    {
      customer_id: 3,
      sake_id: 3,
      comment: "コスパ○"
    },
    {
      customer_id: 1,
      sake_id: 1,
      comment: "コスパ○"
    }
  ]
)