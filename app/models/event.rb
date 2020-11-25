class Event < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_area
  belongs_to :time_all
  

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_area_id
    validates :time_all_id
  end

  with_options presence: true do
    validates :product
    validates :introduction
    validates :price, numericality: { greater_than_or_equal_to: 200, less_than_or_equal_to: 99_999 },
                      format: { with: /\A[0-9]+\z/ }
    validates :start
    validates :time_start
  end  
end
