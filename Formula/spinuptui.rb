class Spinuptui < Formula
  desc "Terminal dashboard for browsing, monitoring, and managing SpinupWP servers"
  homepage "https://github.com/mwender/spinupwp-tui"
  url "https://registry.npmjs.org/spinuptui/-/spinuptui-1.0.0.tgz"
  sha256 "9e532851300d8c8bab51580a889c740fa37a25b48b7b4fb30c3f7cfc1c894bf6"
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
