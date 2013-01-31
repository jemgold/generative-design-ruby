require 'ruby-processing'

class P_1_0_01 < Processing::App

  load_library :pdf
  include_package "processing.pdf"

  attr_reader :save_pdf

  def setup
    @save_pdf = false
    size 720, 720
    no_cursor
  end

  def draw
    if @save_pdf
      begin_record PDF, "#{Time.now().strftime("%Y-%m-%d")}.pdf"
    end

    color_mode HSB, 360, 100, 100
    rect_mode CENTER
    no_stroke
    background mouseY/2, 100, 100

    fill 360-mouseY/2, 200, 100
    rect 360, 360, mouseX+1, mouseX+1

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

P_1_0_01.new :title => "P_1_0_01"