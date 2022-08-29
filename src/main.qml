import QtQuick
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.5
import QtQuick.Shapes 1.15
import Qt5Compat.GraphicalEffects as GE

ApplicationWindow {
    id: shell
    visible: true
    // visibility: Window.Maximized
    flags: Qt.Window | Qt.FramelessWindowHint
    width: 1080
    height: 720
    minimumHeight: 480
    minimumWidth: 720
    color: "#070709"

    property real bw: 5

    function toggleMaximized() {
        if (shell.visibility === Window.Maximized) {
            shell.showNormal()
        } else {
            shell.showMaximized()
        }
    }

    // The mouse area is just for setting the right cursor shape
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: {
            const p = Qt.point(mouseX, mouseY)
            const b = bw + 10
            // Increase the corner size slightly
            if (p.x < b && p.y < b)
                return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y >= height - b)
                return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y < b)
                return Qt.SizeBDiagCursor
            if (p.x < b && p.y >= height - b)
                return Qt.SizeBDiagCursor
            if (p.x < b || p.x >= width - b)
                return Qt.SizeHorCursor
            if (p.y < b || p.y >= height - b)
                return Qt.SizeVerCursor
        }
        acceptedButtons: Qt.NoButton // don't handle actual events
    }

    DragHandler {
        id: resizeHandler
        grabPermissions: TapHandler.TakeOverForbidden
        target: null
        onActiveChanged: if (active) {
                             const p = resizeHandler.centroid.position
                             const b = bw + 10
                             // Increase the corner size slightly
                             let e = 0
                             if (p.x < b) {
                                 e |= Qt.LeftEdge
                             }
                             if (p.x >= width - b) {
                                 e |= Qt.RightEdge
                             }
                             if (p.y < b) {
                                 e |= Qt.TopEdge
                             }
                             if (p.y >= height - b) {
                                 e |= Qt.BottomEdge
                             }
                             shell.startSystemResize(e)
                         }
    }

    ColumnLayout {
        anchors.margins: bw
        spacing: 2
        anchors.fill: parent

        ToolBar {
            id: toolBar
            Layout.fillWidth: true
            Layout.preferredHeight: 30

            Keys.enabled: true
            focus: true
            Keys.onEscapePressed: {
                shell.close()
            }

            background: Rectangle {
                color: "transparent"
            }

            Item {
                anchors.fill: parent
                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 10
                    Image {
                        id: ico
                        width: 18
                        height: 18
                        source: "qrc:/assets/logo.png"
                    }

                    Label {
                        text: "铁马冰河"
                        elide: Label.ElideRight
                        color: "white"
                    }
                }

                Row {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 10

                    /*
                    Button{
                        width: 20
                        height: 20
                        display: AbstractButton.IconOnly
                        icon.source: "qrc:/assets/close.svg"
                        icon.width: 10
                        icon.height: 10
                        icon.color: "white"
                        background: Rectangle{
                            color: "transparent"
                        }
                        onClicked: {
                            shell.close()
                        }
                    }
                */
                    ToolButton {
                        id: closeBtn
                        width: 25
                        height: 25
                        IconSVG {
                            anchors.centerIn: parent
                            width: 10
                            height: 10
                            source: "qrc:/assets/close.svg"
                        }
                        background: Rectangle {
                            radius: 3
                            color: closeBtn.hovered ? "#ae1c1c" : "transparent"
                        }
                        onClicked: {
                            shell.close()
                        }
                    }
                }

                TapHandler {
                    onTapped: if (tapCount === 2)
                                  toggleMaximized()
                    gesturePolicy: TapHandler.DragThreshold
                }
                DragHandler {
                    grabPermissions: TapHandler.CanTakeOverFromAnything
                    onActiveChanged: if (active) {
                                         shell.startSystemMove()
                                     }
                }
            }
        }

        Rectangle {
            id: container
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#29292d"
            radius: 5

            Rectangle {
                id: rect
                x: 100
                y: 100
                width: 100
                height: 100
                color: "red"
                MouseArea {
                    anchors.fill: parent
                    drag.target: rect
                    drag.minimumX: 5
                    drag.maximumX: container.width - rect.width - 5
                    drag.minimumY: 5
                    drag.maximumY: container.height - rect.height - 5
                    drag.smoothed: false
                }

                ResizableRectangle {
                    resizeTarget: rect //设置调整目标ID
                }
            }
        }
    }
}
