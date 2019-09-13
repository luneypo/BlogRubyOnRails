class Commentaire < ActiveRecord::Base
    belongs_to :article
    validates :title, presence: {
        message: "Le titre doit être renseigné."
    }
    
    validates :title, uniqueness: {
    message: "Ce titre est déjà pris."
    }

    validates :content, presence: {
        message: "Le commentaire ne doit pas étre vide."
    }
end