# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.8.0-rc.37.tar.gz'
  sha256 'd3f1343d8dfa0e698d79136cbc6e32bfa4c47fa66795340e4c9b00c8187a2395'
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.37'
    sha256 cellar: :any_skip_relocation, arm64_linux: 'b9d545edcbb27925c9c7fccedea621ae92c8e7c6d71077041a21816562305ba8'
    sha256 cellar: :any_skip_relocation, arm64_sequoia: '121bc0b6a8c3e0e08495e1c80a16df8bffebebd13f46ae62c55dd6f682881ce5'
    sha256 cellar: :any_skip_relocation, sequoia: '75ef8bc67138db4e567c08a2997c3150034f4d77e0c5f2c8cd28f1b323fc87b3'
    sha256 cellar: :any_skip_relocation, x86_64_linux: 'be7502863e4e988ac65148069006934eb6326fe4f2098782d01e6aaf750c59be'
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
