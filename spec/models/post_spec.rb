require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :model do
  before do
    post.create(title: "post1", content: "content1", status: 1)
    post.create(title: "post2", content: "content2", status: 0)
  end
  describe '#titleカラム' do
    context 'タスクを作成したとき' do
      # バリデーションが働いているか確かめるためにわざと空白のタスクネームをつけ、マッチャでnot_to be_validを使って確かめている
      it 'titleが空ならバリデーションが通らない' do
        post = post.new(title: '', content: '失敗テスト')
        expect(post).not_to be_valid
      end
      it 'titleが81字以上ならバリデーションが通らない' do
        post = post.new(title: '01234567890123456789
                                    0123456789012345678901234',
          content: '8１文字検証テスト')

          expect(post).not_to be_valid
        end
      end
    end

    describe '#contentカラム' do
      context 'タスクを作成したとき' do
        it 'contentが空ならバリデーションが通らない' do
          post = post.new(title: 'コンテントバリデーションテスト', content: '')
          expect(post).not_to be_valid
        end
        it 'contentが301字以上ならバリデーションが通らない' do
          post = post.new(title: '３０１文字以上検証',
            content: '01234567890123456789
                      01234567890123456789
                      01234567890123456789
                      01234567890123456789
                      01234567890123456789
                      01234567890123456789
                      01234567890123456789
                      01234567890123456789
                      01234567890123456789')
            expect(post).not_to be_valid
          end
        end
      end

      describe '#title&&contentカラム' do
        context 'タスクを作成したとき' do
          it 'titleとcontentに内容が記載されていればバリデーションが通る' do
            post = post.new(title: 'タスク', content: 'コンテント')
            expect(post).to be_valid
          end
        end
      end

      describe '#time_limitカラム' do
        context 'タスクを作成したとき' do
          it 'time_limitが空ならバリデーションが通らない' do
            post = post.new(time_limit: '')
            expect(post).not_to be_valid
          end
        end
      end

      describe '#priorityカラム' do
        context 'タスクを作成したとき' do
          it 'priorityが空ならバリデーションが通らない' do
            post = post.new(priority: '')
            expect(post).not_to be_valid
          end
        end
      end

      describe '#statusカラム' do
        context 'タスクを作成したとき' do
          it 'statusが空ならバリデーションが通らない' do
            post = post.new(status: '')
            expect(post).not_to be_valid
          end
        end
      end

      describe '' do
        context 'scopeメソッドで検索をした場合' do
          it "scopeメソッドでタイトル検索ができる" do
            expect(post.post_search('post').count).to eq 2
          end
          it "scopeメソッドでステータス検索ができる" do
            expect(post.status_search(0).count).to eq 1
          end
          it "scopeメソッドでタイトルとステータスの両方が検索できる" do
            expect(post.post_search('post').status_search(0).count).to eq 1
          end
        end
      end
    end
