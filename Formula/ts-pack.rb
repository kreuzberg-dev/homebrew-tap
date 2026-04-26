# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.2.tar.gz'
  sha256 '89b38022c695b9d25cb6749ffc06e060b08e134f87297dec7a42157d8b19913c'
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.2'
    sha256 cellar: :any_skip_relocation, arm64_sequoia: '877fcbbfc1a63d720c60e47eef80f9f6d64a09edd08ba3f1e5b2eb7664aa0b0a'
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
