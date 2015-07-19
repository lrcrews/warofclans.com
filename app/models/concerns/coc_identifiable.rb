module CocIdentifiable
  extend ActiveSupport::Concern

  included do
    before_save :normalize_coc_id, if: "coc_id_present?"

    validates :coc_id, 
              presence: true, 
              uniqueness: true, 
              format: { with: /\A#\w{7,9}\z/ }, 
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
      if self.coc_id.present?
        self.coc_id = self.coc_id.upcase
        self.coc_id.gsub!("O", "0")
      end
    end

end
