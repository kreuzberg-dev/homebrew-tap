# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'OpenAI-compatible LLM proxy server and MCP tool server'
  homepage 'https://kreuzberg.dev'
  url 'https://github.com/kreuzberg-dev/liter-llm/archive/v1.2.2.tar.gz'
  sha256 'PLACEHOLDER'
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  bottle do
    root_url 'https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.4'
    sha256 cellar: :any_skip_relocation, arm64_linux: 'abd3218236ea6937da0184961995234a709e1b48c171831fe25fb83edc527acf'
    sha256 cellar: :any_skip_relocation, arm64_sequoia: '6589423a5750d9c63abfe3ad105e4f467b844782bb09019aaca7143f059d9fa6'
    sha256 cellar: :any_skip_relocation, sequoia: 'e496a4f65aea31fc4b2c06f37484a62b28166559327ef92532b238d83727badf'
    sha256 cellar: :any_skip_relocation, x86_64_linux: '302651ffab058515c9ba5f6f5e6841dc8d4a6e2dcc5ec4314cdc5660df21330a'
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
