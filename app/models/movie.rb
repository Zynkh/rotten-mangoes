class Movie < ActiveRecord::Base
  has_many :reviews
  mount_uploader :image, ImageUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :image,
    presence: true

  validates :release_date,
    presence: true

  # validate :release_date_is_in_the_future

  def review_average
    if reviews.size < 1 
      return "Not Yet Rated" 
    else
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

  def self.search(search)
    if search
      self.where('title LIKE ? OR director LIKE ? OR description LIKE ?', ["%#{search[:search]}%"], ["%#{search[:search]}%"], ["%#{search[:search]}%"]).runtime(search[:runtime])
    else
      find(:all)
    end
  
  end

  def self.runtime(runtime)
    case runtime
      when '1'
        self.where('runtime_in_minutes > 0')
      when '2'
        self.where('runtime_in_minutes <= ?', 90)
      when '3'
        self.where('runtime_in_minutes > ? AND runtime_in_minutes < ?', 90, 120)
      when '4'
        self.where('runtime_in_minutes >= ?', 120)
      else
        self.all
      end
  end


  protected

  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end
  # end
  
end
