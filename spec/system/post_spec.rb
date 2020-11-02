require 'rails_helper'
RSpec.describe '投稿管理機能', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @admin_user1 = FactoryBot.create(:admin_user1)
    FactoryBot.create(:post1, user: @user2)
    FactoryBot.create(:post2, user: @admin_user1)
    FactoryBot.create(:post3, user: @user2)
    FactoryBot.create(:post4, user: @user2)
    FactoryBot.create(:post5, user: @user2)
    FactoryBot.create(:post6, user: @user2)
    FactoryBot.create(:post7, user: @user2)
    FactoryBot.create(:post8, user: @user2)
    FactoryBot.create(:post9, user: @user2)
  end
  describe '投稿作成画面' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'user1@example.com'
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
        fill_in 'post[title]', with: 'テスト１'
        fill_in 'post[content]', with: 'テスト説明'
        select '１年生', from: 'post[grade]'
        select '国語', from: 'post[subject]'
        select 'ワークシート', from: 'post[kind]'
        fill_in 'post[unit]', with: '単元名１'
        check '初任者'
        click_button '投稿する'
        expect(page).to have_content 'ファイルを投稿しました'
      end
      it 'タグ検索ができる' do
        visit new_post_path
        fill_in 'post[title]', with: 'テスト１'
        fill_in 'post[content]', with: 'テスト説明'
        select '１年生', from: 'post[grade]'
        select '国語', from: 'post[subject]'
        select 'ワークシート', from: 'post[kind]'
        fill_in 'post[unit]', with: '単元名１'
        check '初任者'
        click_button '投稿する'
        visit worksheets_path
        select '初任者', from: 'tag_id'
        click_button 'タグ検索'
      end
    end
  end
  describe '種類別投稿表示テスト' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'user1@example.com'
      fill_in 'パスワード', with: '00000000'
      click_button 'ログイン'
    end
    context 'ワークシートの投稿を作成した場合' do
      it '作成済みのタスクが表示される' do
        visit worksheets_path
        expect(page).to have_content 'くじらぐも'
        expect(page).to have_content 'かけ算'
      end
    end
    context '指導案の投稿を作成した場合' do
      it '作成済みのタスクが表示される' do
        visit plans_path
        expect(page).to have_content '星野くんの2塁打'
        expect(page).to have_content '絵具'
      end
    end

    context '学年検索をした場合' do
      it "学年で検索できる" do
        visit worksheets_path
        select '１年生', from: 'grade_search'
        click_button '検索する'
        expect(page).to have_content '１年生'
      end
    end
    context '学年と教科で検索をした場合' do
      it "学年と教科で検索できる" do
        visit plans_path
        select '６年生' , from: 'grade_search'
        select '道徳', from: 'subject_search'
        click_button '検索する'
        expect(page).to have_content '星野くんの2塁打'
      end
    end
    describe '種類別投稿表示テスト' do
      before do
        @posts = Post.where(kind: 'ワークシート')
      end
      context '複数の投稿を作成し、新着順でソートした場合' do
        it '投稿した日時が早い順で並んでいる' do
          visit worksheets_path
          select '新着順', from: 'sort'
          click_button '並び替え'
          @posts = @posts.order(created_at: :DESC).pluck(:title)
          expect(@posts[0]).to have_content 'title9'
        end
      end
      context '複数の投稿を作成し、古い順でソートした場合' do
        it '投稿した日時が古い順で並んでいる' do
          visit worksheets_path
          select '古い順', from: 'sort'
          click_button '並び替え'
          @posts = @posts.pluck(:title)
          expect(@posts[0]).to have_content 'title1'
          expect(@posts[1]).to have_content 'title2'
        end
      end
    end
  end
end
