require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :model do
  describe '#nameカラム' do
  context 'ユーザーを作成したとき' do
    it 'nameが空ならバリデーションが通らない' do
      user = User.new(name: '', email:'user1@example.com',
                      password: '000000000', admin: false)
      expect(user).not_to be_valid
    end
    it 'nameが21字以上ならバリデーションが通らない' do
      user = User.new(name: '01234567890123456789
                            0123456789012345678901234',
                      email:'user1@example.com',
                      password: '000000000', admin: false)
        expect(user).not_to be_valid
      end
    end
  end

  describe '#emailカラム' do
  context 'ユーザーを作成したとき' do
    it 'emailが空ならバリデーションが通らない' do
      user = User.new(name: 'user1', email:'',
                      password: '000000000', admin: false)
      expect(user).not_to be_valid
    end
    it 'emailが61字以上ならバリデーションが通らない' do
      user = User.new(name: 'user1',
                      email:'012345678900123456789001234567890
                            0123456789001234567890@example.com',
                      password: '000000000', admin: false)
        expect(user).not_to be_valid
      end
    end
  end

  describe '#passwordカラム' do
  context 'ユーザーを作成したとき' do
    it 'passwordが空ならバリデーションが通らない' do
      user = User.new(name: 'user1', email:'user1@example.com',
                      password: '', admin: false)
      expect(user).not_to be_valid
    end
    it 'passwordが6字以上ならバリデーションが通る' do
      user = User.new(name: 'user1',
                      email:'0123456789@example.com',
                      password: '0123456789', admin: false)
        expect(user).to be_valid
      end
    end
  end
end
