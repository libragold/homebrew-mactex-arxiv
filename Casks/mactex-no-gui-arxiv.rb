cask "mactex-no-gui-arxiv" do
  version "2025.0308"
  sha256 "be084f849e545d9e9511b791da07ca4f9f33d85d42bb69dade636e345421ab7c"

  url "https://ftp.math.utah.edu/pub/tex/historic/systems/mactex/#{version.major}/mactex-#{version.no_dots}.pkg"
  name "MacTeX (arXiv version)"
  desc "Full TeX Live distribution without GUI applications - pinned to arXiv's TeX Live 2025"
  homepage "https://www.tug.org/mactex/"

  depends_on formula: "ghostscript"

  pkg "mactex-#{version.no_dots}.pkg",
      choices: [
        {
          # Ghostscript
          "choiceIdentifier" => "org.tug.mactex.ghostscript10.04.0",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # Ghostscript Dynamic Library
          "choiceIdentifier" => "org.tug.mactex.ghostscript10.04.0-libgs",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # Ghostscript Mutool
          "choiceIdentifier" => "org.tug.mactex.ghostscript10.04.0-mutool",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # GUI Applications
          "choiceIdentifier" => "org.tug.mactex.gui#{version.major}",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # TeX Live
          "choiceIdentifier" => "org.tug.mactex.texlive#{version.major}",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 1,
        },
      ]

  uninstall pkgutil: "org.tug.mactex.texlive#{version.major}",
            delete:  [
              "/etc/manpaths.d/TeX",
              "/etc/paths.d/TeX",
              "/Library/TeX",
              "/usr/local/texlive/#{version.major}",
            ]

  zap trash: "/usr/local/texlive/texmf-local",
      rmdir: "/usr/local/texlive"

  caveats <<~EOS
    You must restart your terminal window for the installation of MacTeX CLI
    tools to take effect.

    Alternatively, Bash and Zsh users can run the command:

      eval "$(/usr/libexec/path_helper)"

    This version is pinned to TeX Live 2025 to match arXiv's current setup.
    For the latest TeX Live version, use the standard mactex-no-gui cask.
  EOS
end
