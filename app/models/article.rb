class Article < ActiveRecord::Base
    has_many :commentaires
end