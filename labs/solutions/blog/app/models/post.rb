class Post < ActiveRecord::Base
  has_many :comments

  validates_presence_of :title, :body, :message => 'ZOMG REQUIRED'

  named_scope :by_date, :order => "created_at DESC"
  named_scope :latest, lambda {{:conditions => ['created_at > ?', 10.minutes.ago]}}
end
