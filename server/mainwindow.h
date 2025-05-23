﻿#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QCloseEvent>
#include <QMessageBox>
#include "data.h"
#include "ui_mainwindow.h"
#include "questionsmanage.h"
#include "papermanage.h"
#include "examsetting.h"
#include "examcontrol.h"
#include "submark.h"
#include "membermanage.h"
#include "login.h"
#include "mainmenu.h"
#include "config.h"
#include "scoremanage.h"
#include "inoutput.h"
#include "papersetting.h"
#include "menu.h"

enum State{
    NO = 0,
    PREPARE = 1
};

namespace Ui
{
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
signals:
    void getQuestions();
    void getChoiceQuestions();
    void getEssayQuestions();
    void addOb_Questoins(ChoiceQuestions*);
    void addSub_Questoins(EssayQuestions*);
    void modifyOb_Questoins(ChoiceQuestions*);
    void modifySub_Questoins(EssayQuestions*);
    void deleteOb_Questoins(int);
    void deleteSub_Questoins(int);
    void showQuestions(QList<ChoiceQuestions*>,QList<EssayQuestions*>);
    void addPaper(Paper);
    void getAllPaper();
    void getPaperBySubject();
    void showAllPaper(QList<Paper*>);
    void showPaperBySubject(QList<Paper*>);
    void deletePaper(int);
    void queryPaperMark(int);
    void saveUsertoPaperMark(int,QList<Student*>);
    void modifyPaper(Paper);
    void showCurrentPaper(Paper);
    void getPaperById(int);
    void sendPaper(int);
    void beginExam();
    void getUserList();
    void updateUserTable(QList<Student*>);
    void endExam();
    void getUserByPaperId(int,QString);
    void showUserByPaperId(QList<Student*>);
    void getSubAnswer(int,QString);
    void showSubAnswer(QVector<QString>);
    void submitSubMark(QStringList);
    void loginSignal(User);
    void getManager();
    void getStudent();
    void getTeacher();
    void addStudent(Student*);
    void addTeacher(User *);
    void addManger(User *);
    void deleteUserId(QString);
    void deleteManagerId(int);
    void showManager(QList<User *>);
    void showStudent(QList<Student *>);
    void showTeacher(QList<User *>);
    void getcurrentPaperTime(int);
    void sendPaperTime(int,int);
    void getCombo_id(QString);//根据userid 获得
    void getCombo_paperid(int );
    void showCombo(QList<Combo *>);
    void delete_score(int,qlonglong);
    void outputUser();
    void outputOb();
    void outputSub();
    void outputPaper();
    void inputUser(QString);
    void inputOb(QString);
    void inputSub(QString);
    void inputPaper(QString);
    void sendInfo(QStringList);

    void showSubject(QList<QString>);
    void getSubject();
    void showType(QMap<int, QString>);
    void getType();

    void addType(int, QString);
    void deleteType(int);

    void updateStudent(Student *);
    void updateTeacher(User *);
    void updateManager(User *);
    void updateType(int, QString);
    void updateStudentList(QList<Student *>);
    void updateTeacherList(QList<User *>);
    void updateManagerList(QList<User *>);
    void updateTypeList(QMap<int, QString>);

    void setChoiceQuestions(QList<ChoiceQuestions*>);
    void setEssayQuestions(QList<EssayQuestions*>);
    void updateChoiceQuestion(ChoiceQuestions *);
    void updateEssayQuestion(EssayQuestions *);
    void showChoiceQuestionList(QList<ChoiceQuestions*>);
    void showEssayQuestionList(QList<EssayQuestions*>);

    void pauseExam();
    void continueExam();
    void sendMessage(QString);
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

    void getSelectPaper(int id);
    void showSelectStudent(QStringList);
    void appendExaminee(QStringList);
    void saveExaminee(int, QStringList);

    void setPaper(int);
    void setInfo(QStringList);
    void setPaperName(QString);
    void getPaperName();
    void setExamTime(QTime);
    void getExamTime();
    void menuMode(int);

    void setPaper(QList<Paper*>);
    void setCombo(QList<Combo*>);

private slots:
    void on_action_QuestionsManager_triggered();
    void on_action_makepaper_triggered();    
    void action_examsetting();
    void action_examconctrol();
    void on_action_subscore_triggered();
    void on_action_memmanager_triggered();
    void on_action_login_triggered();
    void on_action_mainmenu_triggered();
    void on_action_config_triggered();
    void on_action_scomanage_triggered();
    void on_action_inoutput_triggered();
    void on_action_Qt_triggered();
    void action_papersetting();    
    void examMode();
    void endExamMode();
    void LoginOK();
    void backToMenu();
    void closeEvent(QCloseEvent *);
    void pauseExamMode();
    void examPrepare();
    void examing();

private:
    void do_QuestionsManager();
    void do_makepaper();
    void do_examsetting();
    void do_examconctrol();
    void do_subscore();
    void do_memmanage();
    void do_login();
    void do_mainmenu();
    void do_menu();
    void do_config();
    void do_scomanage();
    void do_inoutput();
    void do_papersetting();

    Ui::MainWindow *_ui;
    QStatusBar *_statusBar;
    int state;
};

#endif // MAINWINDOW_H
