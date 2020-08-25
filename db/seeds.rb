# Tag.create!(name: "初任者")
# Tag.create!(name: "2~5年")
# Tag.create!(name: "10年以上")
# Tag.create!(name: "20年以上")
# Tag.create!(name: "学年主任")
#
# User.create(name: "admin_user", email: 'admin@gmail.com',
#             password: 'admin_user', admin: true, confirmed_at: Date.today)
# User.create(name: "user1001", email: 'user1001@gmail.com',
#             password: 'user1001', admin: false, confirmed_at: Date.today)
# User.create(name: "user1002", email: 'user1002@gmail.com',
#             password: 'user1002', admin: false, confirmed_at: Date.today)
# User.create(name: "user1003", email: 'user1003@gmail.com',
#             password: 'user1003', admin: false, confirmed_at: Date.today)
# User.create(name: "user1004", email: 'user1004@gmail.com',
#             password: 'user1004', admin: false, confirmed_at: Date.today)
# User.create(name: "user1005", email: 'user1005@gmail.com',
#             password: 'user1005', admin: false, confirmed_at: Date.today)
# ワークシート作成用データ

# Post.create(user_id: User.find(6).id, title: 'わりざん', content: '時間が余る子向け',  grade: '３年生', subject: '算数', unit: 'わり算', kind: 'ワークシート',image:File.open("./public/images/わりざん.png"),)
# Post.create(user_id: User.find(6).id, title: 'かけ算', content: '授業、教室掲示用',  grade: '２年生', subject: '算数', unit: 'かけ算', kind: 'ワークシート',image:File.open("./public/images/九九カード.png"),)
# Post.create(user_id: User.find(6).id, title: '合同な図形', content: '宿題用',  grade: '５年生', subject: '算数', unit: '合同な図形', kind: 'ワークシート',image:File.open("./public/images/合同な図形１.png"),)
# Post.create(user_id: User.find(6).id, title: '合同な図形', content: '宿題用',  grade: '５年生', subject: '算数', unit: '合同な図形', kind: 'ワークシート',image:File.open("./public/images/合同な図形２.png"),)
# Post.create(user_id: User.find(6).id, title: '漢字プリント宿題用', content: '宿題、もしくは早く課題が終わった子むけ',  grade: '４年生', subject: '国語', unit: '漢字', kind: 'ワークシート',image:File.open("./public/images/都道府県の漢字１.png"),)
# Post.create(user_id: User.find(6).id, title: '漢字プリント宿題用', content: '宿題、もしくは早く課題が終わった子むけ',  grade: '４年生', subject: '国語', unit: '漢字', kind: 'ワークシート',image:File.open("./public/images/都道府県の漢字２.png"),)
# Post.create(user_id: User.find(6).id, title: '地図記号', content: '授業で使用、印刷してノートに貼らせて使います',  grade: '３年生', subject: '社会', unit: '地図記号', kind: 'ワークシート',image:File.open("./public/images/地図記号１.png"),)
# Post.create(user_id: User.find(6).id, title: '地図記号', content: '授業で使用、印刷してノートに貼らせて使います',  grade: '３年生', subject: '社会', unit: '地図記号', kind: 'ワークシート',image:File.open("./public/images/地図記号１.png"),)

# 指導案作成用データ
Post.create(user_id: User.find(3).id, title: 'プログラミング指導案その１', content: 'プロゼミを使用した学習指導案',  grade: '６年生', subject: '算数', unit: 'プログラミング', kind: '指導案',image:File.open("./public/images/６年プログラミング指導案２.png"),)
Post.create(user_id: User.find(3).id, title: 'プログラミング指導案その２', content: 'プロゼミを使用した学習指導案',  grade: '６年生', subject: '算数', unit: 'プログラミング', kind: '指導案',image:File.open("./public/images/６年プログラミング指導案３.png"),)
Post.create(user_id: User.find(3).id, title: 'プログラミング指導案その３', content: 'プロゼミを使用した学習指導案',  grade: '６年生', subject: '算数', unit: 'プログラミング', kind: '指導案',image:File.open("./public/images/６年プログラミング指導案４.png"),)
Post.create(user_id: User.find(3).id, title: '国語科学習指導案', content: '小単元の略案です',  grade: '５年生', subject: '国語', unit: '漢字の読みと使い方', kind: '指導案',image:File.open("./public/images/５年国語学習指導案.png"),)
Post.create(user_id: User.find(3).id, title: '国語科学習指導案', content: '小単元の略案です',  grade: '５年生', subject: '国語', unit: '日常を十七音で', kind: '指導案',image:File.open("./public/images/５年国語学習指導案２.png"),)
Post.create(user_id: User.find(2).id, title: '総合学習指導案', content: '米作りを通して自然に親しむ',  grade: '５年生', subject: '総合', unit: '米こめ大作戦', kind: '指導案',image:File.open("./public/images/５年総合学習指導案.png"),)
Post.create(user_id: User.find(2).id, title: '道徳学習指導案', content: '決まりの意味を考える',  grade: '５年生', subject: '道徳', unit: '遅れてきた客', kind: '指導案',image:File.open("./public/images/５年道徳学習指導案.png"),)
Post.create(user_id: User.find(2).id, title: '道徳学習指導案', content: '自分の生活を見つめ、規則正しい生活を送るようにする',  grade: '６年生', subject: '道徳', unit: '節度・節制', kind: '指導案',image:File.open("./public/images/６年道徳学習指導案.png"),)
Post.create(user_id: User.find(2).id, title: '学習指導案見本', content: '学習指導案の見本です、ご参考にお使いください',  grade: '６年生', subject: '総合', unit: '評価', kind: '指導案',image:File.open("./public/images/学習指導案見本１.png"),)
#
# # 所見例作成用データ
Post.create(user_id: User.find(4).id, title: '所見例基本３', content: '普段から良いところをメモし、書き残しておくと、成績の時期に楽になれます。まあそれが難しいんですが。',  grade: '１年生', subject: '総合', unit: '学習に関すること', kind: '所見例',image:File.open("./public/images/えんぴつノート.jpeg"),)
Post.create(user_id: User.find(4).id, title: '所見例学習', content: '国語「鳥獣戯画」では作者の意図を読み取り、表現の仕方について理解することができました。',  grade: '６年生', subject: '国語', unit: '所見例高学年', kind: '所見例',image:File.open("./public/images/勉強アイコン2.jpeg"),)
Post.create(user_id: User.find(4).id, title: '所見例学習', content: '国語「カレーライス」では、登場人物の気持ちを読み取り、場面ごとの気持ちの変化をまとめることができました。',  grade: '６年生', subject: '国語', unit: '所見例高学年', kind: '所見例',image:File.open("./public/images/勉強アイコン2.jpeg"),)
Post.create(user_id: User.find(4).id, title: '所見例学習', content: '「ともだちっていいもんや」では、本当の友達の意味について考え、実生活に生かそうとしていました。',  grade: '５年生', subject: '道徳', unit: '所見例高学年', kind: '所見例',image:File.open("./public/images/勉強アイコン2.jpeg"),)
Post.create(user_id: User.find(4).id, title: '所見例学習', content: '算数「合同な図形」では、合同な図形の条件を理解し正確に作図できました。',  grade: '５年生', subject: '算数', unit: '所見例算数', kind: '所見例',image:File.open("./public/images/勉強アイコン2.jpeg"),)
Post.create(user_id: User.find(4).id, title: '所見例学習', content: '理科「電気のはたらき」では、直列つなぎと並列つなぎの特徴について気づき、考察を深めていました。',  grade: '４年生', subject: '理科', unit: '所見例学習全般', kind: '所見例',image:File.open("./public/images/勉強アイコン2.jpeg"),)
Post.create(user_id: User.find(4).id, title: '所見例基本２', content: '基本的に児童の名前は成績表には書かないようにします。また、安易にコピペしてはいけません。自分で文章を読んだときにどの子なのかわかるようにかけると良いでしょう',  grade: '１年生', subject: '特別活動', unit: '所見例中学年', kind: '所見例',image:File.open("./public/images/えんぴつノート.jpeg"),)
Post.create(user_id: User.find(4).id, title: '所見例基本１', content: '基本的に良いことだけを記述するようにします。悪いことは書くべきではありません。児童の気になる面は個人面談で伝えましょう。トラブルを避けるもとにもなります。',  grade: '１年生', subject: '特別活動', unit: '所見例中学年', kind: '所見例',image:File.open("./public/images/えんぴつノート.jpeg"),)
