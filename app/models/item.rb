class Item < ActiveRecord::Base
  validates :name, presence: true

  before_create :create_slug

  private

    def create_slug
      self.slug = self.name.parameterize if self.name
    end
end
