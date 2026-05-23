# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.30.tar.gz"
  sha256 "45846d6bad06bff71098ce9d9afe4d19f8795051522f8817536536c7ee83dc31"
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.30"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2db2e67930593a6cdbd0a710cf24c05c06598261de94b5b85940a3bff20083ba"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bb838782c4c7a0611c089e6396f975d4e1dab9f90bc871e620adffe35a87750c"
    sha256 cellar: :any_skip_relocation, sequoia: "f6f6bee056f49cf1c9f0d2732e15d13cbe249ef22aafdd9495c32b95a8ed976e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "83bef8c8fe664c19ef76c0a423224ffba318aad0fd6a0d8461a131f72f925e56"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
