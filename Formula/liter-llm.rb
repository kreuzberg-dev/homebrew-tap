# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.44.tar.gz"
  sha256 "bb6ace2cbbc81a4c3c1bd79beb8bcd18eec5ae4bfeefca29f985119be5cf62a6"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.44"
    sha256 cellar: :any_skip_relocation, arm64_linux: "469c984348e68388d5c1e4af47cf1eaa57111fa8085f94f383994b4ff3b0591b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4fb92fa834d169447c8f05cbbe9a4a81e35ab41e9321d50e4a79894f20e12fce"
    sha256 cellar: :any_skip_relocation, sequoia: "adc3c3e53ddbcca1ccaecafb4defda3b468fc12e75e07520d1caea82e5f8fe2d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e67deb8da362da6542e8faae35ecb560547221b22708fac1e45247f86a6e37ab"
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
