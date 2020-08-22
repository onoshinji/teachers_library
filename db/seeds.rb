Tag.create!(name: "初任者")
Tag.create!(name: "2~5年")
Tag.create!(name: "10年以上")
Tag.create!(name: "20年以上")
Tag.create!(name: "学年主任")

User.create(name: "admin_user", email: 'admin@gmail.com',
            password: 'admin_user', admin: true, confirmed_at: Date.today)
User.create(name: "user1001", email: 'user1001@gmail.com',
            password: 'user1001', admin: false, confirmed_at: Date.today)
User.create(name: "user1002", email: 'user1002@gmail.com',
            password: 'user1002', admin: false, confirmed_at: Date.today)
User.create(name: "user1003", email: 'user1003@gmail.com',
            password: 'user1003', admin: false, confirmed_at: Date.today)
User.create(name: "user1004", email: 'user1004@gmail.com',
            password: 'user1004', admin: false, confirmed_at: Date.today)
User.create(name: "user1005", email: 'user1005@gmail.com',
            password: 'user1005', admin: false, confirmed_at: Date.today)
