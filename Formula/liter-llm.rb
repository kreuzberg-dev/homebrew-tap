# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.36.tar.gz"
  sha256 "3bfb56cee0827808f997a5d8c31e5e75dde1ffd17d9e2a69fec65d067e9ad7d6"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.35"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c20cdabd991af53bcb7ccbacead4704f41a696388fdc9ae05e746794cc3a9c2b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3f7a29a041e8f45ffc031f5944211924aaa61e26ab8b51f95584c352e2a04031"
    sha256 cellar: :any_skip_relocation, sequoia: "0286ff822053af5eddb593f488b4a68e1d1b6d2ff8009d85a7a8b73aaddc2a25"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b3e96adff89c0b2a9a851454dfc04537cb64f0b1b5a21f6c2d1d0bb2a78d6fc0"
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
