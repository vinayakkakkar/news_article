class Article < ActiveRecord::Base
  paginates_per 3
  after_create :send_create_message
  def send_create_message
    puts "Article has been created"
  end

  after_update :send_update_action
  def send_update_action
    puts "article has been updated"
  end
  validates :title,
            presence: true,
            uniqueness: true,
            length: { maximum: 30} 
  validates :content, presence: true 
  validates :author, presence: true
  validates :published_at, presence: true

  after_destroy :send_delete_message
  def send_delete_message
    puts "Article has been deleted"
  end
end
