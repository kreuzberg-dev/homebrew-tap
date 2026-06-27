# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://xberg.io'
  url "https://github.com/xberg-io/liter-llm/archive/v1.9.0-rc.2.tar.gz"
  sha256 "bfd45365c2cf21b6d7395ef90c5a08dd039a7a6bd3b5e1803aa74de11ab9623f"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.9.0-rc.1"
    sha256 cellar: :any, arm64_linux: "f2062a5d8bbdb6a0eb49931aee16db137a0fc135dee85078df92507108ffd508"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "92ca405444f53b044a01764084d9c72ac6c1acd4418c465d9126607fce6932d3"
    sha256 cellar: :any_skip_relocation, sequoia: "f14ed47b69f96f5b1ce267909527849944838641b4a52a6165a0722f3deb8552"
    sha256 cellar: :any, x86_64_linux: "c338e84bce120ca9561d0cbf1dd46d5cef4d6b2984ad886c8716e04c1c578451"
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
