# This file is automatically generated by https://github.com/heroku/cli/blob/main/scripts/release/homebrew.js
# Do not update this file directly;
# Please update the template instead:
class Gfh < Formula
  desc "test"
  homepage "https://gfh.ch"
  url "https://github.com/gfh-test/gfh-cli/releases/download/0.0.6/gfh-v0.0.5-c0f2bda-darwin-arm64.tar.gz"
  sha256 "940095f06b806224d8749fd1ca9a8044145fb87e3d5d92ef5ca6ee1bdd61f75e"
  version "1.0.0"
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gfh-test/gfh-cli/releases/download/0.0.6/gfh-v0.0.5-c0f2bda-darwin-arm64.tar.gz"
      sha256 "940095f06b806224d8749fd1ca9a8044145fb87e3d5d92ef5ca6ee1bdd61f75e"
    end
  end

  def install
    inreplace "bin/gfh", /^CLIENT_HOME=/, "export GFH_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/gfh"

  end

  def caveats; <<~EOS
    To use the Gfh CLI's autocomplete --
      Via homebrew's shell completion:
        1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
            NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                  and called, either explicitly or via a framework like oh-my-zsh.
        2) Then run
          $ gfh autocomplete --refresh-cache
      OR
      Use our standalone setup:
        1) Run and follow the install steps:
          $ gfh autocomplete
  EOS
  end

  test do
    system bin/"gfh", "--version"
  end
end
