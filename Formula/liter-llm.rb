# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.7.6.tar.gz"
  sha256 "96e2964fe95494e332453d6e8d83d86c0326d8ae1b38132a5fdb76a309a1f127"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.7.5"
    sha256 cellar: :any, arm64_linux: "9e56766720f98adfc1510c1eeb7ad8dadfddee1382f85f8021f59fdda97e4431"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8dd1917c4fbb4e709f34761e4d08a08cd32a5f455af088529fdd5457b94ac3f5"
    sha256 cellar: :any_skip_relocation, sequoia: "502f2ba2fc3329d8c5ac7011cea7d1f3dabc2f8b71309d9e8efbdf011f0bcdea"
    sha256 cellar: :any, x86_64_linux: "70a05163ebce2f9034d9a44a9f3d2f0e6d4a94223af252e4216df7b9050c7588"
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
