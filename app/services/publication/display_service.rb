class Publication::DisplayService
  
  def initialize
  end


  def process
    get_publications
  end

  private

  def get_publications
    Publication.all.shuffle.map do |pub|
      {
        id:            pub.id,
        image:         pub.image_ref,
        name:          pub.owner,
        description:   pub.description
      }
    end
  end

end