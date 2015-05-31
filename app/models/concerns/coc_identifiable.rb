module CocIdentifiable
  extend ActiveSupport::Concern

  included do
    before_save :normalize_coc_id, if: "coc_id_present?"

    validates :coc_id, 
              presence: true, 
              uniqueness: true, 
              format: { with: /\A#\w{7,8}\z/ }, 
              if: "coc_id_present?"
  end

  private

    def coc_id_present?
      if self.respond_to?(:coc_id)
        true
      else
        logger.warn("WARNING: CocIdentifiable concern on #{self.class.name}")
        false
      end
    end

    def normalize_coc_id
      self.coc_id = self.coc_id.upcase unless self.coc_id.nil?
    end

end
