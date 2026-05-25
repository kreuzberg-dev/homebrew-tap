# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "012618ab0184d89c49114547af3284acd17a924567d194897d36933a89c4fa72"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "051dc8c6f14341a8a720196a6a8700f54373d0a4c406fce8547513b516c9b324"
    sha256 cellar: :any_skip_relocation, sequoia: "c5fadab2d3e4a59acb5b028a2fad15cc16153f63680ef96ffc3e084ad3215835"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e9dae7632d96411c8a2fd1650bc030dd43ca91b1061e60ed69ecd7c53ec59700"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "eb70c063b5c01d0f0289ac0046c282290a7227d723f3e3274a7710f79e3048c3"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "936f89d98dbd2be0768c08bfb47aa7fd4e18a676462b299dabd8579c050e7ab0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25ea4ff13f74434849249de69dae5ca681d48a7c2e90c484364eeaeb9f0433c5"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d20e496d89bd1358d9f3932e224524faeaca44857dc7a98eab0333eb90decf21"
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
