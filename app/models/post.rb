require 'elasticsearch/model'

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :body
  include Printable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end
