# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.55.tar.gz"
  sha256 "d52c80fbb4dea2821d0f71f0bcfccf0568ce97d2e70fa98af38f0183371f75bc"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.53"
    sha256 cellar: :any, arm64_linux: "710b37d3dca09f6bc27684403f80982af247ec6a579d4a6c5e66aa0562f82509"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ff802daa320b6ed5d916ef028f51ee2405d15ae88a50943faac9dabd7d322ec3"
    sha256 cellar: :any_skip_relocation, sequoia: "b348c1f25bd9745322de3c84819d7adfc67a2045ed9719daa8288a67fd927a11"
    sha256 cellar: :any, x86_64_linux: "045ffb690eaa7ed0afa6d748f3252a4be8583ef4d0686a2bb2397384f8121f08"
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
