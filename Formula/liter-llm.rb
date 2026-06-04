# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.57.tar.gz"
  sha256 "7a5c8f7524a996d83971f4b263c46762c077b4532534015fed6fc5318a7f6467"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.56"
    sha256 cellar: :any, arm64_linux: "033177350d6e8d9ac38cc6f3d05e31b9980e56c27b7ce242f5b355e496b493f9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "83786ac8148ba54543313b97addc1c67d0f62692143c23dad5ad65f37920669d"
    sha256 cellar: :any_skip_relocation, sequoia: "b5920751064a6a43448dca010e7097d5ad1d7eebd61ec4987a44eef9fc65d2c1"
    sha256 cellar: :any, x86_64_linux: "4204f67221039bd4e66cac701792da1c43ecf7ba9b71989ae83950a6a8ecbe40"
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
