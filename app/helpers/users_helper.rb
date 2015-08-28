module UsersHelper
  def get_prompt(users)
     a = []
      users.each { |user| a << [user.name, user.id] if user.name }
      a
  end
  
  def display_collection(items)
    html = ''
    return html unless items
    @items.each do |item| 
      html += "<tr> <td> #{item.id} </td><td> #{item.name} </td> </tr>" if item       
    end 
    html.html_safe
  end
end
