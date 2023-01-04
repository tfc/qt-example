import QtQuick
import QtQuick.Window

Window {
    id: root
    width: 600
    height: 600
    visible: true
    title: qsTr("Hello World")

    Image {
        id: qtLogo
        fillMode: Image.PreserveAspectFit
        width: parent.width / 3
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        source: 'images/qt.svg'
    }

    Image {
        id: nixosLogo
        fillMode: Image.PreserveAspectFit
        width: parent.width * 0.8
        height: parent.height * 0.8
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        source: 'images/nix.svg'
    }

    Text {
        y: nixosLogo.y + nixosLogo.height + 5
        width: root.width

        color: 'green'
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 20;
        text: 'Hello World!'
    }
}
