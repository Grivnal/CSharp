using System;
using System.Collections.Generic;
using System.Linq;

public class University
{
    public List<Student> Students { get; set; } = new List<Student>();

    public void AddStudent(Student student)
    {
        Students.Add(student);
    }

    public void PrintAllStudents()
    {
        Console.WriteLine("Інформація про всіх студентів:");
        foreach (var student in Students)
        {
            Console.WriteLine(student);
        }
    }

    public void PrintStudentsAlphabetically()
    {
        Console.WriteLine("Інформація про всіх студентів в алфавітному порядку:");
        var sortedStudents = Students.OrderBy(s => s.LastName).ThenBy(s => s.FirstName);
        foreach (var student in sortedStudents)
        {
            Console.WriteLine(student);
        }
    }

    public Student FindBestStudent()
    {
        if (Students.Count == 0)
        {
            return null;
        }
        return Students.OrderByDescending(s => s.AverageGrade).First();
    }

    public List<Student> FindStudentsByName(string name)
    {
        return Students.Where(s => s.FirstName == name).ToList();
    }

    public List<Student> FindBirthdayStudents(DateTime date)
    {
        return Students.Where(s => s.DateOfBirth.Day == date.Day && s.DateOfBirth.Month == date.Month).ToList();
    }
}
