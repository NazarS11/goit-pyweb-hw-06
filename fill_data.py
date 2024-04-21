from datetime import date
from faker import Faker
from random import randint, choice
import sqlite3


NUMBER_STUDENTS = 50
NUMBER_GROUPS = 3
NUMBER_TEACHERS = 4
NUMBER_GRADES = 20
NUMBER_SUBJECTS = 8
fake_data = Faker()

def generate_fake_data(number_students, number_teachers, number_subjects) -> tuple():
    fake_students = []
    fake_groups = ['CI-11','CI-12','CI-14']
    fake_subjects = ['Algorithm Theory',
 'Modern Literature',
 'Environmental Science',
 'Quantum Mechanics',
 'Comparative Politics',
 'Introduction to Psychology',
 'Ancient Civilizations',
 'Microeconomic Theory']
    fake_teachers = []
       
    for _ in range(number_students):
        fake_students.append(fake_data.name())

    for _ in range(number_teachers):
        fake_teachers.append(fake_data.name())
     
    return fake_students, fake_teachers, fake_subjects, fake_groups

def prepare_data(students, teachers, subjects, groups) -> tuple():
    for_teachers = []

    for teacher in teachers:
        for_teachers.append((teacher, ))

    for_students = []
    
    for student in students:
        for_students.append((student, randint(1, NUMBER_GROUPS)))

    for_groups = []

    for group in groups:
        for_groups.append((group, ))

    for_subjects = []
    
    for subject in subjects:
        for_subjects.append((subject, randint(1, NUMBER_TEACHERS)))

    for_grades = []
    
    for student in range(1, NUMBER_STUDENTS + 1):
        for grade_num in range(1, randint(14,NUMBER_GRADES)):
            random_date = fake_data.date_between(start_date=date(2024,1,1), end_date=date(2024,1,30))
            for_grades.append((student, randint(1,NUMBER_SUBJECTS), randint(10,100), random_date))

    return for_teachers, for_students, for_groups, for_subjects, for_grades


def insert_data_to_db(teachers, students, groups, subjects, grades) -> None:

    with sqlite3.connect('university.db') as con:

        cur = con.cursor()

        sql_to_teachers = """INSERT INTO teachers(name)
                               VALUES (?)"""
        cur.executemany(sql_to_teachers, teachers)

        sql_to_subjects = """INSERT INTO subjects(name, teacher_id)
                               VALUES (?, ?)"""
        cur.executemany(sql_to_subjects, subjects)

        sql_to_groups = """INSERT INTO groups(name)
                              VALUES (?)"""
        cur.executemany(sql_to_groups, groups)

        sql_to_students = """INSERT INTO students(name, group_id)
                              VALUES (?, ?)"""
        cur.executemany(sql_to_students, students)

        sql_to_grades = """INSERT INTO grades(student_id, subject_id, grade, date_received)
                              VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_grades, grades)

        con.commit()



if __name__ == "__main__":
    teachers, students, groups, subjects, grades = prepare_data(*generate_fake_data(NUMBER_STUDENTS,NUMBER_TEACHERS,NUMBER_SUBJECTS))
    insert_data_to_db(teachers, students, groups, subjects, grades)