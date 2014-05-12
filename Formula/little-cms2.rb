require 'formula'

class LittleCms2 < Formula
  homepage 'http://www.littlecms.com/'
  url 'https://downloads.sourceforge.net/project/lcms/lcms/2.6/lcms2-2.6.tar.gz'
  sha1 'b0ecee5cb8391338e6c281d1c11dcae2bc22a5d2'

  bottle do
    cellar :any
    sha1 "06ec67737332d592670109bac5547d42276557a0" => :mavericks
    sha1 "57ef9368e594929537805df109031fbe799b3d8a" => :mountain_lion
    sha1 "79aa4fcb97599f1902b70eebbf3acbbc9936f75e" => :lion
  end

  depends_on 'jpeg' => :recommended
  depends_on 'libtiff' => :recommended

  option :universal

  def install
    ENV.universal_binary if build.universal?

    args = %W{--disable-dependency-tracking --prefix=#{prefix}}
    args << "--without-tiff" if build.without? "libtiff"
    args << "--without-jpeg" if build.without? "jpeg"

    system "./configure", *args
    system "make install"
  end
end
