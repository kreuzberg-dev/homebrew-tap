# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.46.tar.gz"
  sha256 "0ee5384eab84a371e6438644018bd9aa2c7eeefbc1a16a766d21e5a56a8e633b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.45"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3b9a9d626ffd46ac043e264f60bd08b34fdba0f8771a367b8af27bf97fe70c54"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1dcf9d576d3c7219d6ba4819cf81329e3acae56afd2f96581112b01bb8f933c4"
    sha256 cellar: :any_skip_relocation, sequoia: "15d7121f04cb394afcc1aaa33d16a93c337ccd45210dd8c8540fd6c14e74ffd8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "63ac1f43a7747ee6ceb9638f15e6fede4ca18f9b5c16f5725283eda979e35da1"
  end

  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
