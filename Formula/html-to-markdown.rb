# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.4.0"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.4.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6aa8b42b74c8332fbbdc22c18d2cb73bc9b61c5bd0050a0fbc99d5586d2c4231"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5ac172c28f8e2b285fc6aa9e17464b93e153af90d1cecd68c8fa4f33c9e8b4b7"
    sha256 cellar: :any_skip_relocation, sequoia: "99b28f3f1437cbcf44c93f9b94909e14eee1182337226efbf6aa882c4c6ba71e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d3d3e144c127149e75afcf1946e6cea046146482b9f2e634487fe5243ea44fac"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "f5f9b94e121cf1545991529fbca82c09f5902a5ffc476656893c31457645b40f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "b72fec089b561d35d6c10a93c2025ab89309d9dcb1e0a317e8357536f1304554"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5bef2b9c9e54de84e619993f100925aad89d8fcecb49309799fc81e8a234efa"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c71188422ba1f634c558f965ef4ba974f4a6d4c199f02e5e126040cd4f4491c"
    end
  end

  def install
    bin.install "html-to-markdown"
  end

  test do
    (testpath / "test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
