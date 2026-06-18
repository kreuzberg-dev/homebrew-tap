# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.7.1.tar.gz"
  sha256 "cc07f527b7660e08a56bb630f22f9d960e97081f8951052ffa4620286b8ad4eb"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.7.1"
    sha256 cellar: :any, arm64_linux: "f92e06ea65468f5a550546c867045dd559b89f725bb6a633895f8177505e6101"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4a7e6a52b443ae65fdda373064aa1d1897e2bdfff06744c296838315554ed7c0"
    sha256 cellar: :any_skip_relocation, sequoia: "ca4a566366bf3fdd446697667652f7af2918ace34d63ca6bcd69c7e923c7af05"
    sha256 cellar: :any, x86_64_linux: "4eb01e5c76f9751ff1636758cd884ae770652762bc049ff9b2b02cf11691d1c8"
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
