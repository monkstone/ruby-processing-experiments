# frozen_string_literal: true

load_library :video
java_import 'processing.video.Capture'

attr_reader :video

def settings
  size 1024, 768, P2D
end

def setup
  sketch_title 'Tinted Video'
  @video = Capture.new(self, width, height, 'UVC Camera (046d:0825)')
  video.start
end

def draw
  video.read if video.available

  # Medium
  tint 150, map1d(mouse_y, 0..width, 10..255), 150
  image video, 0, 0, width, height * 0.667

  # Small
  tint map1d(mouse_y, 0..width, 10..255), 150, 150
  image video, 0, height * 0.667, width / 2, height / 3

  tint 150, 150, map1d(mouse_y, 0..width, 10..255)
  image video, width / 2, height * 0.667, width / 2, height / 3
end
