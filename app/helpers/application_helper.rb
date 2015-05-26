module ApplicationHelper

    def bar_graph(part, whole, css=nil)
      if whole == 0
        percentage = 0
      else
        percentage = ((part.to_f / whole)*100).round
      end

      fill = percentage > 100 ? 100 : percentage
      color = colorize fill

      content_tag :table, class: 'percentage' do
        content_tag :tr, class: css do
          content_tag :td, class: "graph" do
            content_tag :div, '&nbsp;'.html_safe, class: 'filled', style: "width: #{fill}%; background-color: #{color}; "
          end
        end
      end
    end

    def colorize(fill)
      if fill == 100
        color = 'rgb(0%, 100%, 0%)'
      else
        color = "rgb(#{100}%, #{fill}%, 0%)"
      end
    end

    def label_for(percent)
      if percent < 1 || percent > 99
        ''
      else
        percent
      end
    end

    def name_of(browser_sym)
      case browser_sym
      when :ie6
        'IE 6'
      when :ie8
        'IE 8'
      when :ie9
        'IE 9'
      when :ie10
        'IE 10'
      when :ie11
        'IE 11'
      when :ff
        'Firefox'
      when :chrome
        'Chrome'
      when :safari
        'Safari'
      when :ios
        'iOS'
      end
    end

end
