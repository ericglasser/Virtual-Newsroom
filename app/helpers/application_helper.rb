module ApplicationHelper
  # Return a title on a per-page basis.
   def title
     base_title = "Virtual Newsroom"
     if @title.nil?
       base_title
     else
       "#{base_title} | #{@title}"
     end
   end
   
   def logo
       image_tag("vnr.png", :alt => "Sample App", :class => "round")
  end
  
end
