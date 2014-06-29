require "erb_generator"

class HTMLGenerator < ERBGenerator #HTMLgenerator inherits properties from ERBgenerator

  def initialize(wrapper = nil)
    @wrapper = wrapper
  end

  def section(text)
    template = "<section><%= some_text %></section>" #creating a string of text that will do the html that I want
    options_hash = {:locals => {:some_text => text}, layout: @wrapper} #section_texts match, name of the parameter does not go through
    erb(template, options_hash) #erb defines the how
  end

    def unordered_list(list)
      template = <<-TEMPLATE
      <ul>
        <% kitchen_edibles.each do |item| %>
        <li> <%= item %> </li>
        <% end %>
      </ul>
      TEMPLATE

      erb(template, {:locals => {:kitchen_edibles => items}, layout: @wrapper})
    end
 end

def button(text, class_hash = nil)
  template = "<button class='flashy_class'>flashy-button</button>"
  options_hash = {:locals => {:some_text => text}, layout: @wrapper}
  erb(template, options_hash)
end


#you can change the section_text to anything, as long as they match
#The local key has to match the local variable inside the hash
#Any words that match in the hash and variable can be replaced with text
#The string IS the template, template for what we want to happen later
#If you don't put the % it wont evaluate the Ruby code, it will just reproduce whats inside
#Can't access a local variable from erb, that's why the hash has to be made


#"<section><%= some_text %></section><h1><%- title_text%></h1>"" <---Contains 2 variables
# {
#   :locals => {
#   :some_text => "text",
#   :title text => "title"
#  }
# }