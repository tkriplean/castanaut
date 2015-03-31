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
        pause 1
        click 

      end

      def stop_recording(export_path)

        # stop recording
        execute_applescript(%Q'
          tell application "System Events"
            key code 53 using {control down, command down}
          end tell
        ')
        pause 2

        # invoke save dialog
        keystroke "s", "command"
        pause 1

        # set location
        type '/', {:applescript => true}
        pause 1
        type File.dirname(export_path)[1..-1], {:applescript => true}
        pause 1
        execute_applescript(%Q'
          tell application "System Events"
            tell process "QuickTime Player" to keystroke return
          end tell
        ')

        # set filename
        type File.basename(export_path), {:applescript => true}
        pause 1
        execute_applescript(%Q'
          tell application "System Events"
            tell process "QuickTime Player" to keystroke return
          end tell
        ')
        pause 1

        # quit quicktime
        keystroke "q", "command"

      end

    end
  end
end

