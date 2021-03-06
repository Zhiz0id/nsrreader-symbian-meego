defineTest(qtcAddDeployment) {
	for(deploymentfolder, DEPLOYMENTFOLDERS) {
		item = item$${deploymentfolder}
		itemsources = $${item}.sources
		$$itemsources = $$eval($${deploymentfolder}.source)
		itempath = $${item}.path
		$$itempath = $$eval($${deploymentfolder}.target)
		export($$itemsources)
		export($$itempath)
		DEPLOYMENT += $$item
	}

	symbian {
		ICON = nsrreader.svg
	} else:unix {
		!isEmpty(MEEGO_VERSION_MAJOR) {
			desktopfile.files = nsrreader.desktop
			desktopfile.path = /usr/share/applications
			icon.files = nsrreader.png
			icon.path = /usr/share/icons/hicolor/80x80/apps
			pvrconfig.files = nsrreader.ini
			pvrconfig.path = /etc/powervr.d
		} else:maemo5 {
			desktopfile.files = nsrreader-maemo.desktop
			desktopfile.path = /usr/share/applications/hildon
			icon.files = nsrreader-maemo.png
			icon.path = /usr/share/icons
			pvrconfig.files = nsrreader-maemo.ini
			pvrconfig.path = /etc/powervr.d
		}
	}

	maemo5 {
		installPrefix = /usr
	} else {
		installPrefix = /opt/$${TARGET}
	}

	for(deploymentfolder, DEPLOYMENTFOLDERS) {
		item = item$${deploymentfolder}
		itemfiles = $${item}.files
		$$itemfiles = $$eval($${deploymentfolder}.source)
		itempath = $${item}.path
		$$itempath = $${installPrefix}/$$eval($${deploymentfolder}.target)
		export($$itemfiles)
		export($$itempath)
		INSTALLS += $$item
	}

	!isEmpty(desktopfile.path) {
		export(icon.files)
		export(icon.path)
		export(desktopfile.files)
		export(desktopfile.path)
		INSTALLS += icon desktopfile
	}

	target.path = $${installPrefix}/bin
	export(target.path)
	INSTALLS += target

        unix {
		!isEmpty(MEEGO_VERSION_MAJOR)|maemo5 {
                        export(pvrconfig.path)
			export(pvrconfig.files)
                        INSTALLS += pvrconfig
                }
	}

	export (ICON)
	export (INSTALLS)
	export (DEPLOYMENT)
	export (TARGET.EPOCHEAPSIZE)
	export (TARGET.CAPABILITY)
	export (LIBS)
	export (QMAKE_EXTRA_TARGETS)
}
