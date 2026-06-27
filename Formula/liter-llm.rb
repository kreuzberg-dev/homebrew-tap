# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://xberg.io'
  url "https://github.com/xberg-io/liter-llm/archive/v1.9.0.tar.gz"
  sha256 "7ddaca09d4404d45135eb61227d1cf56aee7e0ec5f29954ffcafb0da5a06b229"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.9.0"
    sha256 cellar: :any, arm64_linux: "61ecdc69b3025c8ab01e45c46a24350338950fb4d6bfe2d1f9ff7e9ba9a80c3e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aa2b79301f9376c9444d588ac1e1b3119f5ccaebf4368cf9a808af5ebb260739"
    sha256 cellar: :any_skip_relocation, sequoia: "107a1a9053ea6466d37008acbe3aac7e62308a95f78c87010b28add26975782c"
    sha256 cellar: :any, x86_64_linux: "02cd5bca50cc525f5bc375132306726a646d705e7bc15cdb27c4a99d6f95961a"
  end

  head 'https://github.com/xberg-io/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
