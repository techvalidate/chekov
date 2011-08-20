module ApplicationHelper
  
    def bar_graph(part, whole, css=nil)
      if whole == 0
        percentage = 0
      else
        percentage = ((part.to_f / whole)*100).round
      end
      
      fill = percentage > 100 ? 100 : percentage
      if fill == 100
        color = 'rgb(0%, 100%, 0%)'
      else
        color = "rgb(#{100}%, #{fill}%, 0%)"
      end

      content_tag :table, class: 'percentage' do 
        content_tag :tr, class: css do
          content_tag :td, class: "graph" do
            content_tag :div, '&nbsp;'.html_safe, class: 'filled', style: "width: #{fill}%; background-color: #{color}; "
          end
        end
      end
    end
  
end
