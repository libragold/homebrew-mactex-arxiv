cask "mactex-no-gui-arxiv" do
  version "2023.0314"
  sha256 "57304ece58618f0dfc6a41be39d1d6e8f688d81247c84a89eb1cc788b280050b"

  url "https://ftp.math.utah.edu/pub/tex/historic/systems/mactex/2023/mactex-#{version.no_dots}.pkg"
  name "MacTeX (arXiv version)"
  desc "Full TeX Live distribution without GUI applications - pinned to arXiv's TeX Live 2023"
  homepage "https://www.tug.org/mactex/"

  depends_on formula: "ghostscript"

  pkg "mactex-#{version.no_dots}.pkg",
      choices: [
        {
          # Ghostscript
          "choiceIdentifier" => "org.tug.mactex.ghostscript10.0.0",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # GUI Applications
          "choiceIdentifier" => "org.tug.mactex.gui2023",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # TeX Live
          "choiceIdentifier" => "org.tug.mactex.texlive2023",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 1,
        },
      ]

  uninstall pkgutil: "org.tug.mactex.texlive2023",
            delete:  [
              "/etc/manpaths.d/TeX",
              "/etc/paths.d/TeX",
              "/Library/TeX",
              "/usr/local/texlive/2023",
            ]

  zap trash: "/usr/local/texlive/texmf-local",
      rmdir: "/usr/local/texlive"

  caveats <<~EOS
    You must restart your terminal window for the installation of MacTeX CLI
    tools to take effect.

    Alternatively, Bash and Zsh users can run the command:

      eval "$(/usr/libexec/path_helper)"

    This version is pinned to TeX Live 2023 to match arXiv's current setup.
    For the latest TeX Live version, use the standard mactex-no-gui cask.
  EOS
end
