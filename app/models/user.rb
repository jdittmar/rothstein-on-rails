class User < ActiveRecord::Base
  has_secure_passowrd
  attr_accessible :email, :password, :password_confirmation, :name

  validates_uniqueness_of :login, :message => "That login already exists" 
  validates_uniqueness_of :email, :message => "That email address already exists" 
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email address"
  validates_presence_of      :password                    #:if  =>  :password_required? 
  validates_presence_of      :password_confirmation       #:if  =>  :password_required? 
  validates_length_of        :password,  :within  =>  5..40  #:if  =>  :password_required? 
  validates_confirmation_of  :password                   # :if  =>  :password_required?
  validates_length_of :login, :within => 3..40
  
end
