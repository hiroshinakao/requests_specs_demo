# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Articles", :selenium => true, :js => true do
  describe "GET /articles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get articles_path
      response.status.should be(200)
    end
  end

  describe "POST /articles" do
    before do
      visit "/articles/new"
    end
    it "新規作成画面で登録" do
      fill_in "Title", with: "sample_title"
      fill_in "Body", with: "sample_body"
      click_button "Create Article"
      page.should have_content("Article was successfully created.")
      page.should have_content("sample_title")
      page.should have_content("sample_body")
    end
  end

  describe "DELETE /article/:id" do
    before do
    Article.create(title: "sample_title", body: "sample_body")
      visit "/articles"
    end
    it "一覧画面から削除を行う" do
#      page.evaluate_script("window.alert = function(msg) { return true; }")
#      page.evaluate_script("window.confirm = function(msg) { return true; }")

      # within でまとめられる
      within("table tr:eq(2)") do
        find("td:eq(1)").text.should == "sample_title"
        find("td:eq(2)").text.should == "sample_body"
        destroy_link = find("td:eq(5) a:eq(1)")
        destroy_link.text.should == "Destroy"
        destroy_link.click
      end
#      page.all("table tr").count.should == 1
    end
  end
end
