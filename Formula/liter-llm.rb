# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.52.tar.gz"
  sha256 "15682f1528a85de347279d23ac66e2c0d2b4c26da0ed0434a86cb0cdf62e09bd"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.50"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6787e0abda21b43e4cea4e47a9a7cf52796a4ccc21bf831fbcc19817c8bda052"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "11ac868caff2d2028898f5bd74327dc2d9f4a199c8c37c9b6663ff6f19db443f"
    sha256 cellar: :any_skip_relocation, sequoia: "0c51628b857748da0b66c9aba710ed644fdf630a45808bb89583a5364c268784"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "40b7671ca5bfec923c209e80d07a4160ca9153e66a3c83efd7aa6768b6c6199a"
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
