require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @admin_user1 = FactoryBot.create(:admin_user1)
    # @Tag_task = FactoryBot.create(:task, user: @user1)
    FactoryBot.create(:post1, user: @user2)
    FactoryBot.create(:post2, user: @admin_user1)
  end
  describe 'タスク登録画面' do
    #タスク登録前にログインする
    before do
      visit new_user_registration_path
      fill_in 'メールアドレス', with: 'sample1@example.com'
      fill_in 'パスワード', with: '00000000'
      click_button 'ログイン'
      Tag1 = Tag.create(name: :初任者)
      Tag2 = Tag.create(name: :２〜５年)
      Tag3 = Tag.create(name: :１０年)
      Tag4 = Tag.create(name: :２０年以上)
    end
    context '必要項目を入力して、createボタンを押した場合' do
      it ' タグを含む投稿データが保存される' do
        visit new_post_path
        fill_in 'タイトル', with: 'テスト１'
        fill_in '説明', with: 'テスト説明'
        select '１年生', from: '学年'
        select '国語', from: '教科'
        select 'ワークシート', from: '種類'
        check '初任者'
        click_button '投稿する'
        visit
        expect(page).to have_content 'テスト１'

      end
  #     it 'ラベル検索ができる' do
  #         visit new_post_path
  #         fill_in 'タスク', with: 'yjsn'
  #         fill_in '内容', with: 'con'
  #         select '低', from: '優先順位'
  #         select '未着手', from: 'ステータス'
  #         check 'help'
  #         click_button '登録する'
  #         expect(page).to have_content 'help'
  #     end
  #   end
  # end
  # describe 'タスク一覧画面' do
  #   before do
  #     visit new_user_registration_path
  #     fill_in 'メールアドレス', with: 'sample1@example.com'
  #     fill_in 'パスワード', with: '00000000'
  #     click_button 'ログイン'
  #   end
  #   context 'タスクを作成した場合' do
  #     # テストコードを it '~' do end ブロックの中に記載する
  #     it '作成済みのタスクが表示される' do
  #       visit tasks_path
  #       expect(page).to have_content 'デフォルトタイトルone'
  #     end
  #   end
  #   context '複数のタスクを作成した場合' do
  #     it 'タスクが作成日時の降順に並んでいる' do
  #       visit tasks_path
  #       @tasks = Task.order(created_at: :DESC).pluck(:task_name)
  #       expect(@tasks[0]).to have_content 'デフォルトタイトルthree'
  #       expect(@tasks[1]).to have_content 'デフォルトタイトルtwo'
  #
  #     end
  #   end
  #   context 'タスク検索をした場合' do
  #     it "タイトルで検索できる" do
  #       visit tasks_path
  #       @task = FactoryBot.create(:task, task_name: 'タスクあいまい検索', user: @user1)
  #       fill_in 'task_name_search', with: 'タスク'
  #       click_button 'タスク検索'
  #       expect(@task.task_name).to have_content 'タスクあいまい検索'
  #
  #     end
  #   end
  #   context 'ステータス検索をした場合' do
  #     it "ステータスで検索できる" do
  #       visit tasks_path
  #       @task = FactoryBot.create(:task, status: '未着手', user: @user2)
  #       select '未着手', from: 'status_search'
  #       click_button 'ステータス検索'
  #       expect(@task.status).to have_content '未着手'
  #     end
  #   end
  #   context 'タイトルとステータスのAND検索をした場合' do
  #     it "タイトルとステータスでAND検索できる" do
  #       visit tasks_path
  #       @task = FactoryBot.create(:task, task_name: 'タスク1', status: '未着手', user: @user1)
  #       @task = FactoryBot.create(:second_task, task_name: 'task2', status: '着手中', user: @user2)
  #       @task = FactoryBot.create(:third_task, task_name: 'タスク3', status: '着手中', user: @admin_user)
  #       fill_in 'task_name_search', with: 'タスク'
  #       select '着手中', from: 'status_search'
  #       click_button 'ステータス検索'
  #       expect(page).to have_content 'タスク3'
  #     end
  #   end
  #   context '複数のタスクを作成し、終了期限でソートした場合' do
  #     it '終了期限が早い順でソートを選び、その順番に並んでいる' do
  #       visit tasks_path
  #       select '終了期限が早い順', from: 'time_limit_select'
  #       @tasks = Task.order(time_limit: :ASC).pluck(:task_name)
  #       expect(@tasks[0]).to have_content 'デフォルトタイトルone'
  #       expect(@tasks[1]).to have_content 'デフォルトタイトルtwo'
  #       expect(@tasks[2]).to have_content 'デフォルトタイトルthree'
  #     end
  #     it '終了期限が遅い順でソートを選び、その順番に並んでいる' do
  #       visit tasks_path
  #       select '終了期限が遅い順', from: 'time_limit_select'
  #       @tasks = Task.order(time_limit: :DESC).pluck(:task_name)
  #       expect(@tasks[0]).to have_content 'デフォルトタイトルthree'
  #       expect(@tasks[1]).to have_content 'デフォルトタイトルtwo'
  #       expect(@tasks[2]).to have_content 'デフォルトタイトルone'
  #     end
  #   end
  #   context '複数のタスクを作成し、優先順位でソートした場合' do
  #     it '優先順位が低い順でソートを選び、その順番に並んでいる' do
  #       visit tasks_path
  #       select '低', from: 'priority_select'
  #       @tasks = Task.order(priority: :ASC).pluck(:priority)
  #       expect(@tasks[0]).to have_content '低'
  #       expect(@tasks[1]).to have_content '中'
  #       expect(@tasks[2]).to have_content '高'
  #     end
  #     it '優先順位が高い順でソートを選び、その順番に並んでいる' do
  #       visit tasks_path
  #       select '高', from: 'priority_select'
  #       @tasks = Task.order(priority: :DESC).pluck(:priority)
  #       expect(@tasks[0]).to have_content '高'
  #       expect(@tasks[1]).to have_content '中'
  #       expect(@tasks[2]).to have_content '低'
  #     end
  #   end
  # end
  #
  # describe 'タスク詳細画面' do
  #   context '任意のタスク詳細画面に遷移した場合' do
  #     before do
  #       visit new_user_registration_path
  #       fill_in 'メールアドレス', with: 'sample1@example.com'
  #       fill_in 'パスワード', with: '00000000'
  #       click_button 'ログイン'
  #     end
  #     it '該当タスクの内容が表示されたページに遷移する' do
  #       @task = FactoryBot.create(:task, task_name: 'show', content: 'show_content', user: @user1)
  #       visit task_path(@task.id)
  #       expect(page).to have_content 'show'
  #       expect(page).to have_content 'show_content'
  #     end
  #   end
  # end
end
end
end
