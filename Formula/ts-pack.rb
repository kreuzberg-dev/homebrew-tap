# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.2.tar.gz'
  sha256 "3fb4456316b6cc65b181d4d81a7550f244ca757fc711db5655a46c20659e4944"
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.26"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f7847fc2c75d3f278b2eb08cbc9458ca42e58fa3c99f34400378174dfb14c3c5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "45e8b921a31062ae4a03af99780628adfa579859ae7f854c13469bfe33655732"
    sha256 cellar: :any_skip_relocation, sequoia: "705740fffe95d07aff1ea5a91545e4c5f36b64903eead22adee9eda8a805d837"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "47655b58c458a4c31eb079859abd19443ef0004e8b2d79b3085689a66fd3ce09"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
