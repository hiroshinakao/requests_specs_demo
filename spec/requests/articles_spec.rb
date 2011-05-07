# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Articles" do
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
end
