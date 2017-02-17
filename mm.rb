class Mm < Formula
  homepage "https://github.com/mediamicroservices/mm"
  url "https://github.com/mediamicroservices/mm/archive/mm_v2.2.7.tar.gz"
  sha256 "d1b7e6903801b8045ea3f271bc8d42a33897f8a43696dce13ac6bbab06138127"
  head "https://github.com/mediamicroservices/mm.git"
  revision 1

  depends_on "cowsay"
  depends_on "dvdrtools"
  depends_on "dvdauthor"
  depends_on "exiftool"
  depends_on "sdl"
  depends_on "ffmpeg" => ["with-sdl2", "with-freetype", "with-libebur128"]
  depends_on "flac"
  depends_on "hashdeep"
  depends_on "mediaconch"
  depends_on "media-info"
  depends_on "homebrew/dupes/rsync"
  depends_on "tree"
  depends_on "xmlstarlet"

  def install
    bin.install "aipupgrade"
    bin.install "barcodeinterpret"
    bin.install "blackatends"
    bin.install "checksum2filemaker"
    bin.install "checksumpackage"
    bin.install "createpremisdb"
    bin.install "dbbackup"
    bin.install "finishpackage"
    bin.install "fix_left2stereo"
    bin.install "fix_rewrap"
    bin.install "fix_timecode"
    bin.install "fix_volume"
    bin.install "ingestfile"
    bin.install "makebroadcast"
    bin.install "makedvd"
    bin.install "makeflv"
    bin.install "makeframes"
    bin.install "makelossless"
    bin.install "makemetadata"
    bin.install "makemets"
    bin.install "makemkvchapters"
    bin.install "makemp3"
    bin.install "makepdf"
    bin.install "makepodcast"
    bin.install "makeprores"
    bin.install "makeqctoolsreport"
    bin.install "makeresourcespace"
    bin.install "makeslate"
    bin.install "makewaveform"
    bin.install "makeyoutube"
    bin.install "migratefiles"
    bin.install "mm-desktop-setup"
    bin.install "mmconfig"
    bin.install "mmfunctions"
    bin.install "mmupdate"
    bin.install "paperingest"
    bin.install "phasecheck"
    bin.install "qatesting"
    bin.install "quickcompare"
    bin.install "removeDSStore"
    bin.install "restructureForCompliance"
    bin.install "tesseract.conf"
    bin.install "updatingplist"
    bin.install "uploadomneon"
    bin.install "verifytree"
    bin.install "xdcamingest"
  end

  def post_install
    system "updatingplist"
  end

  def caveats; <<-EOS.undent
    If using the PREMIS DB reporting feature of mm, backup can be controlled via included plist file. Backup only needs to be activated/configured on the DB host computer. Included plist file will run daily backups at 2:00AM if activated.
    EOS
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>OnDemand</key>
        <true/>
        <key>RunAtLoad</key>
        <true/>
        <key>StartCalendarInterval</key>
        <dict>
          <key>Hour</key>
          <integer>02</integer>
          <key>Minute</key>
          <integer>00</integer>
        </dict>
        <key>ProgramArguments</key>
        <array>
            <string>#{bin}/dbbackup</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
