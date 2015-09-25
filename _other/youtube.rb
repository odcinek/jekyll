class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
        @col = 6
        @aspect = '16by9' # 16by9, 4by3
      else
        @col = $2.to_i
        @aspect = $3
      end

    @offset = ((12-@col)/2).to_i
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    <<-eos
<div class="row">
  <div class="col-md-offset-#{@offset} col-sm-#{@col} col-md-offset-#{@offset}">
    <div class="embed-responsive embed-responsive-#{@aspect}">
      <iframe
        class="embed-responsive-item"
        src='http://www.youtube.com/embed/#{@id}?color=white&theme=light&iv_load_policy=3'
        frameborder='0'
        allowfullscreen>
      </iframe>
    </div>
  </div>
</div>
    eos
  end

  Liquid::Template.register_tag "youtube", self
end
