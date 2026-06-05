# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.61.tar.gz"
  sha256 "e278efe457a228dc1a13387e27f6ca3daece0e2cc8320be7975a8bb5eb8525d7"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.61"
    sha256 cellar: :any, arm64_linux: "315e63403e9095daa061fa619c9c7d08a2a7e3a534f1991f319454b16d220218"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bbaa4181a42e1b2554e118d048c1afdfef3742cf537f429422a011c3108e9b01"
    sha256 cellar: :any_skip_relocation, sequoia: "4e3cea567c1026a8afa4245dc1a96b957f42ed8c30eae248b9eb485b7fdf717c"
    sha256 cellar: :any, x86_64_linux: "56d9fa1f93c0a45359282cbb30b989ad4cd46fd203978b0e416417b7adfcdfea"
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
