#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc,argv);
    
    QQmlApplicationEngine engine;
    engine.load(QUrl(QString("qrc:/main.qml")));
    
     return app.exec();
    
}