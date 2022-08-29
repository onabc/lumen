import QtQuick 2.0

Item {
    id:rect
    property int minimumWidth: 50
    property int minimumHeight: 50
    property int mouseRegion: 5
    property var resizeTarget: rect
    anchors.fill: resizeTarget

    MouseArea {
        id:leftX
        width: mouseRegion
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeHorCursor
        property int xPosition: 0
        onPressed: {
            xPosition = mouseX
        }

        onPositionChanged: {
            var xOffset = mouseX-xPosition
            if(rect.resizeTarget.x+xOffset>0 && rect.resizeTarget.width-xOffset>minimumWidth){
                rect.resizeTarget.x = rect.resizeTarget.x+xOffset
                rect.resizeTarget.width = rect.resizeTarget.width-xOffset
            }
        }
    }

    MouseArea{
        id:rightX
        width: mouseRegion
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: 0
        cursorShape: Qt.SizeHorCursor
        property int xPosition: 0
        onPressed: {
            xPosition = mouseX
        }

        onPositionChanged: {
            var xOffset = mouseX-xPosition
            var xWidth = rect.resizeTarget.width+xOffset
            if(xWidth+rect.resizeTarget.x<rect.resizeTarget.parent.width && xWidth>minimumWidth){
                rect.resizeTarget.width = xWidth
            }
        }
    }

    MouseArea{
        id:topY
        height: mouseRegion
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeVerCursor
        property int yPosition: 0
        onPressed: {
            yPosition = mouseY
        }

        onPositionChanged: {
            var yOffset = mouseY-yPosition
            if(rect.resizeTarget.y+yOffset>0 && rect.resizeTarget.height-yOffset>minimumHeight){
                rect.resizeTarget.y = rect.resizeTarget.y+yOffset
                rect.resizeTarget.height = rect.resizeTarget.height-yOffset
            }
        }
    }

    MouseArea{
        id:bottomY
        height: mouseRegion
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor
        property int yPosition: 0
        onPressed: {
            yPosition = mouseY
        }

        onPositionChanged: {
            var yOffset = mouseY-yPosition
            var yHeight = rect.resizeTarget.height+yOffset
            if(yHeight+rect.resizeTarget.y<rect.resizeTarget.parent.height && yHeight>minimumHeight){
                rect.resizeTarget.height = yHeight
            }
        }
    }

    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0
        cursorShape: Qt.SizeFDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouseX
            yPosition = mouseY
        }

        onPositionChanged: {
            var xOffset = mouseX-xPosition
            if(rect.resizeTarget.x+xOffset>0 && rect.resizeTarget.width-xOffset>minimumWidth){
                rect.resizeTarget.x = rect.resizeTarget.x+xOffset
                rect.resizeTarget.width = rect.resizeTarget.width-xOffset
            }
            var yOffset = mouseY-yPosition
            if(rect.resizeTarget.y+yOffset>0 && rect.resizeTarget.height-yOffset>minimumHeight){
                rect.resizeTarget.y = rect.resizeTarget.y+yOffset
                rect.resizeTarget.height = rect.resizeTarget.height-yOffset
            }
        }
    }

    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        cursorShape: Qt.SizeBDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouseX
            yPosition = mouseY
        }

        onPositionChanged: {
            var xOffset = mouseX-xPosition
            var xWidth = rect.resizeTarget.width+xOffset
            if(xWidth+rect.resizeTarget.x<rect.resizeTarget.parent.width && xWidth>minimumWidth){
                rect.resizeTarget.width = xWidth
            }
            var yOffset = mouseY-yPosition
            if(rect.resizeTarget.y+yOffset>0 && rect.resizeTarget.height-yOffset>minimumHeight){
                rect.resizeTarget.y = rect.resizeTarget.y+yOffset
                rect.resizeTarget.height = rect.resizeTarget.height-yOffset
            }
        }
    }

    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeBDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouseX
            yPosition = mouseY
        }
        onPositionChanged: {
            var xOffset = mouseX-xPosition
            if(rect.resizeTarget.x+xOffset>0 && rect.resizeTarget.width-xOffset>minimumWidth){
                rect.resizeTarget.x = rect.resizeTarget.x+xOffset
                rect.resizeTarget.width = rect.resizeTarget.width-xOffset
            }
            var yOffset = mouseY-yPosition
            var yHeight = rect.resizeTarget.height+yOffset
            if(yHeight+rect.resizeTarget.y<rect.resizeTarget.parent.height && yHeight>minimumHeight){
                rect.resizeTarget.height = yHeight
            }
        }
    }


    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeFDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouseX
            yPosition = mouseY
        }
        onPositionChanged: {
            var xOffset = mouseX-xPosition
            var xWidth = rect.resizeTarget.width+xOffset
            if(xWidth+rect.resizeTarget.x<rect.resizeTarget.parent.width && xWidth>minimumWidth){
                rect.resizeTarget.width = xWidth
            }
            var yOffset = mouseY-yPosition
            var yHeight = rect.resizeTarget.height+yOffset
            if(yHeight+rect.resizeTarget.y<rect.resizeTarget.parent.height && yHeight>minimumHeight){
                rect.resizeTarget.height = yHeight
            }
        }
    }
}
