class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def is_admin?
    self.type == "Admin"
  end

  def is_employee?
    self.type == "Employee"
  end
end
