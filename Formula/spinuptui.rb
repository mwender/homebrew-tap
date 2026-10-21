class Spinuptui < Formula
  desc "Terminal dashboard for browsing, monitoring, and managing SpinupWP servers"
  homepage "https://github.com/mwender/spinupwp-tui"
  url "https://registry.npmjs.org/spinuptui/-/spinuptui-1.2.0.tgz"
  sha256 "e2f09fd6d2a1562ac3ed26f73b01a7193da6b908161e52c1a78757fbb1b04f92"
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
