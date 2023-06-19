class CmdictBasic < Formula
  include Language::Python::Virtualenv

  desc "Command-line dictionary toolset"
  homepage "https://github.com/pastydev/cmdict"
  url "https://files.pythonhosted.org/packages/d2/b7/68e0064a82e0a6d7998e4a8584b8e77976002094f6a16c4fbecfa76070d0/cmdict-0.1.5.tar.gz"
  sha256 "454c14a89ba492830a7273825ed8f3f5efc1a1235014c57fd0d5c4004c872aca"
  license "MIT"

  bottle do
    root_url "https://github.com/pastydev/homebrew-cmdict/releases/download/cmdict-0.1.5"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:  "85e44f965a4382b732f68f5277b64ba701434cbdabd6e79944417eab5f66d4a0"
    sha256 cellar: :any_skip_relocation, monterey: "2aae25575d539e4cd7a0c7f1db24c015bc8226002636fb7cde1a3d09ac024517"
    sha256 cellar: :any_skip_relocation, big_sur:  "e0a5061a8800d1f65b1baa52849f2937385b7d7f0fcac24a2f32d0b9e26cf63b"
  end

  conflicts_with "cmdict", because: "two versions of the same application"

  # Required by "rapidfuzz".
  depends_on "cmake"

  # Formulae for apps that require Python 3 should declare an
  # unconditional dependency on "python@3.x", based on
  # https://docs.brew.sh/Python-for-Formula-Authors#python-declarations-for-applications.
  depends_on "python@3.11"

  # Not install via PyPI, to avoid unwanted system libraries
  # "/lib/x86_64-linux-gnu/libyaml-0.so.2" in ubuntu 22.04.
  depends_on "pyyaml"

  # Required by "cryptography" during its build on Linux.
  on_linux do
    depends_on "rust" => :build
  end

  # The following specifications are generated by
  # https://github.com/pastydev/homebrew-cmdict/actions/workflows/poet.yml.

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/93/71/752f7a4dd4c20d6b12341ed1732368546bc0ca9866139fe812f6009d9ac7/certifi-2023.5.7.tar.gz"
    sha256 "0f0d56dc5a6ad56fd4ba36484d6cc34451e1c6548c61daad8c320169f91eddc7"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/ff/d7/8d757f8bd45be079d76309248845a04f09619a7b17d6dfc8c9ff6433cac2/charset-normalizer-3.1.0.tar.gz"
    sha256 "34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf88b8886012906f509b5"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438/idna-3.4.tar.gz"
    sha256 "814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4"
  end

  resource "loguru" do
    url "https://files.pythonhosted.org/packages/0c/1d/697cbb4ae54217784c1c4805696efb2fd7a1cbbe4827264a80a49e52b828/loguru-0.7.0.tar.gz"
    sha256 "1612053ced6ae84d7959dd7d5e431a0532642237ec21f7fd83ac73fe539e03e1"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/3d/78/81191f56abb7d3d56963337dbdff6aa4f55805c8afd8bad64b0a34199e9b/tqdm-4.65.0.tar.gz"
    sha256 "1871fb68a86b8fb3b59ca4cdd3dcccbc7e6d613eeed31f4c332531977b89beb5"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/d6/af/3b4cfedd46b3addab52e84a71ab26518272c23c77116de3c61ead54af903/urllib3-2.0.3.tar.gz"
    sha256 "bee28b5e56addb8226c96f7f13ac28cb4c301dd5ea8a6ca179c0b9835e032825"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cmdict", "--help"
  end
end