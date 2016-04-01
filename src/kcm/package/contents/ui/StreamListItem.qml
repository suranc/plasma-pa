/*
    Copyright 2014-2015 Harald Sitter <sitter@kde.org>

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation; either version 2 of
    the License or (at your option) version 3 or any later version
    accepted by the membership of KDE e.V. (or its successor approved
    by the membership of KDE e.V.), which shall act as a proxy
    defined in Section 14 of version 3 of the license.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

import org.kde.kquickcontrolsaddons 2.0

import org.kde.plasma.private.volume 0.1

ColumnLayout {
    id: delegate

    property alias deviceType: deviceComboBox.deviceType
    property alias deviceModel: deviceComboBox.model

    width: parent.width

    RowLayout {
        Layout.fillWidth: true
        spacing: units.smallSpacing * 2

        ClientIcon {
            id: clientIcon

            Layout.preferredHeight: delegateColumn.height * 0.66
            Layout.preferredWidth: Layout.preferredHeight
            client: PulseObject.client
        }

        ColumnLayout {
            id: delegateColumn
            Layout.fillWidth: true

            RowLayout {
                Label {
                    id: inputText
                    Layout.fillWidth: true
                    text: i18nc("label of stream items", "%1: %2", PulseObject.client.name, PulseObject.name)
                    elide: Text.ElideRight
                }

                DeviceComboBox {
                    id: deviceComboBox
                    Layout.leftMargin: units.smallSpacing
                    Layout.rightMargin: units.smallSpacing
                    Layout.preferredWidth: delegate.width / 3
                    visible: count > 1
                }

                MuteButton {
                    muted: PulseObject.muted
                    onMutedChanged: PulseObject.muted = muted
                }
            }

            VolumeSlider {}
        }
    }

    ListItemSeperator { view: delegate.ListView.view }
}
