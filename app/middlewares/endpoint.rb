require Rails.root.join('lib/railsnatra')
class Endpoint < Railsnatra
  use LoggerMiddleware, "3 - railsnatra! \\m/"
  prepend_view_path Rails.root.join('views')

  get "/world" do
    render template: "sample"
  end

  get "/" do
    render text: "Yeah Railsnatra!\nTry hitting /world\n"
  end

  private

  def hi
    "something else"
  end
end
