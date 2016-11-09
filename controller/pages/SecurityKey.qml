import QtQuick.Window 2.2
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import QtQml.Models 2.1
import Qt.labs.settings 1.0

Page {
    id: pageSecurityKey
    property string _suggestSetSecurityKey: "Để set security key, bạn bấm nút \"Set Security Key\" phía dưới"
    title: "Security Key"
    Settings {
        id: settings
        property string style: "Universal"
    }

    header:ToolBar {
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 25
            color: "#EF6C00"
        }
        RowLayout {
            spacing: 20
            anchors.fill: parent


            ToolButton {
                Image {
                    id: backDraw
                    height: 16
                    width: 16
                    source: "qrc:/images/navigation_previous_item.png"
                    anchors.centerIn: parent
                }
                onClicked: stackView.pop();
            }

            Label {
                id: titleLabel
                text: title
                font.pixelSize: 15
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                color: "white"
            }

            ToolButton {

            }
        }
    }

    ScrollBar {

        Text {
            id: txtView
            anchors.top: parent.top
            anchors.topMargin: 20
            height: 40
            width: Screen.width
            text: qsTr("")
            font.pixelSize: 20
            color: "gray"
            horizontalAlignment: Text.AlignHCenter

        }
        GridView {
            anchors {
                top: txtView.bottom
            }
            id: root
            width: Screen.width; height: Screen.height
            cellWidth: Screen.width/4; cellHeight: Screen.width/8
            clip: true
            displaced: Transition {
                NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
            }

            model: DelegateModel {
                id: visualModel
                model: ListModel {
                    id: colorModel
                    ListElement { color: "#FFF"; keyname: "A"; }
                    ListElement { color: "#FFF"; keyname: "B"; }
                    ListElement { color: "#FFF"; keyname: "C"; }
                    ListElement { color: "#FFF"; keyname: "D"; }
                    ListElement { color: "#FFF"; keyname: "E"; }
                    ListElement { color: "#FFF"; keyname: "F"; }
                    ListElement { color: "#FFF"; keyname: "0"; }
                    ListElement { color: "#FFF"; keyname: "1"; }
                    ListElement { color: "#FFF"; keyname: "2"; }
                    ListElement { color: "#FFF"; keyname: "3"; }
                    ListElement { color: "#FFF"; keyname: "4"; }
                    ListElement { color: "#FFF"; keyname: "5"; }
                    ListElement { color: "#FFF"; keyname: "6"; }
                    ListElement { color: "#FFF"; keyname: "7"; }
                    ListElement { color: "#FFF"; keyname: "8"; }
                    ListElement { color: "#FFF"; keyname: "9"; }
                    ListElement { color: "#FFF"; keyname: "DEL"; }
                }
                delegate: MouseArea {
                    id: delegateRoot

                    property int visualIndex: DelegateModel.itemsIndex

                    width: Screen.width/4; height: Screen.width/8
                    drag.target: icon

                    Rectangle {
                        id: icon
                        width: Screen.width/4; height: Screen.width/8
                        anchors {
                            left: parent.left
                            leftMargin: 5
                            top: parent.top
                            topMargin: 5
                            horizontalCenter: parent.horizontalCenter;
                            verticalCenter: parent.verticalCenter
                        }
                        border.color: "#E0E0E0"
                        border.width: 1
                        color: model.color
                        radius: 3

                        Text {
                            text: model.keyname;
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }

                    }

                    MouseArea {
                           anchors.fill: parent
                           onClicked: {
                                icon.color = "#FFF"

                           }
                           onPressed: {
                                icon.color = "gray"
                                if(model.keyname != "DEL")
                                {
                                    if(txtView.text.length < 5){
                                        txtView.text += model.keyname
                                        if(txtView.text.length == 2){
                                            txtView.text += "-"
                                        }
                                    }
                                }
                                else
                                {
                                    txtView.text = ""
                                }
                           }
                       }
                }
            }
        }
    }

    Button {
        id: scanButton
        height: 50

        anchors {
            left: parent.left
            leftMargin: 0
            right: parent.right
            rightMargin: 0
            bottom: parent.bottom
            bottomMargin: 0
        }

        onClicked: {
            console.log("onClicked Turn on")

        }
        Image {
            id: icon1
            width: 30
            height: 30
            anchors {
                right: buttonTitle.left
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
            source: "qrc:/images/menu_key.png"
        }
        Text {
            id: buttonTitle
            text: "SET SECURITY KEY"
            font.family: "Helvetica"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            color: "white"
        }
    }
}