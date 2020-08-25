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
# Post.create(user_id: User.find(6).id, title: '少数の仕組み１', content: 'そのまま印刷して使えます',  grade: '４年生', subject: '算数', unit: '少数の仕組み', kind: 'ワークシート', image:File.open("./public/images/1.pdf"),)
# Post.create(user_id: User.find(6).id, title: 'わりざん', content: '時間が余る子向け',  grade: '３年生', subject: '算数', unit: 'わり算', kind: 'ワークシート',image:File.open("./public/images/わりざん.png"),)
# Post.create(user_id: User.find(6).id, title: 'かけ算', content: '授業、教室掲示用',  grade: '２年生', subject: '算数', unit: 'かけ算', kind: 'ワークシート',image:File.open("./public/images/九九カード.png"),)
# Post.create(user_id: User.find(6).id, title: '合同な図形', content: '宿題用',  grade: '５年生', subject: '算数', unit: '合同な図形', kind: 'ワークシート',image:File.open("./public/images/合同な図形１.png"),)
# Post.create(user_id: User.find(6).id, title: '合同な図形', content: '宿題用',  grade: '５年生', subject: '算数', unit: '合同な図形', kind: 'ワークシート',image:File.open("./public/images/合同な図形２.png"),)
# Post.create(user_id: User.find(6).id, title: '漢字プリント宿題用', content: '宿題、もしくは早く課題が終わった子むけ',  grade: '４年生', subject: '国語', unit: '漢字', kind: 'ワークシート',image:File.open("./public/images/都道府県の漢字１.png"),)
# Post.create(user_id: User.find(6).id, title: '漢字プリント宿題用', content: '宿題、もしくは早く課題が終わった子むけ',  grade: '４年生', subject: '国語', unit: '漢字', kind: 'ワークシート',image:File.open("./public/images/都道府県の漢字２.png"),)
Post.create(user_id: User.find(6).id, title: '地図記号', content: '授業で使用、印刷してノートに貼らせて使います',  grade: '３年生', subject: '社会', unit: '地図記号', kind: 'ワークシート',image:File.open("./public/images/地図記号１.png"),)
Post.create(user_id: User.find(6).id, title: '地図記号', content: '授業で使用、印刷してノートに貼らせて使います',  grade: '３年生', subject: '社会', unit: '地図記号', kind: 'ワークシート',image:File.open("./public/images/地図記号１.png"),)

# 指導案作成用データ
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
# Post.create(user_id: User.find(8).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '指導案')
#
# # 所見例作成用データ
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
# Post.create(user_id: User.find(3).id, title: 'test1', content: 'con1',  grade: '６年生', subject: '国語', unit: '鳥獣戯画', kind: '所見例')
