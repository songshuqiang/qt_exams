﻿#ifndef SCOREMANAGEUI_H
#define SCOMREANAGEUI_H

#include <QWidget>
//#include "ui_ScoreManageUI.h"
#include "ui_scoremanage.h"
#include "data.h"

class ScoreManageUI : public QWidget,public Ui::ScoreManageUI
{
    Q_OBJECT
public:
    ScoreManageUI(QWidget *parent = 0);
    ~ScoreManageUI();

signals:
    void getCombo_id(QString);//根据userid 获得
    void getCombo_paperid(int);
    void delete_score(int,qlonglong);

public slots:
    void showPapers(QList<Paper*> paperList);
    void on_pushButton_print_clicked();
    void showCombo(QList<Combo*>);
    void paperChange(QTableWidgetItem*);
    void setPapers(QList<Paper*>);
    void setCombo(QList<Combo*>);

private slots:
    void on_pushButton_delete_clicked();
    void on_pushButton_searchPaper_clicked();
    void on_pushButton_allPaper_clicked();
    void on_pushButton_searchstudent_clicked();
    void on_pushButton_allStudent_clicked();

private :
    QList<Paper*> papers;
    QList<Combo*> combos;
    QList<Paper*> selectedPapers;
    QList<Combo*> selectedCombos;
    QButtonGroup paperSelect;
    QButtonGroup comboSelect;
};

#endif // SCOMANAGEUI_H
