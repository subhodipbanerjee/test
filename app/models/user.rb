class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :check_no_of_customer_signed_in, on: :create

  USER_TYPE = { 1 => "Owner", 2 => "Customer" }

  def owner?
    self.user_type == USER_TYPE.key("Owner")
  end

  def customer?
    self.user_type == USER_TYPE.key("Customer")
  end

  private

  def check_no_of_customer_signed_in
    customer_registered_today = User.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).count
    if customer_registered_today > 10
      errors.add(:base, "Maximum registration limit reach")
      return false
    end
  end

end
