require 'formula'

class Libfreenect < Formula
	homepage 'http://openkinect.org'
	url 'https://github.com/jimjibone/libfreenect/archive/v0.1.2.1.tar.gz'
	sha1 '30651ac2e8433b37f93651f0868c7dc685916735'

	head 'https://github.com/jimjibone/libfreenect.git'

	option :universal

	depends_on 'cmake' => :build
	depends_on 'libusb'

	def install
		if build.universal?
			ENV.universal_binary
			ENV['CMAKE_OSX_ARCHITECTURES'] = "i386;x86_64"
		end
		mkdir "build" do
			system "cmake", "..", *std_cmake_args
			system "make install"
		end
	end
end