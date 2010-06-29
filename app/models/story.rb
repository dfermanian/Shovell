class Story < ActiveRecord::Base
  validates_presence_of :name, :link
  
  has_many :votes do
    def latest
      find :all, :order => 'id DESC', :limit => 3
    end
  end

  def to_param
    if  name[-1,1] =~ /\W/
     "#{id}-#{name[0,name.size-1].gsub(/(\W)+/, '-').downcase}"
   else 
     "#{id}-#{name.gsub(/(\W)+/, '-').downcase}"
   end
  end
  
  
  
end
