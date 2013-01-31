require 'ruby-processing'

class P_1_1_1_01 < Processing::App

  load_library :pdf
  include_package "processing.pdf"

  attr_reader :save_pdf

  def setup
    @save_pdf = false
    size 800, 400
    background 0
  end

  def draw
    if @save_pdf
      begin_record PDF, "#{Time.now().strftime("%Y-%m-%d")}.pdf"
    end

    no_stroke
    color_mode HSB, width, height, 100

    stepX = mouseX + 2
    stepY = mouseY + 2

    0.step(height, stepY) do |y|
      0.step(width, stepX) do |x|
        fill x, height - y, 100
        rect x, y, stepX, stepY
      end
    end

    if @save_pdf
      @save_pdf = false
      end_record
    end
  end

  def key_pressed
    if key == 's' or key == 'S'
      save_frame "#{Time.now().strftime("%Y-%m-%d")}+##.png"
    end
    if key == 'p' or key == 'P'
      @save_pdf = true
    end
  end
end

P_1_1_1_01.new :title => "P_1_1_1_01"