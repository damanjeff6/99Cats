class Cat < ActiveRecord::Base

  SEXES = ['F', 'M']
  CAT_COLORS = ['RED', 'ORANGE', 'WHITE', 'BLACK', 'GREY', 'YELLOW']

  attr_accessible(
    :age,
    :birth_date,
    :color,
    :name,
    :sex,
    :user_id
  )

  validates(
    :age,
    :birth_date,
    :color,
    :name,
    :sex,
    :user_id,
    :presence => true
  )
  has_many(:cat_rental_requests, :dependent => :destroy)
  belongs_to :user

  validates :age, :numericality => true
  validates :sex, :inclusion => { :in => SEXES,
                                  :message => "%{value} invalid sex" }
  validates :color, :inclusion => { :in => CAT_COLORS,
                                    :message => "%{value} invalid cat color" }

  def male?
    self.sex == 'M'
  end

  def female?
    self.sex == 'F'
  end

end



# t.integer  "age",        :null => false
# t.date     "birth_date", :null => false
# t.string   "color",      :null => false
# t.string   "name",       :null => false
# t.string   "sex",        :null => false
# t.datetime "created_at", :null => false
# t.datetime "updated_at", :null => false