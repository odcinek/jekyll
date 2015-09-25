class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
        @width = 560
        @height = 420
      else
        @width = $2.to_i
        @height = $3.to_i
      end
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    <<-eos
<div style='width:100%; float:left; text-align:center;'>
  <iframe style='text-align: center; display:block; margin: 0 auto;'
    width='#{@width}'
    height='#{@height}'
    src='http://www.youtube.com/embed/#{@id}?color=white&theme=light&iv_load_policy=3'
    frameborder='0'
    allowfullscreen>
  </iframe>
</div>
    eos
  end

  Liquid::Template.register_tag "youtube", self
end
