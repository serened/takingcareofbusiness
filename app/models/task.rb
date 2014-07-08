class Task < ActiveRecord::Base
  belongs_to :project

  attr_accessor :completed

  def new
  end

  def create
  end

  def destroy
  end

end
