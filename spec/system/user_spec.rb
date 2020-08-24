require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  before do
    FactoryBot.create(:user1)
    FactoryBot.create(:user2)
    FactoryBot.create(:admin_user1)
    FactoryBot.create(:admin_user2)
  end
  describe 'ユーザー登録画面' do
    context 'ユーザーのデータがなくログインしていない場合' do
      it 'ユーザー新規登録のテスト' do
        visit new_user_registration_path
        fill_in '名前', with: 'aaaa'
        fill_in 'メールアドレス', with: 'aaaa@example.com'
        fill_in 'パスワード', with: 'aaaaaaa'
        fill_in '確認用パスワード', with: 'aaaaaaa'
        click_on 'アカウント登録'
        expect(current_path).to eq user_registration_path
      end
    end
    it 'ログインしていない時はホーム画面に飛ぶテスト' do
      visit plans_path
      expect(current_path).to eq root_path
    end
  end

  describe 'ログイン画面' do
    context 'ログインしていない場合' do
      it 'ログイン機能のテスト' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'user1@example.com'
        fill_in 'パスワード', with: '00000000'
        click_button 'ログイン'
        expect(page).to have_content 'ログイン中'
      end
    end
    context 'ログインしている場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'user1@example.com'
        fill_in 'パスワード', with: '00000000'
        click_button 'ログイン'
      end
      it '自分の詳細画面にとべること' do
        visit edit_user_registration_path(id: 10000)
        expect(current_path).to eq edit_user_registration_path
      end

      it '管理者のページは見れないこと' do
        visit rails_admin_path
        expect(current_path).to eq root_path
      end
      it 'ログアウトできること' do
        visit root_path
        click_on 'ログアウト'
        expect(page).to have_content 'あなたは今ログインしていません'
      end
    end
  end
  describe '管理者画面のテスト' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'admin1@example.com'
      fill_in 'パスワード', with: '00000000'
      click_button 'ログイン'
    end
    context '管理者がログインしている場合' do
      it '管理者用ページにアクセスできること' do
        visit rails_admin_path
        expect(page).to have_content('サイト管理')
      end

      it '管理者用はユーザの詳細ページにアクセスできること' do
        visit '/admin/user/10000/edit'
        expect(page).to have_content 'パスワード確認送信時刻'
      end
      it '管理者用はユーザの編集画面からユーザを編集できること' do
        visit '/admin/user/10000/edit'
        click_on '保存'
        expect(page).to have_content 'ユーザーの更新に成功しました'
      end
      it '管理者用はユーザの編集画面からユーザを削除できること' do
        visit '/admin/user/10000/delete'
          click_on '実行する'
        expect(page).to have_content 'ユーザーの削除に成功しました'
      end
    end
  end
end
