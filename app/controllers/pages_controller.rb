# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @posts = Post.limit(5).order(created_at: :desc)
  end
end
