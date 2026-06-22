# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.8.0.tar.gz"
  sha256 "59584215cee486624bc92471ac9741feab072a19c70987c3b3a3301ca03ae5e0"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.8.0"
    sha256 cellar: :any, arm64_linux: "0f3fbf5ce1bc0a08b61cd17ccbe6bd614dc1c8b4add3c19927add083836db44d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a5f629e9be20751e3d953c4cb7a7f18194e31ca11849699ec646f6b19cbfb02f"
    sha256 cellar: :any_skip_relocation, sequoia: "4e1f0b578b0713671c95887743a440a2181bf8892b6006c61410913c635a225e"
    sha256 cellar: :any, x86_64_linux: "3dbf141cdb0e6066c0591098dfeec73f90962229b9244ef69096af0302ea3046"
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
