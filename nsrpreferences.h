/*
 * Copyright (C) 2011-2015 Alexander Saprykin <xelfium@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA.
 */

#ifndef NSRPREFERENCES_H
#define NSRPREFERENCES_H

#include <QWidget>

#include "nsrtouchdialog.h"
#include "nsrsettings.h"

namespace Ui {
    class NSRPreferences;
}

class NSRPreferences : public NSRTouchDialog
{
    Q_OBJECT

public:
    explicit NSRPreferences(QWidget *parent = 0);
    ~NSRPreferences();

private slots:
	void closeButtonClicked();
	void onTextFontButtonClicked();
	void onTextEncodingButtonClicked();

signals:
	void preferencesUpdated();

private:
	Ui::NSRPreferences	*ui;
	NSRSettings		*_settings;
};

#endif // NSRPREFERENCES_H
