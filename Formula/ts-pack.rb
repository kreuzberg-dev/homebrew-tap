# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 305 parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  version '1.8.0-rc.42'
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 'd3f795def03a187374de6c4ac93b782d6cd4f112f1ba10000ef7381300defae9'
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.42'
    sha256 cellar: 'any_skip_relocation', arm64_linux: '92447b2586d7d809789d94cf19a29e97ae45c29c209ea99213de41014996e520'
    sha256 cellar: 'any_skip_relocation', arm64_sequoia: '86c3ef925ac291ef219b9666fb73b622e63d95f73e80ec43755a5bc82a4ca089'
    sha256 cellar: 'any_skip_relocation', sequoia: '6fc8d6327d583882a825ab3c80434c05bb30102e537b4f97e94547c7f1301d42'
    sha256 cellar: 'any_skip_relocation', x86_64_linux: '6cfe652f903ec042b090dced5f09bddb02befcc42d86d79e9cbf582cf803ccf4'
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
