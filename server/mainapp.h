﻿#ifndef MAINAPP_H
#define MAINAPP_H

#include <QTime>
#include "dbmanager.h"
#include "mainwindow.h"
#include "server.h"
#include "iomanager.h"

enum ServerState
{
    STATE_NOEXAM,
    STATE_PAPERREADY,
    STATE_EXAMING,
    STATE_PAUSE
};

class MainApp : public QObject
{
    Q_OBJECT
public:
    MainApp();
    ~MainApp();
    void readConfig();//读取配置文件
    void iniDBManager();//数据库初始化
    void iniServer();//服务器初始化
    void iniMainWindow();//界面初始化

    Paper preparePaper(int);//准备试卷
    void userStateChange(int,QString);//考生状态改变
    void dealObAnswers(EssayAnswers);//接收到答案时处理客观题
    void dealSubAnswers(ChoiceAnswers);//接收到答案时处理客观题

signals:
    void sendData(int,qint32,QVariant);//发送数据
    void showQuestions(QList<ChoiceQuestions*>,QList<EssayQuestions*>);//显示题目
    void showChoiceQuestions(QList<ChoiceQuestions*>);
    void showEssayQuestions(QList<EssayQuestions*>);
    void showAllPaper(QList<Paper*>);//显示所以试卷
    void showPaperBySubject(QList<Paper*>);
    void showCurrentPaper(Paper);//显示某一张试卷
    void updateUserTable(QList<Student*>);//更新考试控制界面的考生表
    void showUserByPaperId(QList<Student*>);//按试卷显示考生
    void showSubAnswer(QVector<QString>);//显示主观题答案
    void showManager(QList<User *>);
    void showCombo(QList<Combo*>);//显示成绩
    void LoginOK();//登录成功信号
    void getcurrentPaperTime(int);//取得当前考试剩余时间
    void showSubject(QList<QString>);
    void showType(QMap<int, QString>);
    void showStudent(QList<Student *>);
    void showTeacher(QList<User *>);
    void updateStudentList(QList<Student *>);
    void updateTeacherList(QList<User *>);
    void updateManagerList(QList<User *>);
    void updateTypeList(QMap<int, QString>);

    void setChoiceQuestions(QList<ChoiceQuestions*>);
    void setEssayQuestions(QList<EssayQuestions*>);
    void showSelectStudent(QStringList);   
    void appendExaminee(QStringList);
    void setPaperName(QString);
    void setExamTime(QTime);

    void setCombo(QList<Combo*>);

public slots:
    void messageArrive(int,qint32,QVariant);//信息到达
    void removeUser(int);//将考生状态重置为未连接
    void getChoiceQuestion();
    void getEssayQuestion();
    void addOb_Questions(ChoiceQuestions*);//添加客观题
    void addSub_Questions(EssayQuestions*);//添加主观题
    void deleteOb_Questoins(int);//删除客观题
    void deleteSub_Questoins(int);//删除主观题
    void modifyOb_Questoins(ChoiceQuestions*);//修改客观题
    void modifySub_Questoins(EssayQuestions*);//修改主观题
    void addPaper(Paper);//添加试卷
    void getAllPaper();//获取试卷
    void getPaperBySubject();
    void getPaperById(int);//按ID获取试卷
    void saveUsertoPaperMark(int,QList<Student*>);//按试卷ID，将考生信息保存到papermark
    void deletePaper(int);//删除试卷
    void modifyPaper(Paper);//修改试卷
    void sendPaper(int);//发送试卷
    void getUserList();//更新考生状态信息
    void beginExam();//考试考试
    void endExam();//结束考试
    void pauseExam();
    void continueExam();
    void sendMessage(QString);
    bool userLogin(Student student);//考生登录
    void sendPaperTime(int,int);//发送带有当前剩余时间的试卷
    bool managerLogin(User);//管理员登录
    QList<Student*> getUserByPaperId(int,QString);//按试卷id查找考生
    void getSubAnswer(int,QString);//取得主观题答案
    void submitSubMark(QStringList);//提交主观题评分
    void getStudent();
    void getTeacher();
    void addStudent(Student *);//添加考生
//    void modifyUser(Student);//修改考生
    void addTeacher(User *);
    void addManager(User *);
    void deleteUserId(QString);//删除考生
    void deleteManagerId(int);//删除管理员
    void getCombo_id(QString );//根据userid 获得成绩
    void getCombo_paperid(int);//根据paperid获取成绩
    void delete_score(int pid,qlonglong uid);//根据paperid,userid删除试卷成绩
    //导入导出
    void outputUser();
    void outputOb();
    void outputSub();
    void outputPaper();
    void inputUser(QString);
    void inputOb(QString);
    void inputSub(QString);
    void inputPaper(QString);
    //发送考试信息
    void sendInfo(QStringList);
    void getManager();
    void getSubject();
    void getType();

    void addType(int, QString);
    void deleteType(int);

    void updateStudent(Student *);
    void updateTeahcer(User *);
    void updateManager(User *);
    void updateType(int, QString);

    void updateChoiceQuestion(ChoiceQuestions *);
    void updateEssayQuestion(EssayQuestions *);

    void startServer();
    void closeServer();

    void exportChoiceQuestion(QList<ChoiceQuestions *>, QString);
    void exportEssayQuestion(QList<EssayQuestions *>, QString);
    void importChoiceQuestion(QString);
    void importEssayQuestion(QString);
    void exportStudent(QList<Student *>, QString);
    void exportTeacher(QList<User *>, QString);
    void exportManager(QList<User *>, QString);
    void exportType(QMap<int, QString>, QString);
    void importStudent(QString);
    void importTeacher(QString);
    void importManager(QString);
    void importType(QString);
    void importExaminee(QString);

    void updatePaper(Paper *);
    void insertPaper(Paper *);

    void getSelectStudent(int);
    void saveExaminee(int, QStringList);

    void setPaper(int);
    void setInfo(QStringList);
    void getPaperName();
    void getExamTime();

private:
    DBManager *_DBM;
    MainWindow _window;
    Server *_server;
    Paper _mainPaper;
    QList<Student *> _userList;
    QString _dbName;
    QString _dbUser;
    QString _dbPassword;
    int _port;
    int _serverState;
    IOManager *_IOM;
    QString _infoList;

};
#endif // MAINAPP_H
