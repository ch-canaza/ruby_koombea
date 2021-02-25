class Contact < ApplicationRecord
    
    belongs_to :user
    before_save { self.first_name = first_name.downcase }
    before_save { self.last_name = last_name.downcase }
    has_many :links, dependent: :destroy
    accepts_nested_attributes_for :links, reject_if: :all_blank
    validates :first_name, presence: true,
                            uniqueness: {case_sensitive: false },
                            length: { maximum: 20 }
    validates :last_name, presence: true 
    has_one_attached :image
    
     def thumb 
        image.variant(resize: '100x100!').processed
     end

     def profile
      image.variant(resize: '400x400!').processed
     end
        
   
    validate :correct_image_type
    
    private
    def correct_image_type
        if image.attached? && !image.content_type.in?(%W(image/jpg image/png))
            errors.add(:image, 'must be JPG or PNG.')
        end
    end
end
