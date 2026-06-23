# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.8.1.tar.gz"
  sha256 "ee59f5b4d231da4439703f470c7dcd9a573b5f2c6af336aac7f753804fe6b132"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.8.1"
    sha256 cellar: :any, arm64_linux: "79a77561b9abe45a4215228ae71bcd14377ebc1c416fdfd828382a006e0139aa"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "39dff54eeaadb51bd6af7e6ff6cc68d69d6a696c597b83a490ebbdeb7ce6a2fd"
    sha256 cellar: :any_skip_relocation, sequoia: "6d6dd3caa369d2ba378d4b86b326c6c30bc39910d4f838c2775378f8c781377c"
    sha256 cellar: :any, x86_64_linux: "3bc1a3802976e7a80b8a178904f7f2a1f333b532e15e0774175b99cd683408ce"
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
