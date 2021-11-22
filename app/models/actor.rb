class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    def list_roles
        first_name = self.characters.map do |each|
            each.name
        end.flatten
        show_name = self.shows.map do |each|
            each.name
        end.flatten
        first_name[0] + ' - ' + show_name[0]
    end
end