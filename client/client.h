﻿#ifndef CLIENT_H
#define CLIENT_H
#include<QtNetwork>
/*自定义信息类型*/
enum MessageType
{
    MSG_LOGIN,
    MSG_GETPAPER,
    MSG_ANSWER,
    MSG_ANSWERSINGLE,
    MSG_BEGINEXAM,
    MSG_ENDEXAM,
    MSG_ERROR,
    MSG_NEWCONNECT,
    MSG_PAUSEEXAM,
    MSG_CONTINUEEXAM,
    MSG_MESSAGE
};


/*客户端类*/
class Client : public  QTcpSocket
{
    Q_OBJECT
public:
    Client(QObject* parent);

signals:
    void messageArrive(qint32,QVariant);//信息到达信号
public slots:
    void displayError(QAbstractSocket::SocketError);//显示错误信息
    void connectToServer(const QString,qint32);//与服务器连接
    void sendData(qint32,QVariant);//发送预处理
    void readData();//读取数据
private:
    qint32 _messageType;//信息类型
    QVariant _data;//信息内容
    qint32 _totalBytes;//块大小
    void send();//发送数据
};
#endif // CLIENT_H
