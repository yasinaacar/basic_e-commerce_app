class Product < ApplicationRecord
  validates :name, presence:{message: "Ürün adı boş geçilemez"}
  validates :price, numericality: {greater_than_or_equal_to: 18}
  validates :stock, numericality: {greater_than_or_equal_to: 0}
  validate :name_is_unique #created by me
  #befor ve after methodları veri tabanı etkileşimlerini izleyerek çeşitli fonksiyonlar çağırır, örneğin bir ürün güncellendiğinde tüm kullanıcılara mail gönder
  before_create :say_hi
  after_create :send_created_notification
  after_update :send_updated_notification
  after_destroy :send_deleted_notification

  #Special Validation
  def name_is_unique
    @name=self.name

    @product=Product.where("name  =?", @name)
    if !@product.blank?
      errors.add(:name, "#{@name} adında bir ürün zaten var")
    end
  end

  #Action Methods
  def say_hi
    puts "********Selam**********"
  end

  def send_created_notification
    puts "Yeni ürün eklendi ve tüm kullanıcılara mail gönderildi"
  end

  def send_updated_notification
    puts "Ürün güncellendi ve ilgili kullanıcılara mail gönderildi"
  end

  def send_deleted_notification
    puts "Ürün silindi ve ilgili kullanıcılara mail gönderildi"
  end



end
