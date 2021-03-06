require 'rails_helper'
RSpec.describe '投稿管理機能', type: :model do
  before do
    @user1 = FactoryBot.create(:user1)
    FactoryBot.create(:post1, user: @user1)
    FactoryBot.create(:post2, user: @user1)
    FactoryBot.create(:post3, user: @user1)
    FactoryBot.create(:post4, user: @user1)
    FactoryBot.create(:post5, user: @user1)
    FactoryBot.create(:post6, user: @user1)
    FactoryBot.create(:post7, user: @user1)
  end


  describe '#gradeカラム'  do
     context '投稿を作成したとき'  do
       it 'gradeが空ならバリデーションが通らない' do
         post = Post.new(
                         subject:'国語',
                         unit:'くじらぐも',
                         grade:'',
                         kind:'ワークシート')
         expect(post).not_to be_valid
       end
     end
  end

  describe '#unitカラム'  do
     context '投稿を作成したとき'  do
       it 'unitが空ならバリデーションが通らない' do
         post = Post.new(
                         subject:'国語',
                         unit:'',
                         grade:'１年生',
                         kind:'ワークシート')
         expect(post).not_to be_valid
       end
     end
  end

  describe '#subjectカラム'  do
     context '投稿を作成したとき'  do
       it 'subjectが空ならバリデーションが通らない' do
         post = Post.new(
                         subject:'',
                         unit:'くじらぐも',
                         grade:'１年生',
                         kind:'ワークシート')
         expect(post).not_to be_valid
       end
     end
  end

  describe '#unitカラム'  do
     context '投稿を作成したとき'  do
       it 'unitが空ならバリデーションが通らない' do
         post = Post.new(
                         subject:'国語',
                         unit:'',
                         grade:'１年生',
                         kind:'ワークシート')
         expect(post).not_to be_valid
       end
     end
  end

  describe '' do
    context 'scopeメソッドで検索をした場合' do
      it "scopeメソッドで単元名あいまい検索ができる" do
        expect(Post.unit_search('ハードル').count).to eq 1
      end
      it "scopeメソッドで学年検索ができる" do
        expect(Post.grade_search(1).count).to eq 1
      end
      it "scopeメソッドで教科名検索できる" do
        expect(Post.subject_search(2).count).to eq 1
      end
    end
  end
end
