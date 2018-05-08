# require 'test_helper' #why does this not work to replace hasher and encrypt/encryptor as in registration process test
require 'hasher'
require 'encrypt/encryptor'

FactoryBot.define do
  PEM = File.read('config/keys/public.dev.pem')
  
  factory :registration do
    
    name "Lisa"
    email "Lisa@does.de"
    phonenumber "3839"
    is_member true
    contact_person "Mareike"
    city "Hamburg"
    
    trait :with_hashed_email do
      hashedEmail { Hasher.digest(email.downcase) }
      after(:build) { |registration| registration.email.downcase!}
    end
    
    trait :as_record do
      with_hashed_email
      after(:build) do |registration| 
        registration.name = Encrypt::Encryptor.new(registration.name, PEM).apply      
        registration.email = Encrypt::Encryptor.new(registration.email.downcase, PEM).apply
        registration.phonenumber = Encrypt::Encryptor.new(registration.phonenumber, PEM).apply
        registration.contact_person = Encrypt::Encryptor.new(registration.contact_person, PEM).apply
        registration.city = Encrypt::Encryptor.new(registration.city, PEM).apply
      end
    end
  end
end