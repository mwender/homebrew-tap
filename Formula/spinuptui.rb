class Spinuptui < Formula
  desc "Terminal dashboard for browsing, monitoring, and managing SpinupWP servers"
  homepage "https://github.com/mwender/spinupwp-tui"
  url "https://registry.npmjs.org/spinuptui/-/spinuptui-1.2.1.tgz"
  sha256 "c149a5d358015783029030464dca8cf3e269d80c6d3f711b4c04f9000e482b5a"
  license "MIT"

  depends_on "bun"

  # OpenTUI's prebuilt libopentui.dylib has an @rpath install name and no header
  # padding, so Homebrew can't rewrite it to an absolute path. Bun loads it by
  # full path anyway, so keep the name as shipped.
  preserve_rpath

  def install
    libexec.install Dir["*"]
    cd libexec do
      system formula_opt_bin("bun")/"bun", "install", "--production", "--frozen-lockfile"
    end
    (bin/"spinuptui").write_env_script libexec/"bin/spinuptui.js",
                                       PATH: "#{formula_opt_bin("bun")}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spinuptui --version")
  end
end
