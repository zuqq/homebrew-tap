class Switcheroo < Formula
  desc "Automatically switch keyboard layout and natural scrolling settings when input devices are connected and disconnected."
  homepage "https://github.com/zuqq/switcheroo"
  url "https://github.com/zuqq/switcheroo/archive/0.2.0.tar.gz"
  sha256 "dabebf4b44c759439929542d6f7eecc2a433823e2bc9020693430fdcfffaf397"
  depends_on :xcode

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/switcheroo"
  end

  test do
    system bin/"switcheroo", "list-input-devices"
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
            <string>#{bin}/switcheroo</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
    </dict>
    </plist>
    EOS
  end
end

