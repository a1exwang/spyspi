class Film < ActiveRecord::Base
  belongs_to :artist
  has_many :links
  has_many :tags, through: :films_tags
  belongs_to :company
  belongs_to :designation

  def self.add_film(params = {})
    series = Series.where('upper(name) = ?', params[:designation_main].upcase).first || Series.create(name: params[:designation_main].upcase)

    designation = Designation.where('id = ?', series.id).where('upper(name) = ?', params[:designation_additional].upcase).first
    if designation
      return designation.film
    end
    designation = Designation.create(series_id: series.id, name: params[:designation_additional])

    params[:designation_id] = designation.id
    params.delete :designation_main
    params.delete :designation_additional

    Film.create(params)
  end
end
