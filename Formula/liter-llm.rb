# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.37.tar.gz"
  sha256 "2a1e74ae5017f1e3e4384cc65375e30a6d26759c32b5be02a7715b9e9663dbdd"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.37"
    sha256 cellar: :any_skip_relocation, arm64_linux: "80d51945b8dec7b981917e064dabc9a503ecf77a327b7f705425f3b88f03eb10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8550b32c30f8b7c7c01734a44073dc4614453d926af062f9b2c6718a5c0c100a"
    sha256 cellar: :any_skip_relocation, sequoia: "d952380d25d2988892bb2cbf9cc436bd75135eecdeec7c1ac3ab35936a68bccc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9934014fa0bb23a1cc47d69c869ba274d071640e2d9550b2c96859168e265d58"
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
