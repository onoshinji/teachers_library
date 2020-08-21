require 'rails_helper'
RSpec.describe '投稿管理機能', type: :model do
  describe '#titleカラム'  do
     context '投稿を作成したとき'  do
       it 'titleが空ならバリデーションが通らない' do
         post = Post.new(title: '',
                         content: 'Factory1',
                         subject:'国語',
                         unit:'くじらぐも',
                         grade:'１年生',
                         kind:'ワークシート')
         expect(post).not_to be_valid
       end

       it 'titleが101文字以上ならバリデーションが通らない' do
         post = Post.new(title: '1234567890123456789012345678901234567890
                                1234567890123456789012345678901234567890',
                         content: 'Factory1',
                         subject:'国語',
                         unit:'くじらぐも',
                         grade:'１年生',
                         kind:'ワークシート')
         expect(post).not_to be_valid
       end
     end
  end
end
