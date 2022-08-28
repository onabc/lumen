import QtQuick 2.0
import QtQuick.Window 2.2
import Qt5Compat.GraphicalEffects

Image {
    id: root
    smooth: true
    
    property alias color: colorOverlay.color
    property int size: 96  // default
  
    sourceSize.width: size
    sourceSize.height: size

    ColorOverlay {
        id: colorOverlay
        anchors.fill: root
        source: root
        color: "#fff"
    }
}