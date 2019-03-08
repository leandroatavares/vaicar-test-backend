class Publication::CreateService
  attr_reader :create_params

  def initialize(create_params)
    @create_params = create_params
  end

  def process
    if create_publication.save
        return 'ok'
    end
    'nok'
  end

  private

  def create_publication
    @publication ||= Publication.new(owner: create_params[:owner],
                                    description: create_params[:description],
                                    image_ref: create_params[:image_ref]
                                    )
  end
  
end
