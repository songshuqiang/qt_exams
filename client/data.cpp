﻿#include"data.h"

Student::Student()
{
    qRegisterMetaTypeStreamOperators<Student>("User");
}
void Student::setID(QString id)
{
    _id = id;
}
void Student::setName(QString n)
{
    _name = n;
}
void Student::setGrade(int c)
{
    _grade = c;
}
void Student::setClass(int c)
{
    _class = c;
}
void Student::setPassword(QString c)
{
    _password = c;
}
void Student::setState(QString s)
{
    _state = s;
}
void Student::setHostName(QString host)
{
    _hostname = host;
}
void Student::setSockDescriptor(int descriptor)
{

    _socketDescriptor = descriptor;
}
QString Student::getID() const
{
    return _id;
}
QString Student::getName() const
{
    return _name;
}
int Student::getGrade() const
{
    return _grade;
}
int Student::getClass() const
{
    return _class;
}
QString Student::getPassword() const
{
    return _password;
}
QString Student::getState() const
{
    return _state;
}
QString Student::getHostname() const
{
    return _hostname;
}
int Student::getSockDescriptor() const
{
    return _socketDescriptor;
}

Student &Student::GetInstance()
{
    static Student student;
    return student;
}

QDataStream &operator >>(QDataStream &in,Student &user)
{
    in >> user._id >> user._name >> user._class >> user._grade >> user._password >> user._hostname;
    return in;
}
QDataStream &operator <<(QDataStream &out,const Student &user)
{
    out << user._id << user._name << user._class << user._grade << user._password << user._hostname;
    return out;
}

EssayQuestions::EssayQuestions()
{
    qRegisterMetaTypeStreamOperators<EssayQuestions>("Sub_questions");
}
QDataStream &operator >>(QDataStream &in,EssayQuestions &sub)
{
    in >> sub._questionId >> sub._questionTitle >> sub._questionType;
    return in;
}
QDataStream &operator <<(QDataStream &out,const EssayQuestions &sub)
{
    out << sub._questionId << sub._questionTitle << sub._questionType;
    return out;
}
void EssayQuestions::setQuestionId(int id)
{
    _questionId = id;
}
void EssayQuestions::setQuestionType(QString type)
{
    _questionType = type;
}
void EssayQuestions::setQuestionTitle(QString title)
{
    _questionTitle = title;
}
int EssayQuestions::getQuestionId()
{
    return _questionId;
}
QString EssayQuestions::getQuestionType()
{
    return _questionType;
}
QString EssayQuestions::getQuestionTitle()
{
    return _questionTitle;
}

ChoiceAnswers::ChoiceAnswers()
{
    qRegisterMetaTypeStreamOperators<ChoiceAnswers>("Sub_answers");
}
void ChoiceAnswers::setAnswerId(int id)
{
    _answerId = id;
}
void ChoiceAnswers::setPaperId(int id)
{
    _paperId = id;
}
void ChoiceAnswers::setStudentId(QString id)
{
    _studentId = id;
}
void ChoiceAnswers::setAnswerList(QVector<QString> answer)
{
    _answerList = answer;
}
int ChoiceAnswers::getAnswerId() const
{
    return _answerId;
}
int ChoiceAnswers::getPaperId() const
{
    return _paperId;
}
QString ChoiceAnswers::getStudentId() const
{
    return _studentId;
}
QVector<QString> ChoiceAnswers::getAnswerList() const
{
    return _answerList;
}
QDataStream &operator >>(QDataStream &in,ChoiceAnswers &sub)
{
    in >> sub._answerId >> sub._paperId >> sub._studentId >> sub._answerList;

    return in;
}
QDataStream &operator <<(QDataStream &out,const ChoiceAnswers &sub)
{
    out << sub._answerId << sub._paperId << sub._studentId << sub._answerList;

    return out;
}

Paper::Paper()
{
    qRegisterMetaTypeStreamOperators<Paper>("Paper");

}
QDataStream &operator >>(QDataStream &in,Paper &p)
{
    in >> p._paperId >> p._description >> p._obQuIds >> p._subQuIds >> p.obList >> p.subList >> p._totalMark >> p._percent >> p._time;
    return in;
}
QDataStream &operator <<(QDataStream &out,const Paper &p)
{
    out << p._paperId << p._description <<p ._obQuIds << p._subQuIds << p.obList << p.subList << p._totalMark << p._percent << p._time;
    return out;
}
int Paper::getPaperId()
{
    return _paperId;
}
QString Paper::getObQuIds()
{
    return _obQuIds;
}
QString Paper::getSubQuIds()
{
    return _subQuIds;
}
QString Paper::getDescription()
{
    return _description;
}
int Paper::getTotalMark()
{
    return _totalMark;
}
int Paper::getPercent()
{
    return _percent;
}
int Paper::getTime()
{
    return _time;
}
QString Paper::getDate()
{
    return _date;
}
void Paper::setPaperId(int id )
{
    _paperId = id;
}
void Paper::setObQuIds(QString id )
{
    _obQuIds = id;
}
void Paper::setSubQuIds(QString id )
{
    _subQuIds = id;
}
void Paper::setDescription(QString description )
{
    _description = description;
}
void Paper::setTotalMark(int mark )
{
    _totalMark = mark;
}
void Paper::setPercent(int percent )
{
    _percent = percent;
}
void Paper::setTime(int t)
{
    _time = t;
}
void Paper::setDate(QString d)
{
    _date = d;
}

ChoiceQuestions::ChoiceQuestions()
{
    qRegisterMetaTypeStreamOperators<ChoiceQuestions>("Ob_questions");
}
QDataStream &operator >>(QDataStream &in,ChoiceQuestions &ob)
{
    in >> ob._questionId >> ob._questionTitle >> ob._answer >> ob._questionType;
    return in;
}
QDataStream &operator <<(QDataStream &out,const ChoiceQuestions &ob)
{
    out << ob._questionId << ob._questionTitle << ob._answer << ob._questionType;
    return out;
}
int ChoiceQuestions::getQuestionId()
{
    return _questionId;
}
QString ChoiceQuestions::getQuestionType()
{
    return _questionType;
}
QString ChoiceQuestions::getQuestionTitle()
{
    return _questionTitle;
}
QString ChoiceQuestions::getAnswer()
{
    return _answer;
}
void ChoiceQuestions::setQuestionId(int id)
{
    _questionId = id;
}
void ChoiceQuestions::setQuestionType(QString type)
{
    _questionType = type;
}
void ChoiceQuestions::setQuestionTitle(QString title)
{
    _questionTitle = title;
}
void ChoiceQuestions::setAnswer(QString answer)
{
    _answer = answer;
}

EssayAnswers::EssayAnswers()
{
    qRegisterMetaTypeStreamOperators<EssayAnswers>("Ob_answers");
}
int EssayAnswers::getAnswerId() const
{
    return _answerId;
}
int EssayAnswers::getPaperId() const
{
    return _paperId;
}
QString EssayAnswers::getStudentId() const
{
    return _studentId;
}
QString EssayAnswers::getAnswers() const
{
    return _answers;
}
void EssayAnswers::setAnswerId(int id)
{
    _answerId = id;
}
void EssayAnswers::setPaperId(int id)
{
    _paperId = id;
}
void EssayAnswers::setStudentId(QString id)
{
    _studentId = id;
}
void EssayAnswers::setAnswers(QString answers)
{
    _answers = answers;
}
QDataStream &operator >>(QDataStream &in,EssayAnswers &ob)
{
    in >> ob._answerId >> ob._paperId >> ob._studentId >> ob._answers;
    return in;
}
QDataStream &operator <<(QDataStream &out,const EssayAnswers &ob)
{
    out << ob._answerId << ob._paperId << ob._studentId << ob._answers;
    return out;
}

AllAnswers::AllAnswers()
{
    qRegisterMetaTypeStreamOperators<AllAnswers>("All_answers");
}
void AllAnswers::setObanswer(EssayAnswers ob)
{
    _obAnswer = ob;
}
void AllAnswers::setSubanswer(ChoiceAnswers sub)
{
    _subAnswer = sub;
}
void AllAnswers::setPaperId(int id)
{
    _paperId = id;
}
void AllAnswers::setUserId(QString id)
{
    _userId = id;
}
EssayAnswers AllAnswers::getObanswer()
{
    return _obAnswer;
}
ChoiceAnswers AllAnswers::getSubanswer()
{
    return _subAnswer;
}
int AllAnswers::getPaperId()
{
    return _paperId;
}
QString AllAnswers::getUserId()
{
    return _userId;
}
QDataStream &operator >>(QDataStream &in,AllAnswers &all)
{
    in >> all._paperId >> all._userId >> all._obAnswer >> all._subAnswer;
    return in;
}
QDataStream &operator <<(QDataStream &out,const AllAnswers &all)
{
    out << all._paperId << all._userId << all._obAnswer << all._subAnswer;
    return out;
}

Combo::Combo()
{
    qRegisterMetaTypeStreamOperators<Combo>("Combo");
}

void Combo::setUserId(QString a)
{
    _userId = a;
}
void Combo::setName(QString s)
{
    _name = s;
}
void Combo::setGrade(int a)
{
    _grade = a;
}
void Combo::setClass(int b)
{
    _class = b;
}
void Combo::setTime(int t)
{
    _time = t;
}
void Combo::setPaperId(int d)
{
    _paperId = d;
}
void Combo::setPaperMark(int m)
{
    _paperMark = m;
}
void Combo::setObmark(int m)
{
    _obmark = m;
}
void Combo::setSubmark(int m)
{
    _submark = m;
}
void Combo::setPaperName(QString n)
{
    _paperName = n;
}

QString Combo::getUserId()
{
    return _userId;
}
QString Combo::getName()
{
    return _name;
}
int Combo::getGrade()
{
    return _grade;
}
int Combo::getClass()
{
    return _class;
}
int Combo::getTime()
{
    return _time;
}
int Combo::getPaperId()
{
    return _paperId;
}
int Combo::getPaperMark()
{
    return _paperMark;
}
int Combo::getObmark()
{
    return _obmark;
}
int Combo::getSubMark()
{
    return _submark;
}
QString Combo::getPaperName()
{
    return _paperName;
}
QDataStream &operator >>(QDataStream &in,Combo &c)
{
    in >> c._paperName >> c._obmark >> c._submark >> c._paperMark;
    return in;
}
QDataStream &operator <<(QDataStream &out,const Combo &c)
{
    out << c._paperName << c._obmark << c._submark << c._paperMark;
    return out;
}
