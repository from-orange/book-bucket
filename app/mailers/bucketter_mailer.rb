class BucketterMailer < ApplicationMailer
  default from: 'notifications@example.com'

 def welcome_email(bucketter)
   @bucketter = bucketter
   @url  = "http://0.0.0.0:3000/bucketters/#{@bucketter.id}"
   mail(to: @bucketter.email, subject: 'Welcome to BookBucket')
 end

 def test_mail(bucketter)
   @bucketter = bucketter
   mail(to: @bucketter.email, subject: 'Welcome to BookBucket')
 end
end
