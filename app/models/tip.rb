class Tip < JSONRecord::Base
  def index
  end

  column :title, String
  column :text,  String
  column :date,  String
end