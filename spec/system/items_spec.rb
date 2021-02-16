require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Items", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
  end

  context "商品出品ができる時" do
    it "ログインしたユーザーは出品ができる" do
    # ログインする
    basic_pass new_user_session_path
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 出品ページへのリンクがあることを確認する
    expect(page).to have_content("出品する")
    # 出品ページに遷移する
    visit new_item_path
    # フォームに情報を入力する
    image_path = Rails.root.join("public/images/test_image.png")
    attach_file("item[image]", image_path, make_visible: true)
    fill_in "item[name]", with: @item.name
    fill_in "item[explanation]", with: @item.explanation
    select 'レディース', from: 'item[category_id]'
    select '新品・未使用', from: 'item[item_state_id]'
    select '着払い(購入者負担)', from: 'item[delivery_fee_id]'
    select '北海道', from: 'item[prefecture_id]'
    select '1日〜2日で発送', from: 'item[delivery_day_id]'
    fill_in 'item[price]', with: @item.price
    # 出品するとitemモデルのカウントが1つ上がる
    expect{
      find('input[name="commit"]').click
    }.to change { Item.count }.by(1)
    # トップページに遷移する
    visit root_path
    # トップページに出品した商品があるか確認する
    expect(page).to have_content(@item.name)
    end
  end
end
