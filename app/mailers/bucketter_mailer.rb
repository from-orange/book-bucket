class BucketterMailer < ApplicationMailer
  default from: 'notifications@example.com'

 def welcome_email(bucketter)
   @bucketter = bucketter
   url_set
   mail(to: @bucketter.email, subject: 'Welcome to BookBucket')
 end

 def test_mail(bucketter)
   @bucketter = bucketter
   mail(to: @bucketter.email, subject: 'Welcome to BookBucket')
 end

 def book_register_mail (bucketter, book)
   @book = book
   @bucketter = bucketter
   url_set
   mail(to: @bucketter.email, subject: "Your Book Registerd!")
 end

 def purchase_mail(bucketter, book)
   @bucketter = bucketter
   url_set
   @book = book
   mail(to: @bucketter.email, subject: "Successfully Perachased!")
 end

 private
  def url_set
    @url  = "http://0.0.0.0:3000/bucketters/#{@bucketter.id}"
  end
end
