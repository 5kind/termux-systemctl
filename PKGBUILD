# Contributor: 5kind https://github.com/5kind

_pkgname=docker-systemctl-replacement
pkgname=termux-systemctl

pkgver=1930.190870f
pkgrel=1
pkgdesc="termux systemctl replacement - allows to deploy to systemd-controlled containers without starting an actual systemd daemon"

_url='https://github.com/gdraheim/docker-systemctl-replacement'
url='https://github.com/5kind/termux-systemctl'
arch=('any')
license=('EUPL')
depends=('python')

source=("https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/EUPL-LICENSE.md"
	"${_pkgname}::git+${_url}"
	"${pkgname}::git+${url}")
b2sums=('7c81e385a62dbee1326de1004377b5dabc4ed795542e5f09dd3d4a381ae25992a36cae90c86a2c785b84a56db807836a70afd49ae9f5f499d601cb72f18074ac'
	'SKIP'
	'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

modify_shebang() {
    local input_file="$1"
    local output_file="$2"
    local new_shebang="$3"

    # sed modify shebang to output
    sed "1s|.*|$new_shebang|" "$input_file" > "$output_file"
	chmod $(stat -c %a "$input_file") "$output_file"
}

# PREFIX="/data/data/com.termux/files/usr"
NEW_SHEBANG='#!/data/adb/magisk/busybox ash'

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "files/docker/systemctl3.py" "${pkgdir}/${PREFIX}/usr/local/bin/systemctl3.py"
	install -Dm755 "files/docker/journalctl3.py" "${pkgdir}/${PREFIX}/usr/local/bin/journalctl3.py"
	cd "${srcdir}/${pkgname}"
	install -Dm755 "bin/systemctl" "${pkgdir}/${PREFIX}/usr/local/bin/systemctl"
	modify_shebang "${pkgdir}/${PREFIX}/usr/local/bin/systemctl" "${pkgdir}/${PREFIX}/usr/local/bin/init" "${NEW_SHEBANG}"
	ln -s "usr/local/bin/init" "${pkgdir}/${PREFIX}/init"
	install -Dm755 "bin/journalctl.sh" "${pkgdir}/${PREFIX}/usr/local/bin/journalctl"

	# Install LICENSE file
	install -Dm 644 EUPL-LICENSE.md "$pkgdir/${PREFIX}/usr/share/licenses/$pkgname/LICENSE"
}
