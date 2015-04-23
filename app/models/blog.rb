class Blog < ActiveRecord::Base
   attr_accessible :title, :content, :user_id
   belongs_to :user
   include Tire::Model::Search
   include Tire::Model::Callbacks

   mapping do
    indexes :id, type: 'integer'
    indexes :user_id, type: 'integer'
    indexes :user_name
    indexes :title, boost: 10
    indexes :content # analyzer: 'snowball'
    indexes :created_at, type: 'date'
  end

   def self.search(params)
     #tire.search(load: true, page: params[:page], per_page: 2) do
     tire.search(page: params[:page], per_page: 10) do
       #query { string params[:query] } if params[:query].present?
       #filter :range, created_at: {lte:Time.zone.now}
       #filter :term, user_id: params[:user_id] if params[:user_id].present?
       query do
         boolean do
           must { string params[:query] } if params[:query].present?
           must { range :created_at, lte: Time.zone.now - 700000}
           must { term :user_id, params[:user_id] } if params[:user_id].present?
         end
       end
       sort {by :created_at, "asc" } if params[:query].blank?
       facet "owners" do
         terms :user_id
       end
     end
   end

   def to_indexed_json
    to_json(methods: [:user_name])
   end

   def user_name
   	 user.name
   end
end


#We can set pagination also for this search and also default behaviour of search
# def self.search(params)
#      tire.search(load: true, page: params[:page], per_page: 2) do
#        query { string params[:query], default_operator: "AND" } if params[:query].present?
#        filter :range, created_at: {lte:Time.zone.now}
#        sort {by :created_at, "asc" } if params[:query].blank?
#      end
#    end

#rake environment tire:import CLASS=Blog FORCE=true (Reindexing)