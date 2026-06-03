# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.7"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "04e3737e31127780b9e5f82df95ae3c9396919677edfa0674045a22e57fbc602"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "47b08f809f5e436781abe680e5272abd11ee73b04ca83c374a264f238c512be3"
    sha256 cellar: :any_skip_relocation, sequoia: "68598b46c96d84c22299a9c0eb67e1ee250f9813836ab75bb6c9beb9c75f565f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "93fd896c74517789d649ecd5d8d793149875d43cd8338a52d58514babf5c208d"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "7160d6d261c065d137b396f2911ce4ebe1bf89a3746dbe0466c83d59a827e025"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "cd88e9096e474151debe1e470ff82e78fc2aa037c6d6ca59a418434480e40fb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ca78250e9358756c50d2cfa47ac08d385c96dc12e7319e106ffc5c8e326cb07"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b47e870b34b167063078d58776e3f2b650a32562d02f61a2f67a6eb48f7f6377"
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
