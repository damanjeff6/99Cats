class CatRentalRequest < ActiveRecord::Base
  STATUSES = ["PENDING", "APPROVED", "DENIED"]

  before_validation do
    self.status ||= 'PENDING'
  end

  attr_accessible :cat_id, :start_date, :end_date, :status
  validates :cat_id, :start_date, :end_date, :status, :presence => true
  validates :status, :inclusion => { :in => STATUSES,
                                     :message => "%{value} invalid sex" }
  validate :not_overlapping_approved_requests
  belongs_to(:cat)


  private
  def not_overlapping_approved_requests
    unless overlapping_approved_requests.empty?
      errors[:base] << "overlaps approved request"
    end
  end

  def overlapping_requests
    rental_requests = self.class.where(:cat_id => self.cat_id)

    rental_requests.keep_if do |rental|
      [ self.start_date,
        self.end_date ].any? do |date|
        date.between?(rental.start_date, rental.end_date)
      end || (self.start_date < rental.start_date &&
               self.end_date > rental.end_date)
    end
  end

  def overlapping_approved_requests
    overlapping_requests.select { |request| request.status == 'APPROVED' }
  end

end
