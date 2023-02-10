class SaveUsersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    require 'open-uri'

    user_link = "https://jsonplaceholder.typicode.com/users"

    response = HTTParty.get(user_link, verify: false)
    body = JSON.parse(response.body)

    body.each do |user|
      unless User.where(name: user["name"]).present?
        @user = User.new
        @user.name = user["name"]
        @user.username = user["username"]
        @user.email = user["email"]
        @user.phone = user["phone"]
        @user.website = user["website"]
        @user.address = user["address"]["street"] + " " + user["address"]["suite"] + " " +user["address"]["city"] + " " +user["address"]["zipcode"]
        @user.save
        unless Company.where(name: user["company"]["name"]).present?
          @company = Company.new
          @company.name = user["company"]["name"]
          @company.catch_pharse = user["company"]["catchPhrase"]
          @company.bs = user["company"]["bs"]
          @company.user_id = @user.id
          @company.save
          @user.company_id = @company.id
          @user.save
        else
          @user.company_id = Company.where(name: user["company"]["name"]).last.id
          @user.save
        end
      end

      # @sprint.scraps.new gibi bişey olabilir mi
      # userın adresleri var companyleri var
      # @company = User.companies.new gibi
    
    end
  end
end
