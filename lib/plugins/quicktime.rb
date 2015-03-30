module Castanaut
  module Plugin
    module Quicktime

      def start_recording(x, y, width, height)
        launch 'QuickTime Player'
        pause 2
        keystroke "n", "control", "command"

        hit Space

        pause 2
        move to(x, y), {:speed => 0.5}
        drag to(x + width, y + height), {:speed => 0.5}
        move to(x + width / 2, y + height / 2), {:speed => 0.5}
        pause 3
        click

      end

      def stop_recording()
        keystroke Esc, "control", "command"
      end

    end
  end
end

