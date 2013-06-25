class User < ActiveRecord::Base
  attr_accessible :email, :mobileno, :name
  validates_presence_of :name,:email,:mobileno, :message => "can't be blank"
  validates :name, :length => { :maximum => 140 }
  validates_numericality_of :mobileno, :message => 'is not a number' , :unless => 'mobileno.blank?'
  #validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i if validates_presence_of :email

  validates :email,:format =>{:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }, :unless => 'email.blank?'
end
